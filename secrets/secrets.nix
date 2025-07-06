# secrets.nix - age encryption rules for agenix CLI (not imported by NixOS config)
let
  # Define public keys that should be able to decrypt each secret:
  surajp = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH6KV9XjGPj/pvAb9YmFIome/RUc0UyLcnmhGyzDV0a1";
  users = [ surajp ];

  workLaptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJgVT9S2xuiFGZe0I7Dot6qlOFMB4eq0brIa6sdzVcnG";
  systems = [ workLaptop ];
in {
  "tailscale_secret.age".publicKeys = [ surajp workLaptop ];
}

