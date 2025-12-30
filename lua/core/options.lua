local opt = vim.opt

vim.g.mapleader = " "

opt.number = true
opt.relativenumber = true

opt.autoindent = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.smarttab = true
opt.expandtab = true

opt.scrolloff = 9999
opt.termguicolors = true
opt.laststatus = 3
opt.cmdheight = 0
opt.winborder = "rounded"
opt.autoread = true

opt.foldmethod = "expr"
opt.foldlevel = 20
opt.foldenable = false
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldtext = "v:lua.vim.treesitter.foldtext()"
