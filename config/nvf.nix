{
  enable = true;
  settings = {
    vim = {
      viAlias = true;
      vimAlias = false;
      lsp.enable = true;

      languages = {
        enableLSP = true;
        enableFormat = true;
        enableTreesitter = true;
        enableExtraDiagnostics = true;
        nix.enable = true;
        python.enable = true;
      };
      visuals = {
        enable = true;
        nvimWebDevicons.enable = true;
        scrollBar.enable = true;
        smoothScroll.enable = true;
        fidget-nvim.enable = true;

        cursorline = {
          enable = true;
          lineTimeout = 0;
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
        style =  "mocha";
        transparent = false;
      };
      autopairs.enable = true;

      autocomplete = {
        enable = true;
        type = "nvim-cmp";
      };
      filetree = {
        nvimTree = {
          enable = true;
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

     terminal = {
       toggleterm = {
         enable = true;
         lazygit.enable = true;
       };
     };
     ui ={
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
          desc =  "Save current file";
        };
    "<leader>wq" = {
          action = ":wqa<CR>";
          silent = true;
          desc = "Save all files and quit";
        };
      }; 
    };
  };
}
