return {
    {
--	"folke/tokyonight.nvim",
--	config = function()
--	    vim.cmd.colorscheme "tokyonight"
--	end
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000, -- Make sure it loads first
	config = function()
	    require("tokyonight").setup({
		style = "night", -- This is the specific dark variant in the video
		styles = {
		    comments = { italic = true }, -- Enables the slanted comments
		    keywords = { italic = true },
		    functions = {},
		    variables = {},
		},
	    })
	    -- Set the colorscheme
	    vim.cmd.colorscheme("tokyonight")
	end,
    },
    {
	"nvim-lualine/lualine.nvim",
	dependencies = {
	    "nvim-tree/nvim-web-devicons",
	},
	opts = {
	    theme = "tokyonight",
	}
    },
}
