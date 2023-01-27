local saga = require("lspsaga")
require("mason").setup()
require("mason-lspconfig").setup()

saga.init_lsp_saga({
  definition_action_keys = {
    quit = '<ESC>',
  },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

require("mason-lspconfig").setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function(server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {
      capabilities = capabilities
    }
    require("lspconfig").sumneko_lua.setup({
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })
  end,
  ["tailwindcss"] = function()
    require("lspconfig").tailwindcss.setup({
      on_attach = on_attach
    })
  end
}

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
