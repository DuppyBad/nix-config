{pkgs, ...}: {
  # Bootloader.
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      systemd-boot.configurationLimit = 10;
    };
  };

  #Thinkpad T14 specifics
  boot.kernelParams = ["acpi_backlight=native" "psmouse.synaptics_intertouch=0"];

  imports = [
    ./hardware-configuration.nix
    ../../modules
    ../common.nix
  ];

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # ensures hyprlock can access the PAM
  security.pam.services.hyprlock = {};
  # same for fprintd
  security.pam.services.hyprlock.fprintAuth = true;
  services.fprintd.enable = true;

  # Polkit for in GUI authentication
  security.polkit.enable = true;
  virtualisation.docker.enable = true;

  # Make hostName configured at a higher level
  networking = {
    hostName = "mercury";
    networkmanager.enable = true;
    nameservers = ["9.9.9.9" "1.1.1.1"];
  };
  users.defaultUserShell = pkgs.fish;
  security.rtkit.enable = true;
  # Is alsa enable needed?
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  # We should separate the pkgs so that we can enable via gui.enable, tui.enable, laptop.enable, desktop.enable....
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
    pavucontrol
  ];
  # Sets ozone hinting so xwayland apps with wayland support use wayland instead
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";
  console.keyMap = "uk";

  environment = {
    etc.hosts.mode = "0644";
    variables.EDITOR = "nvim";
  };

  programs.hyprland.enable = true;
  programs.nm-applet.enable = true;

  users.users.kyrios = {
    isNormalUser = true;
    home = "/home/kyrios";
    extraGroups = ["wheel" "networkmanager" "docker"];
    shell = pkgs.fish;
  };

  #programs.ssh.startAgent = true;
  #clashes with some phantasmal gnome interface?
  programs.steam.enable = true;
  programs.fish.enable = true;
  system.stateVersion = "24.11"; # structure is built from the first invocation
}
