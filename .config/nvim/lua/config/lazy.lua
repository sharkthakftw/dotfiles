require("lazy").setup({
  { import = "plugins.core" },
  { import = "plugins.lsp" },
  { import = "plugins.telescope" },
  { import = "plugins.treesitter" },
  { import = "plugins.cmp" },
  { import = "plugins.oil" },
  { import = "plugins.dashboard" },

  install = {
    colorscheme = { "camellia" },
  },
  lockfile = false,
})

