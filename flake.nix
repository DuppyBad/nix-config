{
  description = "Luminary Control";

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: {
    nixosConfigurations = {
      mercury = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/mercury
          ./home
          inputs.home-manager.nixosModules.home-manager
        ];
      };
      sun = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/sun
          ./home
          inputs.home-manager.nixosModules.home-manager
        ];
      };
      moon = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/moon
        ];
      };
    };
  };
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf/main";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
    };
  };
}
