{
  description = "Kyrios' attempt at reaching Gnosis(It's a terrible flake)";

  outputs = { self, ...} @ inputs: let
    hosts = import ./hosts {inherit inputs;};
  in {
    nixosConfigurations = hosts;
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
