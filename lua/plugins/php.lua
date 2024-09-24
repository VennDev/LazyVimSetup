return {
  {
    -- Set Laravel Pint as the default PHP formatter with PHP CS Fixer as a fallback.
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      opts.formatters_by_ft = vim.tbl_extend("force", opts.formatters_by_ft or {}, {
        php = { "php_cs_fixer" },
      })
    end,
  },
  {
    -- Remove phpcs linter.
    "mfussenegger/nvim-lint",
    optional = true,
    opts = function(_, opts)
      opts.linters_by_ft = vim.tbl_extend("force", opts.linters_by_ft or {}, {
        php = {},
      })
    end,
  },
}