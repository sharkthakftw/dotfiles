local opt = vim.opt
local cmd = vim.cmd

-- My muted camellia palette color scheme
cmd.colorscheme 'camellia'

-- UI
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.termguicolors = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.showmode = true
opt.cmdheight = 0

-- Tabs & Indentations
opt.tabstop = 2
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true
opt.wrap = false
opt.breakindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Files
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.autoread = true

-- Mouse and clipboard
opt.mouse = 'a'
opt.clipboard = 'unnamedplus'

-- Behaviour
opt.splitright = true
opt.splitbelow = true
opt.equalalways = true
opt.confirm = true

-- Text Display
opt.showbreak = "↪ "
opt.list = true
opt.listchars = {
  tab = "» ",
  trail = "·",
  nbsp = "␣"
}

