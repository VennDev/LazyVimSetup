-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Setup for theme
vim.o.background = "" -- or "light" for light mode
vim.cmd("colorscheme kanagawa-dragon")
-- vim.cmd("colorscheme kanagawa")
-- vim.cmd('colorscheme github_dark_default')
-- vim.cmd("colorscheme github_dark_dimmed")
-- vim.cmd("colorscheme github_dark_high_contrast")
-- vim.cmd('colorscheme github_dark_tritanopia')

-- Setup lspconfig for intelephense
require("lspconfig").intelephense.setup({
    cmd = { "intelephense", "--stdio" },
    filetypes = { "php" },
    root_dir = function(pattern)
        return vim.fn.getcwd()
    end,
    settings = {
        intelephense = {
            telemetry = {
                enabled = false,
            },
        },
    },
})

-- conform
require("conform").setup({
    formatters_by_ft = {
		php = { "php-cs-fixer" },
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "isort", "black" },
        -- You can customize some of the format options for the filetype (:help conform.format)
        rust = { "rustfmt", lsp_format = "fallback" },
        -- Conform will run the first available formatter
        javascript = { "prettierd", "prettier", stop_after_first = true },
    },
    format_on_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
        end
        return { timeout_ms = 500, lsp_format = "fallback" }
    end,
})

-- Autocmp
local cmp = require("cmp")
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
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
        ['<CR>'] = cmp.mapping(function(fallback)
		  if cmp.visible() then
			cmp.confirm({ select = true }) -- Chấp nhận gợi ý nếu autocomplete đang hiện
		  else
			fallback() -- Thực hiện hành động mặc định nếu không có gợi ý
		  end
		end),
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "path" },
    },
    capabilities = lsp_capabilities,
})

-- Setup lspconfig with capabilities
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require("lspconfig")["omnisharp"].setup({
    capabilities = capabilities,
})
