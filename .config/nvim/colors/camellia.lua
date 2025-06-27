local colors = {
  bg = '#1A1B1F',
  midbg = '#202124',
  lightbg = '#2A2B2F',
  darkgrey = '#3B3C3F',
  grey = '#7F8083',
  fg_dark = '#A0A1A4',
  fg_mid = '#B8B9BB',
  fg = '#DADBDD',

  red = '#D04A3B',
  pink = '#C75465',
  orange = '#D37838',
  gold = '#D9A72C',
  lime = '#65AD5F',
  teal = '#5BCBB2',
  blue = '#4993C6',
  violet = '#8F63CC',
}

vim.cmd 'highlight clear'
vim.cmd 'syntax reset'
vim.o.termguicolors = true
vim.g.colors_name = 'camellia'

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- UI
hi('Normal', { fg = colors.fg, bg = colors.bg })
hi('NormalNC', { fg = colors.fg_mid, bg = colors.bg })
hi('Comment', { fg = colors.grey, italic = true })
hi('Cursor', { fg = colors.bg, bg = colors.fg })
hi('CursorLine', { bg = colors.midbg })
hi('CursorColumn', { bg = colors.midbg })
hi('Visual', { bg = colors.darkgrey })
hi('LineNr', { fg = colors.darkgrey })
hi('CursorLineNr', { fg = colors.fg, bold = true })
hi('VertSplit', { fg = colors.darkgrey })
hi('StatusLine', { fg = colors.fg, bg = colors.midbg })
hi('StatusLineNC', { fg = colors.grey, bg = colors.bg })
hi('Pmenu', { fg = colors.fg, bg = colors.midbg })
hi('PmenuSel', { fg = colors.bg, bg = colors.teal })
hi('PmenuSbar', { bg = colors.darkgrey })
hi('PmenuThumb', { bg = colors.grey })

-- Syntax
hi('Identifier', { fg = colors.blue })
hi('Function', { fg = colors.violet })
hi('Statement', { fg = colors.pink })
hi('Keyword', { fg = colors.pink, italic = true })
hi('Conditional', { fg = colors.pink })
hi('Repeat', { fg = colors.pink })
hi('Operator', { fg = colors.fg })
hi('Constant', { fg = colors.gold })
hi('String', { fg = colors.lime })
hi('Character', { fg = colors.orange })
hi('Number', { fg = colors.gold })
hi('Boolean', { fg = colors.orange })
hi('Float', { fg = colors.gold })
hi('Type', { fg = colors.teal })
hi('Special', { fg = colors.teal })

-- Diagnostics (LSP)
hi('DiagnosticError', { fg = colors.red })
hi('DiagnosticWarn', { fg = colors.orange })
hi('DiagnosticInfo', { fg = colors.blue })
hi('DiagnosticHint', { fg = colors.teal })

-- Telescope
hi('TelescopeNormal', { fg = colors.fg, bg = colors.bg })
hi('TelescopeSelection', { fg = colors.fg, bg = colors.midbg })
hi('TelescopeBorder', { fg = colors.darkgrey })
hi('TelescopePromptBorder', { fg = colors.teal })
hi('TelescopePromptPrefix', { fg = colors.pink })
hi('TelescopeMatching', { fg = colors.gold, bold = true })

-- Git
hi('DiffAdd', { bg = '#27332A' })
hi('DiffChange', { bg = '#2C3444' })
hi('DiffDelete', { bg = '#402626' })
hi('DiffText', { bg = '#43556E' })

-- LSP references
hi('LspReferenceText', { bg = colors.lightbg })
hi('LspReferenceRead', { bg = colors.lightbg })
hi('LspReferenceWrite', { bg = colors.lightbg })

-- TreeSitter
hi('@variable', { fg = colors.fg })
hi('@function', { fg = colors.violet })
hi('@type', { fg = colors.teal })
hi('@keyword', { fg = colors.pink, italic = true })
hi('@string', { fg = colors.lime })
hi('@number', { fg = colors.gold })
hi('@boolean', { fg = colors.orange })
hi('@comment', { fg = colors.grey, italic = true })
