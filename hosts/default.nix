{inputs, ...}: {
  sun = import ./sun {inherit inputs;};
  moon = import ./moon {inherit inputs;};
  imports = [./common.nix];
}
