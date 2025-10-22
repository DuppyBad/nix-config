{
  pkgs,
  lib,
  inputs,
  ...
}: {
  programs.niri = {
    settings = {
      binds = {
      };
    };
  };
}
