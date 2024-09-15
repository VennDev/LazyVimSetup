return {
	{
		"rcarriga/nvim-notify",
		enabled = false,
	},
	{
		"stevearc/dressing.nvim",
		enabled = true,
	},
	{
		"folke/noice.nvim",
		enabled = false,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		opts = {
			indent = {
				char = "▏",
			},
		},
	},
	{
		"echasnovski/mini.indentscope",
		opts = { symbol = "▏" },
	},
	{
		"NvChad/nvim-colorizer.lua",
		event = "BufRead",
		config = true,
	},
}