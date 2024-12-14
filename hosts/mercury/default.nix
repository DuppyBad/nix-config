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

  # ensures hyprlock can access the PAM
  security.pam.services.hyprlock = {};

  # Polkit for in GUI authentication
  security.polkit.enable = true;
  virtualisation.docker.enable = true;

  # Make hostName configured at a higher level
  networking.hostName = "mercury";
  networking.networkmanager.enable = true;
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
  # Pending for removal
  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
  };

  users.users.kyrios = {
    isNormalUser = true;
    home = "/home/kyrios";
    extraGroups = ["wheel" "networkmanager" "docker"];
    shell = pkgs.fish;
  };

  programs.fish.enable = true;
  system.stateVersion = "24.11"; # structure is built from the first invocation
}
