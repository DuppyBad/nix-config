# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../modules
  ];

  # Use the systemd-boot EFI boot loader.
  boot = {
    loader = {
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        useOSProber = true;
        catppuccin.enable = true;
        catppuccin.flavor = "mocha";
      };
      efi.efiSysMountPoint = "/boot/efi";
      efi.canTouchEfiVariables = true;
    };
    plymouth = {
      enable = true;
      font = "${pkgs.jetbrains-mono}/share/fonts/truetype/JetBrainsMono-Regular.ttf";
      themePackages = [pkgs.catppuccin-plymouth];
      theme = "catppuccin-macchiato";
    };
  };

  security.pam.services.hyprlock = {};

  # allows us to easily edit etc/hosts for name resolutions
  environment.etc.hosts.mode = "0644";
  environment.variables.EDITOR = "nvim";

  virtualisation.docker.enable = true;
  # When we have to run random binaries
  programs.nix-ld.enable = true;

  # Nvidia pain
  hardware = {
    graphics.enable = true;
    nvidia = {
      open = false;
      modesetting.enable = true;
    };
  };
  services.xserver.videoDrivers = ["nvidia"];

  networking = {
    hostName = "sun";
    nameservers = ["9.9.9.9" "1.1.1.1"];
  };

  # Time + Locale
  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    xkb.layout = "gb";
  };
  programs.hyprland.enable = true;
  programs.steam.enable = true;

  console.keyMap = "uk";
  users.defaultUserShell = pkgs.fish;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    # config for low latency output
  };

  users.users.kyrios = {
    isNormalUser = true;
    extraGroups = ["wheel" "docker"];
    packages = with pkgs; [
      firefox
      fastfetch
      bottom
    ];
  };
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    fish
    acpi
    wireplumber
    pavucontrol
  ];
  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["IosevkaTerm"];})
    iosevka
    noto-fonts
    noto-fonts-cjk-sans
    cm_unicode
  ];

  programs.fish.enable = true;
  programs.ssh.startAgent = true;
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  # Don't CHANGE THE STATEVER!!!!!!!!!!!!!!
  system.stateVersion = "24.05";
}
