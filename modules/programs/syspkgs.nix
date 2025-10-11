{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    vim
    neovim
    wget
    git
    fish
    acpi
    bottom
    wireplumber
    pavucontrol
    xdg-desktop-portal-gtk
  ];
}
