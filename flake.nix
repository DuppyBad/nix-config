{
  description = "Mekhanes Control";

  inputs = {
    # NixOS official package source, unstable because we are bleeding edge fanatics
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # Home manager etc goes here later
    home-mamager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    # Nixvim because we NEED more vim power
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    catppuccin.url = "github:catppuccin/nix";
    nixvim-config.url = "github:duppybad/nixvim-config";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixvim,
    nixvim-config,
    catppuccin,
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

        # home manager as a module
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = {inherit inputs;};
          home-manager.users.kyrios = {
            imports = [
              ./home.nix
              catppuccin.homeManagerModules.catppuccin
              nixvim.homeManagerModules.nixvim
            ];
          };

          # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
        }
      ];
    };
  };
}
