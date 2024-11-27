{
  config,
  lib,
  ...
}: {
  options.modules.system.hardware = {
    nvidia = {
      enable = lib.mkEnableOption "Nvidia Graphics Drivers";
    };
    amd = {
      enable = lib.mkEnableOption "AMD Graphics Drivers";
    };
  };
}
