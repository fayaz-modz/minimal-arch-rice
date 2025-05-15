local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Change directory
keymap('n', '<leader>,', ':cd ..<CR>', { desc = "Change to parent directory" })

-- Pane navigation
keymap('n', '<C-k>', '<C-w>k', { desc = "Move to pane above" })
keymap('n', '<C-j>', '<C-w>j', { desc = "Move to pane below" })
keymap('n', '<C-h>', '<C-w>h', { desc = "Move to left pane" })
keymap('n', '<C-l>', '<C-w>l', { desc = "Move to right pane" })

-- Split window
keymap('n', '<C-/>', ':sb<CR>', { desc = "Open buffer in split" })
keymap('n', '<C-\\>', ':vs<CR>', { desc = "Vertical split" })

-- Tab navigation
keymap('n', '<leader>tc', ':tabnew<CR>', { desc = "Open new tab" })
keymap('n', '<leader>tx', ':tabclose<CR>', { desc = "Close current tab" })
keymap('n', '<leader>tn', ':tabNext<CR>', { desc = "Next tab" })
keymap('n', '<leader>tp', ':tabprevious<CR>', { desc = "Previous tab" })

-- Save and quit
keymap({ 'n', 'v' }, '<leader>w', ':w<CR>', { desc = "Save file" })
keymap('n', '<leader>q', ':q<CR>', { desc = "Quit file" })
keymap('i', '<M-w>', '<C-o>:w<CR>', {desc = "Save file"})

-- General navigation
keymap({ 'n', 'v' }, 'H', '8k', { desc = "Move 8 lines up" })
keymap({ 'n', 'v' }, 'L', '8j', { desc = "Move 8 lines down" })
keymap({ 'n', 'v' }, '<C-d>', '<C-d>zz', { desc = "Page down with centering" })
keymap({ 'n', 'v' }, '<C-u>', '<C-u>zz', { desc = "Page up with centering" })
keymap({ 'n', 'v' }, '<C-l>', '$', { desc = "Goto end of line" })
keymap({ 'n', 'v' }, '<C-h>', '^', { desc = "Goto beginning of line" })
keymap('n', 'J', 'mzJ`z', { desc = "Join lines with cursor reposition" })
keymap('n', 'n', 'nzzzv', { desc = "Next search result centered" })
keymap('n', 'N', 'Nzzzv', { desc = "Previous search result centered" })

-- Insert mode navigation
keymap('i', '<C-h>', '<C-o>^', { desc = "Go to beginning of line" })
keymap('i', '<C-l>', '<END>', { desc = "Go to end of line" })

-- Clipboard operations
keymap({ 'n', 'v' }, '<leader>y', '"+y', { desc = "Copy to system clipboard" })
keymap('n', '<leader>Y', '"+Y', { desc = "Copy line to system clipboard" })
keymap({ 'n', 'v' }, '<leader>p', '"+p', { desc = "Paste from system clipboard" })
keymap('n', '<leader>P', '"+P', { desc = "Paste above from system clipboard" })-- Line shifting

-- Move lines
keymap('v', 'J', ":m '>+1<CR>gv=gv", { desc = "Move line down" })
keymap('v', 'K', ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Delete without copy
keymap('n', '<leader>d', [["_dP]], { desc = "Delete without copy" })
keymap('n', 'x', '"_x', opts)

-- Formatting
keymap('n', '<leader>f', vim.lsp.buf.format, { desc = "Format code" })

-- reload file
keymap("n", "<leader>rr", ":checktime<CR>", { noremap = true, silent = true })

-- Search highlight clear
keymap('n', '<leader>h', ':nohlsearch<CR>', { desc = "Clear search highlight" })

-- escape using double ;
keymap('i', ';;', '<ESC>', { desc = "Escape" })
keymap('i', ';<leader>', '; ', { desc = "Escape" })
keymap('i', '<C-c>', '<ESC>', { desc = "Normal mode" })
