{ inputs, ... }: {
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    # defaultEditor = true;
    # plugins.lualine.enable = true;

    # opts = {
    #   termguicolors = true;
    #   number = true;
    #   mouse = "a";
    #   mousefocus = true; 
    #   relativenumber = true;
    #   timeoutlen = 400;
    #   updatetime = 250;
    #   # TODO: vim.opt.shortmess:append 'A'
    #   showmode = false;
      
    #   # Identation
    #   expandtab = 2;
    #   shiftwidth = 2;
    #   tabstop = 2;
    #   smartindent = true;
    #   breakindent = true;

    #   # Search settings
    #   ignorecase = true;
    #   smartcase = true;

    #   # Whitespaces
    #   list = true;
    #   listchars = {
    #     tab = "» ";
    #     trail = "·";
    #     nbsp = "␣";
    #   };

    #   signcolumn = "yes:1";
    #   completeopt = "menuone,noinsert";
    #   laststatus = 3;
    #   statusline = "%{%g:currentmode[mode()]%} %{%reg_recording()%} %* %t | %y | %* %= c:%c l:%l/%L %p%% %#NonText# %*";
    #   # Hide cmdline when unused
    #   cmdheight = 0;

    #   # Split right and below by default 
    #   splitright = true;
    #   splitbelow = true;

    #   # Tabline
    #   showtabline = 1;
    #   # Windowline
    #   winbar = "%f";

    #   # Don't automatically continue comments 
    #   "formatoptions:remove" = [ "c" "r" "o" ];

    #   # Scroll before end of window 
    #   scrolloff = 5;

    #   # Conceal level (0=disabled)
    #   conceallevel = 0;
    # };

    # diagnostic.settings = {
    #   virtual_text = true;
    #   underline = true;
    #   signs = true;
    # };
  };
}