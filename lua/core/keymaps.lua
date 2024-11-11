-- Keymaps for better default experience

-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- For conciseness
local opts = { noremap = true, silent = true }

-- Disable the spacebar key's default behavior in Normal and Visual modes
-- vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Allow moving the cursor through wrapped lines with j, k and arrow keys
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = "move cursor up through wrapped lines" })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = "move cursor down through wrapped lines" })
vim.keymap.set('n', '<Down>', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = "move cursor down through wrapped lines" })
vim.keymap.set('n', '<Up>', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = "move cursor up through wrapped lines" })

-- Clear highlights
vim.keymap.set('n', '<Esc>', ':noh<CR>', { noremap = true, silent = true, desc = "clear search highlights" })

-- Save file
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', { noremap = true, silent = true, desc = "save file" })

-- Save file without auto-formatting
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w <CR>', { noremap = true, silent = true, desc = "save without formatting" })

-- Quit file
vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', { noremap = true, silent = true, desc = "quit file" })

-- Delete single character without copying into register
vim.keymap.set('n', 'x', '"_x', { noremap = true, silent = true, desc = "delete character without yanking" })

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true, desc = "scroll down and center" })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true, desc = "scroll up and center" })

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', { noremap = true, silent = true, desc = "center screen on next search result" })
vim.keymap.set('n', 'N', 'Nzzzv', { noremap = true, silent = true, desc = "center screen on previous search result" })

-- Resize with Ctrl + arrow keys instead of just arrow keys
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', { noremap = true, silent = true, desc = "decrease window height" })
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', { noremap = true, silent = true, desc = "increase window height" })
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { noremap = true, silent = true, desc = "decrease window width" })
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { noremap = true, silent = true, desc = "increase window width" })

-- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true, desc = "go to next buffer" })
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { noremap = true, silent = true, desc = "go to previous buffer" })
vim.keymap.set('n', '<leader>x', ':Bdelete!<CR>', { noremap = true, silent = true, desc = "close buffer" })
vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>', { noremap = true, silent = true, desc = "open new buffer" })

-- Increment/decrement numbers
vim.keymap.set('n', '<leader>+', '<C-a>', { noremap = true, silent = true, desc = "increment number" })
vim.keymap.set('n', '<leader>-', '<C-x>', { noremap = true, silent = true, desc = "decrement number" })

-- Window management
vim.keymap.set('n', '<leader>v', '<C-w>v', { noremap = true, silent = true, desc = "split window vertically" })
vim.keymap.set('n', '<leader>h', '<C-w>s', { noremap = true, silent = true, desc = "split window horizontally" })
vim.keymap.set('n', '<leader>se', '<C-w>=', { noremap = true, silent = true, desc = "equalize split windows" })
vim.keymap.set('n', '<leader>xs', ':close<CR>', { noremap = true, silent = true, desc = "close split window" })

-- Navigate between splits
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', { noremap = true, silent = true, desc = "move to upper split" })
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', { noremap = true, silent = true, desc = "move to lower split" })
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', { noremap = true, silent = true, desc = "move to left split" })
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', { noremap = true, silent = true, desc = "move to right split" })

-- Tabs
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', { noremap = true, silent = true, desc = "open new tab" })
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', { noremap = true, silent = true, desc = "close current tab" })
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', { noremap = true, silent = true, desc = "go to next tab" })
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', { noremap = true, silent = true, desc = "go to previous tab" })

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', { noremap = true, silent = true, desc = "toggle line wrapping" })

-- Press jk fast to exit insert mode
vim.keymap.set('i', 'jk', '<ESC>', { noremap = true, silent = true, desc = "exit insert mode quickly" })
vim.keymap.set('i', 'kj', '<ESC>', { noremap = true, silent = true, desc = "exit insert mode quickly" })

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true, desc = "indent left and stay in visual mode" })
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true, desc = "indent right and stay in visual mode" })

-- Move text up and down
vim.keymap.set('v', '<A-j>', ':m .+1<CR>==', { noremap = true, silent = true, desc = "move selected text down" })
vim.keymap.set('v', '<A-k>', ':m .-2<CR>==', { noremap = true, silent = true, desc = "move selected text up" })

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', { noremap = true, silent = true, desc = "paste without overwriting yank register" })

-- Replace word under cursor
vim.keymap.set('n', '<leader>j', '*``cgn', { noremap = true, silent = true, desc = "replace word under cursor" })

-- Explicitly yank to system clipboard (highlighted and entire row)
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { noremap = true, silent = true, desc = "yank to system clipboard" })
vim.keymap.set('n', '<leader>Y', [["+Y]], { noremap = true, silent = true, desc = "yank line to system clipboard" })

-- Save and load session
vim.keymap.set('n', '<leader>ss', ':w<CR>', { noremap = true, silent = false, desc = "save current file" })
vim.keymap.set('n', '<leader>sq', ':wq<CR>', { noremap = true, silent = false, desc = "save and quit" })
vim.keymap.set('n', '<leader>q', ':q<CR>', { noremap = true, silent = false, desc = "close current file" })

--CUSTOM KEYS
vim.opt.laststatus = 0
