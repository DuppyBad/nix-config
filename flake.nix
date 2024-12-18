{
  description = "Luminary Control";

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    system = "x86_64-linux";
  in {
    nixosConfigurations = {
      sun = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [./hosts/sun];
        inherit self inputs;
      };
      mercury = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [./hosts/mercury];
      };
      moon = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [./hosts/moon];
        inherit self inputs;
      };
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
