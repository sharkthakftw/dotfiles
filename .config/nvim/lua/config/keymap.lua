local map = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader= " "

-- Explorer
map("n", "<leader>se", "<cmd>Telescope file_browser<cr>", { desc = "Open Explorer" })
map("n", "<leader>sE", function()
  require("telescope").extensions.file_browser.file_browser({
    path = "%:p:h", cwd = vim.fn.expand("%:p:h")
  })
end, { desc = "File Browser (current file dir)" })

-- Clear search highlights
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Switch windows with CTRL+<hjkl>
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Move windows with CTRL+SHIFT+<hjkl>
map("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
map("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
map("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
map("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- Telescope keymaps
map("n", "<leader>sf", "<cmd>Telescope find_files<cr>", { desc = "[S]earch [F]iles" })
map("n", "<leader>sg", "<cmd>Telescope live_grep<cr>", { desc = "[S]earch by [G]rep" })
map("n", "<leader>sb", "<cmd>Telescope buffers<cr>", { desc = "[S]earch [B]uffers" })
map("n", "<leader>sh", "<cmd>Telescope help_tags<cr>", { desc = "Help Tags" })
map("n", "<leader>sr", "<cmd>Telescope oldfiles<cr>", { desc = "[S]earch [R]ecent" })
map("n", "<leader>sw", "<cmd>Telescope grep_string<cr>", { desc = "[S]earch Current [W]ord" })

