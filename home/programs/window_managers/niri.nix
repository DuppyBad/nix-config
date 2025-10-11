{
  pkgs,
  lib,
  inputs,
  ...
}: {
  programs.niri = {
    enable = true;
    settings = {
      binds = {
      };
    };
  };
}
