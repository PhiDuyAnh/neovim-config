-- return {
--     "nvim-treesitter/nvim-treesitter",
--     build = ":TSUpdate",
--     config = function()
-- 	local configs = require("nvim-treesitter.configs")	 
-- 	configs.setup({
-- 	    highlight = {
-- 		enable = true,
-- 	    },
-- 	    indent = { enable = true },
-- 	    autotag = { enable = true },
-- 	    ensure_installed = {
-- 		"lua",
-- 		"python",
-- 		"vim",
-- 		"vimdoc",
-- 		"query",
-- 		"markdown",
-- 		"markdown_inline",
-- 	    },
-- 	    auto_install = false,
-- 	})
--     end
-- }
return {
    "nvim-treesitter/nvim-treesitter",
    -- IMPORTANT: The new version explicitly requires lazy loading to be disabled
    lazy = false, 
    build = ":TSUpdate",
    config = function()
        -- 1. Setup is now optional, but installing languages is done via a new function
        require("nvim-treesitter").install({
            "lua",
            "python",
            "vim",
            "vimdoc",
            "query",
            "markdown",
            "markdown_inline",
        })

        -- 2. Highlighting is no longer handled by the plugin. 
        -- You must tell Neovim's core API to start Treesitter for files.
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "*", -- Run on all filetypes
            callback = function()
                -- pcall is used here to safely ignore files where a parser isn't installed yet
                pcall(vim.treesitter.start)
            end,
        })

        -- 3. Indentation is also handled via Neovim core now
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "*",
            callback = function()
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,
}
