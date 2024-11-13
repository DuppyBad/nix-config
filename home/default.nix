# makes hm integrate seamlessly into nixos options
{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: {
  modules = [
    inputs.home-manager.nixosModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = {inherit inputs;};
      };
      home-manager.users.kyrios = {
        imports = [
            inputs.catppuccin.homeManagerModules.catppuccin;
            inputs.spicetify-nix.homeManagerModules.default;
            nvf.homeManagerModules.default
            ];
      };
      ];
    };
}

