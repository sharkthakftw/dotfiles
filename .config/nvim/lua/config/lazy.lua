require("lazy").setup({
  { import = "plugins.core" },
  { import = "plugins.lsp" },
  { import = "plugins.telescope" },
  { import = "plugins.treesitter" },
  { import = "plugins.cmp" },
  { import = "plugins.oil" },
  { import = "plugins.terminal" },

  install = {
    colorscheme = { "camellia" },
  },
  lockfile = false,
})

