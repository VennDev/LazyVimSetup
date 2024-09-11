-- ~/.config/nvim/lua/plugins/nonels.lua

return {
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      local composer_globa_dir = vim.fn.expand("$HOME/.config/composer")
      local composer_global_bin_dir = composer_globa_dir .. "/vendor/bin"

      vim.list_extend(opts.sources,
        {
          nls.builtins.formatting.phpcsfixer.with({
            command = composer_global_bin_dir .. "/php-cs-fixer",
            extra_args = {
              "--config",
              composer_globa_dir .. "/.php_cs_fixer.php",
            },
          }),
          nls.builtins.diagnostics.phpstan.with({
            command = composer_global_bin_dir .. "/phpstan",
            extra_args = { "-l", "max" },
          }),
        }
      )
    end,
  },
}

