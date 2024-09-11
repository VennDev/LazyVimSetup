-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

local lsp = require 'lsp-zero'

lsp.configure('intelephense', {
    settings = {
        intelephense = {
            telemetry = {
                enabled = false
            },
            environment = {
                includePaths = {
                    "[...redacted...]/phpunit/vendor/**"
                }
            }
        }
    }
})

vim.g.startup_dir = vim.fn.getcwd()
local lspconfig = require('lspconfig')

lspconfig.intelephense.setup({
  cmd = {"intelephense"},
  filetypes = {"php"},
  root_dir = function()
    return vim.g.startup_dir
  end,
  settings = {
    intelephense = {
      environment = {
        phpVersion = '8.3',
      },
      files = {
        maxSize = 5000000,
      },
    },
  },
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['omnisharp'].setup {
  capabilities = capabilities
}
