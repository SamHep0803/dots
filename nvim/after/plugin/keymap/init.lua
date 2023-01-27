local map = vim.api.nvim_set_keymap
local wk = require("which-key")

map("i", "jj", "<Esc>", {})
map("t", "jj", "<C-\\><C-n>", {})

map("n", "n", "<cmd>NvimTreeToggle<CR>", { silent = true })

map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { silent = true })
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

wk.setup({
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    ["<space>"] = "SPC",
    ["<cr>"] = "RET",
    ["<Tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = '<c-d>', -- binding to scroll down inside the popup
    scroll_up = '<c-u>', -- binding to scroll up inside the popup
  },
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  show_keys = true, -- show the currently pressed key and its label as a message in the command line
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
  -- disable the WhichKey popup for certain buf types and file types.
  -- Disabled by deafult for Telescope
  disable = {
    buftypes = {},
    filetypes = { "TelescopePrompt" },
  },
})

local nmaps = {
  ["<c-\\>"] = {
    name = "Terminal",
    ["<c-\\>"] = "Toggle Terminal",
  },
  ["<c-a>"] = { "ggVG", "Select All" },
  ["<c-p>"] = { "<cmd>Telescope find_files<CR>", "Find files" },
  ["<Tab>"] = { "<cmd>BufferLineCycleNext<CR>", "Next Buffer" },
  ["<S-Tab>"] = { "<cmd>BufferLineCyclePrev<CR>", "Prev Buffer" },
  ["<leader>"] = {
    b = {
      b = { "<cmd>Telescope buffers <CR>", "List buffers" },
      d = { "<cmd>bd<CR>", "Close Buffer" },
      O = { "<cmd>%bd|e#|bd#<CR>|'\"", "Close all other buffers" },
      ["]"] = { "<cmd>BufferLineMoveNext<CR>", "Buf Move Right" },
      ["["] = { "<cmd>BufferLineMovePrev<CR>", "Buf Move Left" },
    },
    q = { "<cmd>qa<CR>", "Quit Neovim" },
    n = { "<cmd>NvimTreeToggle<CR>", "File Tree" },
    f = {
      name = "Find",
      f = { "<cmd>Telescope find_files<CR>", "Files" },
      w = { "<cmd>Telescope live_grep<CR>", "Grep" },
      o = { "<cmd>Telescope oldfiles<CR>", "Old Files" },
      a = { "<cmd>Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
      h = { "<cmd>Telescope help_tags <CR>", "help page" },
      d = { "<cmd>lua require('telescope.builtin').find_files {cwd = os.getenv('HOME') .. '/.dots/nvim'}<CR>",
        "Dotfiles" }
    },
    l = {
      name = "lsp",
      ["."] = { "<cmd>Lspsaga code_action<CR>", "Code Actions" },
      k = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Open Diagnostic Float" },
      r = {
        name = "Refactor",
        r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
      },
      i = { "<cmd>LspInfo<CR>", "LSP Info" }
    },
    x = { "<cmd>bp | :bd #<CR>", "Close Buffer" },
    w = {
      name = "Window",
      h = { "<c-w>h", "Focus Left" },
      j = { "<c-w>j", "Focus Down" },
      k = { "<c-w>k", "Focus Up" },
      l = { "<c-w>l", "Focus Right" },
      v = { "<c-w>v", "Vertical Split" },
      s = { "<c-w>s", "Horizontal Split" },
      d = { "<c-w>q", "Quit Window" },
    },
    o = {
      name = "Open",
      t = { "<cmd>ToggleTerm direction=float<CR>", "Float Terminal" },
      T = { "<cmd>ToggleTerm direction=horizontal<CR>", "Horizontal Terminal" },
    },
    s = { "<cmd>SymbolsOutline<CR>", "Symbols Outline" },
    t = { "<cmd>ToggleTerm direction=float<CR>", "Float Terminal" },
    z = { "<cmd>ZenMode<CR>", "Toggle Zen Mode" },
    ["<tab>"] = { "<cmd>Telescope buffers<CR>", "Show Buffers" },
    ["<leader>"] = { "<cmd>Telescope find_files<CR>", "Find File" }
  },
  ["gcc"] = { "Comment Current Line" },
  ["gbc"] = { "Block Comment Current Line" },
}

local vmaps = {
  ["<c-c>"] = { '"+y', "Copy to Clipboard" },
  ["<leader>"] = {
    c = { "Comment Selection" },
  },
  ["gc"] = { "Comment Selection" },
  ["gb"] = { "Block Comment Selection" },
}

wk.register(nmaps, { mode = "n", noremap = true, silent = true })
wk.register(vmaps, { mode = "v", noremap = true, silent = true })
