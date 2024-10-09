{
  description = "NixOS system config control";

  inputs = {
    # NixOS official package source, unstable because we are bleeding edge fanatics
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # Everything that isn't nixpkgs
    home-mamager= {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
      };
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixvim,
    catppuccin,
    ...
  } @ inputs: {
    overlays.additions = final: _prev: {
    #  nixvim = nixvim-config.packages.${_prev.system}.default;
    };
    nixosConfigurations = {
      # Desktop config for mekhanes 
      mekhanes = nixpkgs.lib.nixosSystem {
        modules = [./hosts/mekhanes/configuration.nix];
      };
      machina = nixpkgs.lib.nixosSystem {
        modules = [./hosts/mekhanes/configuration.nix];
      };


    };
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
    nixosConfigurations.machina = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/machina/configuration.nix
        # Make home manager common? make the users common? Don't reuse full paragraphs

      ];
    };
  };
}
