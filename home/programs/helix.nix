{
  lib,
  pkgs,
  ...
}: {
  programs.helix = {
    package = pkgs.evil-helix;
    enable = true;
    settings = {
      editor = {
        line-number = "relative";
        color-modes = true;
        indent-guides.render = true;
        lsp = {
          display-inlay-hints = true;
          display-messages = true;
        };
        true-color = true;
        mouse = true;
        soft-wrap.enable = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
      };
    };
    languages = {
      # this has to be the worst possible format to do this
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter = {
            command = "${lib.getExe pkgs.alejandra}";
            args = ["-q"];
          };
        }
      ];
      language-server = {
        nil = {
          command = lib.getExe pkgs.nil;
          config.nil.formatting.command = ["${lib.getExe pkgs.alejandra}" "-q"];
        };
        pyright = {
          command = lib.getExe pkgs.basedpyright;
          args = ["-"];
          config = {
            reportMissingTypeStubs = false;
          };
        };
      };
    };
  };
}
