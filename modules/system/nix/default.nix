{
  pkgs,
  lib,
  ...
}: {
  imports = [./nixpkgs.nix];
  nix = {
    # Learnt about most of these options whilst reading bloxx12/nichts
    package = pkgs.lix;
    channel.enable = lib.mkForce false;
    settings = {
      allowed-users = ["root" "@wheel"];
      trusted-users = ["root" "@wheel"];
      warn-dirty = false;
      extra-experimental-features = ["flakes" "nix-command"];
      http-connections = 50;
      accept-flake-config = false;
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
      persistent = false;
    };
    optimise = {
      automatic = true;
      # only takes lists of strings
      dates = ["20:00"];
    };
  };
  # switches to the faster version of switch
  # ng is now the only switch, can probably remove section
}
