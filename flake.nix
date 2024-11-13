{
  description = "Kyrios' attempt at reaching Gnosis(It's a terrible flake)";

  outputs = {self, ...} @ inputs: let
    hosts = import ./hosts {inherit inputs;};
  in {
    nixosConfigurations = hosts;
  };
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-mamager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
