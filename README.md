# Overview

This Nix flake defines a modular NixOS configuration for both a local workstation and a remote server. It is built on NixOS 25.05 (x86_64-linux) and demonstrates how to split configuration into reusable modules. The flake integrates **agenix** for managing sensitive files (like GPG and SSH keys) via age encryption, without using Home Manager.

# Structure

- *Common modules* (`modules/common`) define base system settings (bootloader, filesystems, networking, etc.) shared by all hosts.
- *Local (workstation) modules* (`modules/local`) include desktop environment setup, development tools, GUI applications, etc., and a `user.nix` defining the local user account. These are only imported for the local machine.
- *Host configurations* (`hosts/local.nix` and `hosts/remote.nix`) import the appropriate modules for each host and set any host-specific options (like `networking.hostName`). The flake outputs two NixOS configurations named **`local`** and **`remote`**.

# Using this flake

1. **Enable Flakes:** Make sure Nix and NixOS are configured to allow flakes (add `experimental-features = nix-command flakes` in `/etc/nix/nix.conf`).  
2. **Local Deployment:** On the local machine (workstation), clone or place this flake in `/etc/nixos` (replacing the old configuration). Then run:  
   ```bash
   sudo nixos-rebuild switch --flake .#local
   ```
   This builds and activates the NixOS system defined by nixosConfigurations.local.
3. **Remote Deployment:** For the remote server, first adjust hosts/remote-hardware.nix with the actual hardware configuration (by generating a hardware-configuration.nix on that server).
   Ensure the server's SSH is accessible (the config enables SSH and adds your user to wheel for sudo). Then from your local machine, deploy to the remote:
   ```bash
   sudo nixos-rebuild switch --flake path/to/flake#remote \
        --target-host root@<REMOTE_IP> --build-host localhost
   ```
  This will build the system closure locally and then upload and activate it on the remote host.
  The remote `hostName` and other specifics can be adjusted in `hosts/remote.nix`.

# Managing Secrets with agenix:

- The flake uses **agenix** to keep secrets (like private keys) encrypted at rest.
  Encrypted secrets are stored in the secrets/ directory as .age files. For example, gpg-key.age and ssh-key.age correspond to a GPG private key and an SSH private key.
- **Encryption keys:** Edit the file secrets.nix to list the public keys that can decrypt each secret.
  For instance, you might include your workstation's SSH public key for gpg-key.age, and the server's SSH host key or your personal key for server-ssh.age, etc.
  This file is used by the agenix CLI to know recipients when editing secrets (it's not imported by NixOS configuration).
- **Editing secrets:** Use the agenix CLI to add or update secret files.
  The provided devShell includes agenix for convenience.
  For example, to edit gpg-key.age:
  ```bash
  nix develop -c agenix -e secrets/gpg-key.age
  ```
  This will prompt you (in `$EDITOR`) to paste the secret's content (e.g., the private key text).
  The file will be saved encrypted with the designated recipients' public keys.
- **Decryption at runtime:** The NixOS configurations declare `age.secrets` for each secret (see `hosts/local.nix` and `hosts/remote.nix`).
  At switch time, the agenix module will decrypt those files into memory and make them available at `/run/agenix/<name>` (accessible only to `root` by default). For example, the local user's GPG key will be decrypted to `/run/agenix/gpg-key` when the system activates. You can then use or import this secret file in scripts or services (ensuring proper permissions).

> **Note:** The `age.identityPaths` option is set to look for an SSH private key in `/root/.ssh` on each host. This means the machine will use that key to decrypt secrets at activation.
> Ensure that the corresponding private key (for a listed recipient in `secrets.nix`) is present on the machine.
> For example, for the local host you might use your user’s SSH key (copied to `/root/.ssh/id_ed25519`) or generate a new age key pair.
> On the remote server, you can place the necessary private key in `/root/.ssh` (or adjust `identityPaths`) so that it can decrypt its secrets.
> Future changes: This flake is set to always use the latest NixOS 25.05 updates (no fixed revision pin in flake.nix beyond what’s in flake.lock).
> To update all packages and NixOS itself, run nix flake update and rebuild. The flake can be extended to additional hosts by adding new entries in `nixosConfigurations` and creating corresponding module sets.
> *Home Manager* integration is not included here (user environment is managed entirely via NixOS modules), but can be added later if needed.

