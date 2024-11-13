# Main Host
# Nvidia 3080ti evil machine

{inputs}:
inputs.nixpkgs.lib.nixosSystem {
  system = "x86-64-linux";
  specialArgs = {inherit inputs;};

  modules = [
    ./hardware-configuration.nix
    ./configuration.nix

    #TODO modularise home so we can include it here
  ];
}
