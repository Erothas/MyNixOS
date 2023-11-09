{ config, pkgs, ... }:

{

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      vim-sandwich
      vim-css-color
      suda-vim
      vim-highlightedyank
    ];
    extraLuaConfig =  ''
    	vim.opt.termguicolors = true
    	-- Makes neovim and host OS clipboard play nicely with each other
    	vim.opt.clipboard = 'unnamedplus'
    	-- Better editor UI
    	vim.opt.number = true
    	vim.opt.numberwidth = 2
    	vim.opt.relativenumber = true
    	vim.opt.cursorline = true
    	-- Decrease update time
    	vim.opt.timeoutlen = 500
    	vim.opt.updatetime = 200
    	-- Number of screen lines to keep above and below the cursor
    	vim.opt.scrolloff = 8
    	-- Undo and backup options
    	vim.opt.backup = false
    	vim.opt.writebackup = false
    	vim.opt.undofile = true
    	vim.opt.swapfile = false
    	-- Case insensitive searching UNLESS /C or capital in search
    	vim.opt.ignorecase = true
    	vim.opt.smartcase = true
    	-- Better editing experience
    	vim.opt.expandtab = true
    	vim.opt.smarttab = true
    	vim.opt.cindent = true
    	vim.opt.autoindent = true
    	vim.opt.wrap = true
    	vim.opt.textwidth = 300
    	vim.opt.tabstop = 4
    	vim.opt.shiftwidth = 4
    	vim.opt.softtabstop = -1 -- If negative, shiftwidth value is used
    	-- Remember 50 items in commandline history
    	vim.opt.history = 50
	'';

    extraConfig = ''
      ${builtins.readFile ./config/statusline.vim}
    '';
  };


}
