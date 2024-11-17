{pkgs, ...}:
# Contains the full per user configuration
{
  home = {
    # moving to 25.05, home manager is behind
    enableNixpkgsReleaseCheck = false;
    username = "kyrios";
    homeDirectory = "/home/kyrios";
    # Don't you dare change the stateVersion
    stateVersion = "23.11";
    #  pointerCursor = {
    # gtk.enable = true;
    # package = pkgs.catppuccin-cursors.mochaDark;
    # size = 28;
    # name = "catppuccin-mocha-dark-cursors";
    #};
  };
  # colour theming stuff
  catppuccin = {
    enable = true;
    accent = "mauve"; #mauve is default, here for clarity
    flavor = "mocha"; # mocha is also default
  };

  gtk = {
    enable = true;

    font = {
      name = "Iosevka";
      size = 13;
    };
  };
  imports = [./programs];
}
