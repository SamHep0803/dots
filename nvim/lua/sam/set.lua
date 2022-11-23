--[[ opts.lua ]]

local opt = vim.opt

--opt.colorcolumn = "80"
opt.number = true
opt.relativenumber = true
opt.scrolloff = 4
opt.signcolumn = "yes"

opt.syntax = "ON"
--opt.termguicolors = true
--vim.cmd([[colorscheme dracula]])

opt.guifont = string.format("%s:h%s", vim.g.gui_font_face, vim.g.gui_font_size)

opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = false

opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4

opt.splitright = false
opt.splitbelow = true

vim.opt.undofile = true

opt.clipboard = "unnamed"

opt.timeoutlen = 200

opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
