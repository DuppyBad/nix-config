# Moon host config
# Lenovo IdeaPad from 2021, 4gb ram monster
{inputs}:
inputs.nixpkgs.lib.nixosSystem {
  system = "x86_64-linux";
  specialArgs = {inherit inputs;};

  modules = [
    # Hardware config
    ./hardware-configuration.nix

    # Other config
    ./configuration.nix
  ];
}
