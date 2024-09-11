return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
  },
  lazy = false,
  config = function()
    local alpha = require "alpha"
    local dashboard = require "alpha.themes.dashboard"
	
	
	local logo = [[
	
	
		██╗   ██╗███████╗███╗   ██╗███╗   ██╗██████╗ ███████╗██╗   ██╗
		██║   ██║██╔════╝████╗  ██║████╗  ██║██╔══██╗██╔════╝██║   ██║
		██║   ██║█████╗  ██╔██╗ ██║██╔██╗ ██║██║  ██║█████╗  ██║   ██║
		╚██╗ ██╔╝██╔══╝  ██║╚██╗██║██║╚██╗██║██║  ██║██╔══╝  ╚██╗ ██╔╝
		 ╚████╔╝ ███████╗██║ ╚████║██║ ╚████║██████╔╝███████╗ ╚████╔╝ 
		  ╚═══╝  ╚══════╝╚═╝  ╚═══╝╚═╝  ╚═══╝╚═════╝ ╚══════╝  ╚═══╝  
		  
									Github: https://github.com/VennDev
	]]

    dashboard.section.header.val = vim.split(logo, "\n", { trimempty = true })
    alpha.setup(dashboard.config)
  end,
}