require'nvim-web-devicons'.get_icon(filename, extension, options)
local icons = require("config.icons")
return {
	--[[{
		'xiyaowong/nvim-transparent',
		enable = true,
		extra_groups = {
			'lualine_a',
			'lualine_b',
			'lualine_c',
			'lualine_x',
			'lualine_y',
			'lualine_z',
		},
	},]]--
	{
		"nvim-lualine/lualine.nvim",
		event = "User LazyFile",
		opts = {
		  options = {
			globalstatus = true,
			theme = {
				normal = {
					a = { fg = '#ffffff', bg = '#005f87', gui = 'bold' },
					b = { fg = '#ffffff', bg = '#000000' },
					c = { fg = '#8c8c8c', bg = 'none' },
				},
				insert = {
					a = { fg = '#ffffff', bg = '#008700', gui = 'bold' },
				},
				visual = {
					a = { fg = '#ffffff', bg = '#73267a', gui = 'bold' },
				},
				replace = {
					a = { fg = '#ffffff', bg = '#870000', gui = 'bold' },
				},
				command = {
					a = { fg = '#ffffff', bg = '#cf913a', gui = 'bold' },
				},
				terminal = {
					a = { fg = '#ffffff', bg = '#99034c', gui = 'bold' },
				},
			},
			section_separators = { left = '', right = '' },
			component_separators = { left = '|', right = '|' },
		  },
		  sections = {
			lualine_a = { { "mode", icon = "" } },
			lualine_b = { "branch" },
			lualine_c = {
			  {
				"filename",
				path = 4,
				symbols = {
				  modified = icons.file.modified,
				  readonly = icons.file.readonly,
				  unnamed = icons.file.unnamed,
				  newfile = icons.file.newfile,
				},
			  },
			  {
				"diagnostics",
				symbols = {
				  error = icons.diagnostics.error .. " ",
				  warn = icons.diagnostics.warn .. " ",
				  info = icons.diagnostics.info .. " ",
				  hint = icons.diagnostics.hint .. " ",
				},
			  },
			},
			lualine_x = {
			  {
				function()
				  return require("noice").api.status.command.get()
				end,
				cond = function()
				  return package.loaded["noice"] and require("noice").api.status.command.has()
				end,
				color = "Statement",
			  },
			  {
				"diff",
				symbols = {
				  added = icons.diff.added .. " ",
				  modified = icons.diff.modified .. " ",
				  removed = icons.diff.deleted .. " ",
				},
				source = function()
				  local gitsigns = vim.b.gitsigns_status_dict
				  if gitsigns then
					return {
					  added = gitsigns.added,
					  modified = gitsigns.changed,
					  removed = gitsigns.removed,
					}
				  end
				end,
			  },
			},
			lualine_y = { "filetype", "fileformat", "encoding" },
			lualine_z = { { "S:%c L:%l:%L", type = "stl" } },
		  },
		  extensions = { "quickfix", "lazy", "neo-tree" },
		},
	},
}