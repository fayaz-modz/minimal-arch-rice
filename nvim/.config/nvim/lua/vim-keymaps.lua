local keymap = vim.keymap.set

-- Wrapping toggle
keymap('n', '<M-w>', ':set nowrap<CR>', { desc = "Toggle line wrapping" })

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
keymap('n', '<leader>tn', ':tabnew<CR>', { desc = "Open new tab" })
keymap('n', '<leader>tp', ':tabprevious<CR>', { desc = "Previous tab" })

-- Save and quit
keymap('n', '<leader>w', ':w<CR>', { desc = "Save file" })
keymap('n', '<leader>q', ':q<CR>', { desc = "Quit file" })
keymap('v', '<leader>w', ':w<CR>', { desc = "Save file" })
keymap('v', '<leader>q', ':q<CR>', { desc = "Quit file" })

-- General navigation
keymap('n', 'H', '8k', { desc = "Move 8 lines up" })
keymap('n', 'L', '8j', { desc = "Move 8 lines down" })
keymap('n', 'J', 'mzJ`z', { desc = "Join lines with cursor reposition" })
keymap('n', '<C-d>', '<C-d>zz', { desc = "Page down with centering" })
keymap('n', '<C-u>', '<C-u>zz', { desc = "Page up with centering" })
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
keymap('v', 'J', ":m '>+1<CR>gv=gv", { desc = "Move line down" })
keymap('v', 'K', ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Formatting
keymap('n', '<leader>f', vim.lsp.buf.format, { desc = "Format code" })

-- Search highlight clear
keymap('n', '<leader>h', ':nohlsearch<CR>', { desc = "Clear search highlight" })

-- escape using double ;
keymap('i', ';;', '<ESC>', { desc = "Escape" })
