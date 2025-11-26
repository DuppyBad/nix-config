{
  lib,
  pkgs,
  ...
}: {
  # List of LSPs used within Helix
  home.packages = with pkgs; [
    nil # Nix LSP
    rust-analyzer
    ruff # Python Linter
    clang-tools # All things C
    tinymist # Typst LSP
    basedpyright
  ];
  programs.helix.languages = {
    # this has to be the worst possible format to do this
    # If a language has a default server in the helix docs, it is auto-configured
    # when the server is installed
    language = [
      {
        name = "nix";
        auto-format = true;
        formatter = {
          command = "${lib.getExe pkgs.alejandra}";
          args = ["-q"];
        };
      }
      {
        name = "rust";
        auto-format = true;
      }
      {
        name = "python";
        language-servers = ["basedpyright" "ruff"];
        auto-format = true;
      }
    ];
    language-server = {
      ruff = {
        command = lib.getExe pkgs.ruff;
        args = ["server"];
      };
      rust-analyzer = {
        config.check = {
          command = "clippy";
        };
      };
      #nil = {
      #  command = lib.getExe pkgs.nil;
      #  config.nil.formatting.command = ["${lib.getExe pkgs.alejandra}" "-q"];
      #};
      #    pyright = {
      #     command = lib.getExe pkgs.basedpyright;
      #    args = ["-"];
      #     config = {
      #      reportMissingTypeStubs = false;
      #    };
      #  };
    };
  };
}
