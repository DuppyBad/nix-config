{
  pkgs,
  lib,
  inputs,
  config,
  ...
}: {
  programs.niri = {
    settings = {
      binds = with config.lib.niri.actions; {
        "Mod+Return".action = spawn "kitty";
      };
    };
  };
}
