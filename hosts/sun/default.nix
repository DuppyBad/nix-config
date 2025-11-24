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
    ../common.nix
  ];

  # grub for dualboot
  # Revise this setup soon, check for pretter versions of the bootloader
  boot = {
    loader = {
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        useOSProber = true;
      };
      efi.efiSysMountPoint = "/boot/efi";
      efi.canTouchEfiVariables = true;
    };
    # its just annoying really
    #plymouth = {
    #  enable = true;
    #  font = "${pkgs.jetbrains-mono}/share/fonts/truetype/JetBrainsMono-Regular.ttf";
    #  themePackages = [pkgs.catppuccin-plymouth];
    #  theme = "catppuccin-macchiato";
    #};
  };

  security.pam.services.hyprlock = {};
  # sets ozone for xwayland, portal enables darkmode on gtk4 adwaita
  environment.sessionVariables = {
    # NIXOS_OZONE_WL = "1";
    ADW_DISABLE_PORTAL = "1";
  };

  # allows us to easily edit etc/hosts for name resolutions
  environment.etc.hosts.mode = "0644";
  environment.variables.EDITOR = "nvim";

  virtualisation.docker.enable = true;

  # Nvidia pain
  hardware = {
    graphics.enable = true;
    nvidia = {
      open = true;
      modesetting.enable = true;
      powerManagement = {
        enable = true;
        finegrained = false;
      };
      nvidiaSettings = false;
    };
  };
  # upstream should really rename this to services.video.drivers or something
  services.xserver.videoDrivers = ["nvidia"];

  networking = {
    hostName = "sun";
    #quadnine, cloudflare fallback
    nameservers = ["9.9.9.9" "1.1.1.1"];
    # needed for some VPN applications
    networkmanager.enable = true;
    firewall = {
      # for tailnet advertising
      checkReversePath = "loose";
      # I should probably do port by port but if the tailnet is compromised I'm finished
      trustedInterfaces = ["tailscale0"];
    };
  };

  # Time + Locale
  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";

  programs.hyprland.enable = true;

  programs.steam = {
    enable = true;
  };

  console.keyMap = "uk";
  users.defaultUserShell = pkgs.fish;
  #TODO: add prettier audio module so that headless don't have to load this when we abstract
  security.rtkit.enable = true;
  # audio delays on HDMI occur due to aggressive NVIDIA powerManagement
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
      protonvpn-gui
    ];
  };
  programs.fish.enable = true;
  # conflicts with gnome keyring
  #programs.ssh.startAgent = true;
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
