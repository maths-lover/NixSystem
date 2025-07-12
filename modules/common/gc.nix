{ ... }:

{
  # Automatic nix-store housekeeping
  nix.gc = {
    automatic = true;                 # turn the timer on
    dates     = "daily";             # or "daily",  "03:15",  "Mon *-*-* 04:00", …
    options   = "--delete-older-than 7d";
      # anything that hasn’t been used for 30 days is erased.
      # other favourites:
      #   "--max-freed 20G"   – stop after freeing 20 GiB
      #   "--delete-older-than 14d --compress"
  };

  # compact the store right after GC
  nix.optimise.automatic = true;
}
