{
  description = "Kyrios' attempt at reaching Gnosis(It's a terrible flake)";

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixvim,
    catppuccin,
    spicetify-nix,
    hyprpanel,
    ...
  } @ inputs: {
    nixosConfigurations.mekhanes = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # We still need the non-flake config so import it
        ./hosts/mekhanes/configuration.nix
        #TODO context switch based on host in use
        # module order example
        catppuccin.nixosModules.catppuccin
        # home manager as a module
        home-manager.nixosModules.home-manager
        # hyprpanel test

        {nixpkgs.overlays = [inputs.hyprpanel.overlay];}
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {inherit inputs;};
          };
          home-manager.users.kyrios = {
            imports = [
              ./home.nix
              catppuccin.homeManagerModules.catppuccin
              nixvim.homeManagerModules.nixvim
              inputs.spicetify-nix.homeManagerModules.default
            ];
          };

          # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
        }
      ];
    };
    nixosConfigurations.sun = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/sun/configuration.nix
        # Make home manager common? make the users common? Don't reuse full paragraphs
      ];
    };
    nixosConfigurations.moon = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/moon/configuration.nix
        #TODO make it so that the common is always imported, and the hosts/{name}/ is imported relative to {name}
      ];
    };
  };
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-mamager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    catppuccin.url = "github:catppuccin/nix";
    nixvim-config.url = "github:duppybad/nixvim-config";
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser.url = "github:MarceColl/zen-browser-flake";
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
  };
}
