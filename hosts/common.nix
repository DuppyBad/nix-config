# Shared config for all machines
{
  config,
  pkgs,
  lib,
  ...
}: {
  user.users.kyrios = {
    isNormalUser = true;
    home = "/home/kyrios";
    extraGroups = ["wheel" "networkmanager" "docker"];
    shell = pkgs.fish;
  };

  nix = {
    package = pkgs.lix;
    channel.enable = lib.mkForce false;
    settings = {
      allowed-users = ["root" "@wheel" "nix-builder"];
      trusted-users = ["root" "@wheel" "nix-builder"];
      warn-dirty = false;
      extra-experimental-features = ["flakes" "nix-command"];
      http-connections = 50;
      accept-flake-config = false;
      auto-optimise-store = true;
    };
    gc = {
      automatic = false;
      dates = "19:00";
      options = "--delete-older-than 1w";
      persistent = false;
    };
    optimise = {
      automatic = true;
      dates = "20:00";
    };
  };

  nixpkgs.config.allowUnfree = true;
  time.timeZone = "Europe/London";
  i18n.defaultLocate = "en_GB.UTF-8";
  console.keyMap = "uk";

  environment = {
    etc.hosts.mode = "0644";
    variables.EDITOR = "nvim";
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["FiraCode" "JetBrainsMono" "Mononoki" "Iosevka"];})
    iosevka
    noto-fonts
    noto-fonts-cjk-sans
    cm_unicode
  ];
}
