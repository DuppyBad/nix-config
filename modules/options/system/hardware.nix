# to define hardware attributes such as gpu (we just want this for nvidia)
{lib, ...}: let
  inherit (lib) mkEnableOption;
in {
  options.modules.system.hardware = {
    nvidia = {
      enable = mkEnableOption "Nvidia Graphics Drivers";
    };
  };
}
