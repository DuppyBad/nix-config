{
    enable = true;
    defaultEditor = true;
    globals.mapleader = " ";

    opts = {
      # Enable relative line numbers
      number = true;
      relativenumber = true;

      # 2 space tabs, just as nix intended
      tabstop = 2;
      softtabstop = 2;
      showtabline = 2;
      expandtab = true;

      # autointent, via spaces
      smartindent = true;
      shiftwidth = 2;
      breakindent = true;

      # incremental search
      hlsearch = true;
      incsearch = true;

      # text wrap
      wrap = true;

      # improve splitting
      splitbelow = true;
      splitright = true;

      # mouse mode on
      mouse = "a";

      # ignore case for improved searching
      ignorecase = true;
      # dont ignore case when caps specified
      smartcase = true;

      grepprg = "rg --vimgrep";

      # faster update time
      updatetime = 50;

      # highlight cursors line
      cursorline = true;
    };
    # Takes a lot of build time
    enableMan = false;
    plugins.cmp.enable = true;
    colorschemes.catppuccin.enable = true;
    plugins.lightline.enable = true;
    plugins.treesitter.enable = true;
    plugins.telescope = {
      enable = true;
      keymaps = {
        "<leader>ff" = "live_grep";
      };
      extensions.fzf-native = {enable = true;};
    };
    plugins.oil.enable = true;
    plugins.nvim-autopairs.enable = true;
    plugins.lsp = {
      enable = true;
      servers = {
        pyright.enable = true;
        ruff-lsp.enable = true;
        nixd.enable = true;
        rust-analyzer.enable = true;
        fsautocomplete.enable = true;
      };
      keymaps.lspBuf = {
        "gd" = "definition";
        "gD" = "references";
        "gt" = "type_definition";
      };
    };
    # We let configuration.nix control programming language versioning
    plugins.lsp.servers.rust-analyzer.installCargo = false;
    plugins.lsp.servers.rust-analyzer.installRustc = false;
  };