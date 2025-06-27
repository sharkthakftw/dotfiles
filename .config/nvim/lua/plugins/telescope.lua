return {
  { -- Telescope
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { height = 0.9 },
        file_ignore_patterns = { "node_modules", "%.git/", "/Games" },
      },
    },
  },
  { -- Nicer dialogs
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
    require("telescope").load_extension("ui-select")
    end,
  },
  { -- File browser
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
    require("telescope").setup({
      extensions = {
        file_browser = {
          hidden = true,
          respect_gitignore = false,
        },
      },
    })
    require("telescope").load_extension("file_browser")
    end,
  },
}
