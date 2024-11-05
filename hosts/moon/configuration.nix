# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

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

  boot.initrd.luks.devices."luks-4efa839e-2b4c-47ef-b798-c922ead1031d".device = "/dev/disk/by-uuid/4efa839e-2b4c-47ef-b798-c922ead1031d";
  networking.hostName = "moon";
  networking.networkmanager.enable = true;
  users.defaultUserShell = pkgs.fish;
  hardware.pulseaudio.enable = false;
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
    acpi
    psmisc
    rustc
    rustfmt
    clippy
    cargo
    python3
    python311Packages.ipython
  ];
  programs.fish.enable = true;
  system.stateVersion = "23.11"; # Did you read the comment?
}
