{
  pkgs,
  inputs,
  ...
}:
# Contains the full per user configuration
{
  imports = [inputs.home-manager.nixosModules.home-manager];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {inherit inputs;};
    users.kyrios = {
      imports = [
        inputs.catppuccin.homeManagerModules.catppuccin
        inputs.spicetify-nix.homeManagerModules.default
        inputs.nvf.homeManagerModules.default
      ];
      home = {
        username = "kyrios";
        homeDirectory = "/home/kyrios";
        # Don't you dare change the stateVersion
        stateVersion = "23.11";
        pointerCursor = {
          gtk.enable = true;
          package = pkgs.bibata-cursors;
          size = 28;
          name = "Bibata-Modern-Classic";
        };
        # sets only usershell env
        sessionVariables = {
          NIXOS_OZONE_WL = "1";
        };
      };
    };
    # colour theming stuff
    catppuccin = {
      enable = true;
      accent = "mauve"; #mauve is default, here for clarity
      flavor = "mocha"; # mocha is also default
    };

    # gtk is pretty
    gtk = {
      enable = true;
      theme = {
        name = "Adwaita-dark";
        package = pkgs.gnome-themes-extra;
      };
      font = {
        name = "Iosevka";
        size = 13;
      };
    };
    imports = [./programs];
  };
}
