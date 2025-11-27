{ lib, config, ... }:
let
  # Quick set options
  tabsize = 2;
  enable_nerd_fonts = true;
in {
  imports = [
    ./autocmds.nix
    ./colourschemes.nix

    ./plugins
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    imports = [
      ./colourschemes.nix 
      ./autogroups.nix
      ./autocmds.nix
      ./plugins
    ] { inherit pkgs lib config; };

    opts = {
      termguicolors = true;

      number = true;
      relativenumber = true;
      mouse = "a";
      mousefocus = true;

      timeoutlen = 400;
      updatetime = 250;

      # Indent
      expandtab = true;
      shiftwidth = tabsize;
      tabstop = tabsize;
      smartindent = true;
      breakindent = true;

      # Search 
      ignorecase = true;
      smartcase = true;
      hlsearch = true;

      # Whitespace
      list = true;
      listchars.__raw = "{ tab = '» ', trail = '·', nbsp = '␣' }";

      # Info
      inccommand = "split";
      cursorline = true;
      showmode = false;

      scrolloff = 10;

      confirm = true;

      # Command line 
      cmdheight = 0;
    };

    clipboard = {
      providers = {
        wl-copy.enable = true;
        xsel.enable = true;
      };
      register = true;
    };

    globals = {
      mapleader = " ";
      maplocalleader = " ";
      have_nerd_font = enable_nerd_fonts;
    };
  };
}
