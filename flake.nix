{
  description = "Mekhanes Control";

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixvim,
    nixvim-config,
    catppuccin,
    spicetify-nix,
    hyprpanel,
    ...
  } @ inputs: {
    overlays.additions = final: _prev: {
      nixvim = nixvim-config.packages.${_prev.system}.default;
    };
    nixosConfigurations.mekhanes = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # We still need the non-flake config so import it
        ./system/configuration.nix

        # module order example
        catppuccin.nixosModules.catppuccin
        inputs.spicetify-nix.nixosModules.default

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
