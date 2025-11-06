{
  pkgs,
  inputs,
  ...
}:
# Contains the full per user configuration
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = ".bak";
    extraSpecialArgs = {inherit inputs;};
    users.kyrios = {
      imports = [
        inputs.spicetify-nix.homeManagerModules.default
        inputs.nvf.homeManagerModules.default
        ./programs
        ./system
        inputs.catppuccin.homeModules.catppuccin
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
          #NIXOS_OZONE_WL = "1";
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
          name = "Adwaita";
        };
        font = {
          name = "Iosevka";
          size = 13;
        };
        gtk3 = {
          extraConfig = {
            gtk-application-prefer-dark-theme = 1;
          };
        };
        gtk4 = {
          extraConfig = {
            gtk-application-prefer-dark-theme = 1;
          };
        };
      };

      qt = {
        enable = true;
        style.name = "kvantum";
      };
      xdg.portal.enable = true;
      xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
      dconf.settings = {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
        };
      };
    };
  };
}
