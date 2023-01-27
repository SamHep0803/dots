--[[ opts.lua ]]

local opt = vim.opt

--opt.colorcolumn = "80"
opt.number = true
opt.relativenumber = true
opt.scrolloff = 4
opt.signcolumn = "yes"

opt.syntax = "ON"
opt.termguicolors = true
vim.cmd([[colorscheme base16-tomorrow-night]])
vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "bg" })

opt.guifont = string.format("%s:h%s", vim.g.gui_font_face, vim.g.gui_font_size)

opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = false

opt.expandtab = true
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2

vim.wo.wrap = false

opt.splitright = false
opt.splitbelow = true

opt.undofile = true

opt.clipboard = "unnamedplus"

opt.timeoutlen = 200

opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
