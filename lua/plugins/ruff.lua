return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
      "jayp0521/mason-null-ls.nvim", -- ensure dependencies are installed
    },
    config = function()
      -- list of formatters & linters for mason to install
      require("mason-null-ls").setup({
        ensure_installed = {
          -- "ruff",
          "prettier",
          "shfmt",
        },
        automatic_installation = true,
      })

      local null_ls = require("null-ls")
      local sources = {
        -- require("none-ls.formatting.ruff").with({ extra_args = { "--extend-select", "I" } }),
        -- require("none-ls.formatting.ruff_format"),
        null_ls.builtins.formatting.prettier.with({ filetypes = { "json", "yaml", "markdown" } }),
        null_ls.builtins.formatting.shfmt.with({ args = { "-i", "4" } }),
      }

      null_ls.setup({
        -- debug = true, -- Enable debug mode. Inspect logs with :NullLsLog.
        sources = sources,
        -- Auto-formatting on save has been removed here!
      })
    end,
  },
}
