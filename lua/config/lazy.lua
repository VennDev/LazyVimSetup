local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- General/Global LSP Configuration
local api = vim.api
local lsp = vim.lsp

local make_client_capabilities = lsp.protocol.make_client_capabilities
function lsp.protocol.make_client_capabilities()
    local caps = make_client_capabilities()
    if not (caps.workspace or {}).didChangeWatchedFiles then
        vim.notify(
            'lsp capability didChangeWatchedFiles is already disabled',
            vim.log.levels.WARN
        )
    else
        caps.workspace.didChangeWatchedFiles = nil
    end

    return caps
end

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import/override with your plugins
    { import = "plugins" },
	
	-- Themes
	-- { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},
	-- { "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {}, },
	-- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "rebelot/kanagawa.nvim" },
	-- Or with configuration
	--[[{
	  'projekt0n/github-nvim-theme',
	  lazy = false, -- make sure we load this during startup if it is your main colorscheme
	  priority = 1000, -- make sure to load this before all the other start plugins
	  config = function()
		require('github-theme').setup({
		  -- ...
		})

		vim.cmd('colorscheme github_dark')
	  end,
	},]]--
	--[[{
	  "xero/miasma.nvim",
	  lazy = false,
	  priority = 1000,
	  config = function()
		vim.cmd("colorscheme miasma")
	  end,
	},]]--
	--[[{
		"ramojus/mellifluous.nvim",
		-- version = "v0.*", -- uncomment for stable config (some features might be missed if/when v1 comes out)
		config = function()
			require("mellifluous").setup({}) -- optional, see configuration section.
			vim.cmd("colorscheme mellifluous")
		end,
	},]]--
	
	-- Some plugins addition
	{'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{'f-person/git-blame.nvim'},
	{'nvim-tree/nvim-web-devicons'},
	{
	  'stevearc/conform.nvim',
	  opts = {},
	},
	-- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
	{
		'numToStr/Comment.nvim',
		opts = {
			-- add any options here
		}
	},
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = {},
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
