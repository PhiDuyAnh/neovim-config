return {
    {
	-- "folke/tokyonight.nvim",
	-- lazy = false,
	-- priority = 1000, -- Make sure it loads first
	-- config = function()
	--     require("tokyonight").setup({
	-- 	style = "night", -- This is the specific dark variant in the video
	-- 	styles = {
	-- 	    comments = { italic = true }, -- Enables the slanted comments
	-- 	    keywords = { italic = true },
	-- 	    functions = {},
	-- 	    variables = {},
	-- 	},
	--     })
	--     -- Set the colorscheme
	--     vim.cmd.colorscheme("tokyonight")
      "catppuccin/nvim",
      name = "catppuccin",
      lazy = false,
      priority = 1000,
      config = function()
          require("catppuccin").setup({
              flavour = "mocha",
              integrations = {
                  cmp = true,
                  neotree = true,
                  treesitter = true,
                  lualine = true,
              },
          })

          vim.cmd.colorscheme("catppuccin-nvim")
	end,
    },
    {
	"nvim-lualine/lualine.nvim",
	dependencies = {
	    "nvim-tree/nvim-web-devicons",
	},
	opts = {
	    -- theme = "tokyonight",
	    theme = "catppuccin-nvim",
	}
    },
}
