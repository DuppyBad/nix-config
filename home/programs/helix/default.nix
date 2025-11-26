{pkgs, ...}: {
  imports = [./languages.nix];
  programs.helix = {
    package = pkgs.evil-helix;
    enable = true;
    settings = {
      keys = {
        normal = {
          space = {
            w = ":write";
            q = ":write-quit-all";
          };
        };
      };
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
  };
}
