vim.cmd 'highlight clear'
vim.cmd 'syntax reset'
vim.g.colors_name = 'oxocarbon'

local set = vim.api.nvim_set_hl

local c = {
  bg = '#161616',
  bg_alt = '#1e1e1e',
  fg = '#e0e0e0',
  fg_dim = '#b5b5b5',
  comment = '#5c5c5c',
  blue = '#6199d6',
  cyan = '#2fa4cb',
  green = '#3aa16e',
  yellow = '#d0b441',
  orange = '#cc6e3e',
  red = '#cc4f6c',
  purple = '#9b7fc7',
  magenta = '#c678dd',
}

-- UI
set(0, 'Normal', { fg = c.fg, bg = c.bg })
set(0, 'NormalNC', { fg = c.fg_dim, bg = c.bg })
set(0, 'LineNr', { fg = c.comment, bg = c.bg })
set(0, 'CursorLine', { bg = c.bg_alt })
set(0, 'CursorLineNr', { fg = c.fg, bold = true })
set(0, 'Visual', { bg = c.bg_alt })
set(0, 'StatusLine', { fg = c.fg, bg = c.bg_alt })
set(0, 'StatusLineNC', { fg = c.comment, bg = c.bg_alt })

-- Syntax
set(0, 'Comment', { fg = c.comment, italic = true })
set(0, 'Constant', { fg = c.cyan })
set(0, 'String', { fg = c.green })
set(0, 'Character', { fg = c.orange })
set(0, 'Number', { fg = c.orange })
set(0, 'Boolean', { fg = c.orange })
set(0, 'Identifier', { fg = c.fg })
set(0, 'Function', { fg = c.blue })
set(0, 'Statement', { fg = c.purple })
set(0, 'Conditional', { fg = c.red })
set(0, 'Repeat', { fg = c.red })
set(0, 'Label', { fg = c.yellow })
set(0, 'Operator', { fg = c.fg })
set(0, 'Keyword', { fg = c.magenta })
set(0, 'Exception', { fg = c.red })
set(0, 'PreProc', { fg = c.yellow })
set(0, 'Type', { fg = c.yellow })
set(0, 'Special', { fg = c.cyan })
set(0, 'Underlined', { underline = true })

-- Diagnostics
set(0, 'DiagnosticError', { fg = c.red })
set(0, 'DiagnosticWarn', { fg = c.yellow })
set(0, 'DiagnosticInfo', { fg = c.blue })
set(0, 'DiagnosticHint', { fg = c.cyan })
