{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.system.hardware;
  inherit (lib) mkIf;
in {
  config = {
    hardware = {
      graphics = {
        enable = true;
      };
      nvidia = mkIf cfg.nvidia.enable {
        modesetting.enable = true;
        open = false;
        nvidiaSettings = true;
      };
    };
    services.xserver.videoDrivers = mkIf cfg.nvidia.enable ["nvidia"];
  };
}
