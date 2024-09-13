-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.o.background = "" -- or "light" for light mode
vim.cmd("colorscheme kanagawa-dragon")

-- Setup lspconfig for intelephense
require('lspconfig').intelephense.setup({
  cmd = { "intelephense", '--stdio' },
  filetypes = { "php" },
  root_dir = function(pattern)
	  return vim.fn.getcwd()
	end,
  settings = {
    intelephense = {
      telemetry = {
        enabled = false
      },
	  files = {
        maxSize = 1000000;
      }
    }
  }
})

-- Autocmp
local cmp = require('cmp')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
	["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'path' },
  },
  capabilities = lsp_capabilities,
})

-- Setup lspconfig with capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['omnisharp'].setup {
  capabilities = capabilities
}