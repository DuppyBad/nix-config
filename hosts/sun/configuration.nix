{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Enable flakes
  nix.settings.experimental-features = ["flakes" "nix-command"];
  # Dual boot is easier this way
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
  # Setting up the garbage collector
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };
  # setting hardware time for dual boot config
  time.hardwareClockInLocalTime = true;
  nix.settings.auto-optimise-store = true;
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
    nameservers = ["9.9.9.9" "149.112.112.112" "1.1.1.1"];
  };
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    xkb.layout = "gb";
  };
  programs.hyprland.enable = true;
  programs.steam.enable = true;
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
      vesktop
    ];
  };
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    fish
    acpi
    wireplumber
    steam-run-native
    pavucontrol
  ];
  programs.fish.enable = true;
  system.stateVersion = "24.05"; # Did you read the comment?
}
