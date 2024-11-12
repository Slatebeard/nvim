require 'core.options' -- Load general options
require 'core.keymaps' -- Load general keymaps
-- require 'core.snippets' -- Custom code snippets
-- CUSTOM SETTINGS
-- Disable the welcome message and start with an empty buffer
vim.opt.shortmess:append "I"  -- Hides the welcome message
vim.cmd "autocmd VimEnter * enew"  -- Opens a blank buffer on startup
vim.opt.laststatus = 0
vim.opt.guicursor = ""
-- Set cursor shape for each mode
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"

-- Load custom autocommands
require 'core.autocmd' -- Add this line to load autocmd.lua

-- Install package manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Setup plugins
require('lazy').setup({
  -- Tokyo Night colorscheme
 {
    'folke/tokyonight.nvim',
    config = function()
      require('tokyonight').setup({
        style = 'night', -- You can also set 'storm', 'day', 'moon'
        transparent = true, -- Enable transparency
      })

      -- Apply transparency settings to various highlight groups
      vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "FidgetNormal", { bg = "NONE", fg = "#a9b1d6" })
      -- Additional transparency settings
      vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "TabLine", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "TabLineSel", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "TabLineFill", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "PmenuSel", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "WinSeparator", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "VertSplit", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "LspFloatWin", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "LspDiagnosticsVirtualTextError", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "LspDiagnosticsVirtualTextWarning", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "LspDiagnosticsVirtualTextInfo", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "LspDiagnosticsVirtualTextHint", { bg = "NONE" })

      vim.cmd[[colorscheme tokyonight]] -- Activate colorscheme
    end,
  },
{
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
},

  -- Load other plugins
  require 'plugins.bufferline',
  require 'plugins.telescope',
  require 'plugins.treesitter',
  require 'plugins.lsp',
  require 'plugins.autocompletion',
  -- require 'plugins.none-ls',
  require 'plugins.lualine',
  require 'plugins.neo-tree',
  -- require 'plugins.alpha',
  -- require 'plugins.indent-blankline',
  -- require 'plugins.lazygit',
  -- require 'plugins.comment',
  -- require 'plugins.debug',
  -- require 'plugins.gitsigns',
  -- require 'plugins.database',
  -- require 'plugins.misc',
  -- require 'plugins.harpoon',
  -- require 'plugins.avante',
  -- require 'plugins.chatgpt',
  -- require 'plugins.aerial',
  require 'plugins.which-key',
  --require 'plugins.slimline'
  require 'plugins.fidget',
}, {
  rocks = { enabled = true }, -- Disable hererocks
  ui = {
    -- If you have a Nerd Font, set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- Function to check if a file exists
local function file_exists(file)
  local f = io.open(file, 'r')
  if f then
    f:close()
    return true
  else
    return false
  end
end

-- Path to the session file
local session_file = '.session.vim'

-- Check if the session file exists in the current directory
if file_exists(session_file) then
  -- Source the session file
  vim.cmd('source ' .. session_file)
end

vim.cmd([[autocmd VimEnter * redraw!]])
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

-- BuildJar
vim.cmd([[
  command! BuildJar execute '!javac -d bin $(find src -name "*.java") && jar cfe demo.jar $(basename $(find src -name "Main.java" | sed "s/\\.java$//")) -C bin .'
]])

