{
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        viAlias = true;
        vimAlias = false;

        spellcheck = {
          enable = false;
          ignoredFiletypes = ["markdown" "gitcommit" "toggleterm"];
        };

        lsp = {
          formatOnSave = true;
          lightbulb.enable = false;
          lspSignature.enable = true;
          #          lsplines.enable = false;
          # need to do it via diagnostics
        };
        diagnostics = {
          config = {
            virtual_lines = true;
          };
        };

        debugger = {
          nvim-dap = {
            enable = true;
            ui.enable = true;
          };
        };
        languages = {
          enableLSP = true;
          enableFormat = true;
          enableTreesitter = true;
          enableExtraDiagnostics = true;
          rust.enable = true;
          nix.enable = true;
          python.enable = true;
          markdown.enable = true;
          ts.enable = true;
          bash.enable = true;
          html.enable = true;
          typst.enable = true;
          typst.format.enable = true;
        };
        visuals = {
          nvim-web-devicons.enable = true;
          nvim-scrollbar.enable = true;
          cinnamon-nvim.enable = true;
          fidget-nvim.enable = true;
          indent-blankline.enable = true;

          nvim-cursorline = {
            enable = true;
            setupOpts.lineTimeout = 0;
          };
        };

        statusline = {
          lualine = {
            enable = true;
            theme = "catppuccin";
          };
        };

        theme = {
          enable = true;
          name = "catppuccin";
          style = "mocha";
          transparent = false;
        };

        autopairs = {
          nvim-autopairs.enable = true;
        };

        autocomplete = {
          nvim-cmp.enable = true;
        };

        filetree = {
          nvimTree = {
            enable = false;
          };
        };

        tabline = {
          nvimBufferline.enable = true;
        };

        treesitter.context.enable = true;

        binds = {
          whichKey.enable = true;
          cheatsheet.enable = true;
        };

        telescope.enable = true;

        git = {
          enable = true;
          gitsigns.enable = true;
        };

        notify = {
          nvim-notify.enable = true;
        };

        terminal = {
          toggleterm = {
            enable = true;
            lazygit.enable = true;
          };
        };

        ui = {
          borders.enable = true;
          noice.enable = true;
          colorizer.enable = true;
          breadcrumbs = {
            enable = true;
          };
          smartcolumn = {
            enable = true;
          };
          fastaction.enable = true;
        };
        comments = {
          comment-nvim.enable = true;
        };
        maps.normal = {
          "<leader>w" = {
            action = ":w<CR>";
            silent = true;
            desc = "Save current file";
          };
          "<leader>wq" = {
            action = ":wqa<CR>";
            silent = true;
            desc = "Save all files and quit";
          };
        };
      };
    };
  };
}
