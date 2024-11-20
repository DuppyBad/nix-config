{
  description = "Luminary Control";

  outputs = {
    self,
    nixpkgs,
    home-manager,
    catppuccin,
    spicetify-nix,
    nvf,
    ...
  } @ inputs: {
    nixosConfigurations.sun = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # We still need the non-flake config so import it
        ./hosts/sun
        # module order example
        catppuccin.nixosModules.catppuccin
        inputs.spicetify-nix.nixosModules.default
        inputs.nvf.nixosModules.default
        # home manager as a module
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {inherit inputs;};
          };
          home-manager.users.kyrios = {
            imports = [
              ./home
              catppuccin.homeManagerModules.catppuccin
              inputs.spicetify-nix.homeManagerModules.default
              nvf.homeManagerModules.default
            ];
          };
        }
      ];
    };
    nixosConfigurations.moon = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # We still need the non-flake config so import it
        ./hosts/moon
        # module order example
        catppuccin.nixosModules.catppuccin
        inputs.spicetify-nix.nixosModules.default
        inputs.nvf.nixosModules.default
        # home manager as a module
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {inherit inputs;};
          };
          home-manager.users.kyrios = {
            imports = [
              ./home
              catppuccin.homeManagerModules.catppuccin
              inputs.spicetify-nix.homeManagerModules.default
              nvf.homeManagerModules.default
            ];
          };
        }
      ];
    };
  };
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-mamager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    catppuccin.url = "github:catppuccin/nix";
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf";
    };
  };
}
