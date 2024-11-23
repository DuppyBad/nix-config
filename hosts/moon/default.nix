# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  inputs,
  ...
}: {
  # Bootloader.
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      systemd-boot.configurationLimit = 10;
    };
    plymouth = {
      enable = true;
    };
    initrd.systemd.enable = true;
  };

  imports = [
    ./hardware-configuration.nix
    ../../modules
    ../common.nix
  ];
  security.pam.services.hyprlock = {};

  boot.initrd.luks.devices."luks-4efa839e-2b4c-47ef-b798-c922ead1031d".device = "/dev/disk/by-uuid/4efa839e-2b4c-47ef-b798-c922ead1031d";

  security.polkit.enable = true;
  virtualisation.docker.enable = true;

  networking.hostName = "moon";
  networking.networkmanager.enable = true;
  users.defaultUserShell = pkgs.fish;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  environment.systemPackages = with pkgs; [
    vim
    wget
    neovim
    firefox
    git
    fish
    wireplumber
    acpi
    networkmanagerapplet
  ];

  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";
  console.keyMap = "uk";

  environment = {
    etc.hosts.mode = "0644";
    variables.EDITOR = "nvim";
  };
  programs.hyprland.enable = true;
  programs.nm-applet.enable = true;
  services.xserver.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  users.users.kyrios = {
    isNormalUser = true;
    home = "/home/kyrios";
    extraGroups = ["wheel" "networkmanager" "docker"];
    shell = pkgs.fish;
  };

  programs.fish.enable = true;
  system.stateVersion = "23.11"; # Did you read the comment?
}
