{
  pkgs,
  inputs,
  ...
}:
# Contains the full per user configuration
{
  home = {
    username = "kyrios";
    homeDirectory = "/home/kyrios";
    # Don't you dare change the stateVersion
    stateVersion = "23.11";
  };
  # colour theming stuff
  catppuccin = {
    enable = true;
    accent = "mauve"; #mauve is default, here for clarity
    flavor = "mocha"; # mocha is also default
  };
  imports = [./config];
}
