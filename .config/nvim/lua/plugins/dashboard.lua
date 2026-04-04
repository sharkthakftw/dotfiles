return {
  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { {'nvim-tree/nvim-web-devicons'} },
    config = function()
      local dashboard = require('dashboard')

      dashboard.setup({
        theme = 'hyper',
        disable_move = true,
        config = {
          header = {
            '',
            ' ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
            ' ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
            ' ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
            ' ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
            ' ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
            ' ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
            '',
          },
          shortcut = {
            { desc = 'Explorer', group = 'DashboardShortCut', key = 'e', action = 'Telescope file_browser' },
            { desc = 'Recent Files', group = 'DashboardShortCut', key = 'r', action = 'Telescope oldfiles' },
            { desc = 'Lazy', group = 'DashboardShortCut', key = 'l', action = 'Lazy' },
            { desc = 'Quit', group = 'DashboardShortCut', key = 'q', action = 'q' },
          },
          footer = { '', 'Hi, Sarthak' },
          highlight = {
            DashboardHeader = { fg = '#c75465' },
            DashboardShortCut = { fg = '#c75465' },
          },
        },
      })

      vim.api.nvim_create_autocmd('VimEnter', {
        callback = function()
          if vim.fn.argc() == 0 and vim.fn.line2byte(1) == -1 then
            require('dashboard'):instance()
          end
        end,
      })
    end,
  },
}
