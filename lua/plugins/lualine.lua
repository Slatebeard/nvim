return {
  'nvim-lualine/lualine.nvim',
  config = function()
    -- Import the Tokyo Night colors
    local colors = require("tokyonight.colors").setup()

    local tokyonight_theme = {
      normal = {
        a = { fg = colors.bg, bg = colors.blue, gui = 'bold' },
        b = { fg = colors.fg, bg = colors.bg_highlight },
        c = { fg = colors.fg, bg = colors.bg },
      },
      command = { a = { fg = colors.bg, bg = colors.yellow, gui = 'bold' } },
      insert = { a = { fg = colors.bg, bg = colors.green, gui = 'bold' } },
      visual = { a = { fg = colors.bg, bg = colors.magenta, gui = 'bold' } },
      terminal = { a = { fg = colors.bg, bg = colors.cyan, gui = 'bold' } },
      replace = { a = { fg = colors.bg, bg = colors.red, gui = 'bold' } },
      inactive = {
        a = { fg = colors.fg_dark, bg = colors.bg, gui = 'bold' },
        b = { fg = colors.fg_dark, bg = colors.bg },
        c = { fg = colors.fg_dark, bg = colors.bg },
      },
    }

    -- Define themes table and include Tokyo Night
    local themes = {
      onedark = onedark_theme,
      nord = 'nord',
      tokyonight = tokyonight_theme,
    }

    -- Retrieve environment variable for theme, defaulting to Tokyo Night
    local env_var_nvim_theme = os.getenv 'NVIM_THEME' or 'tokyonight'

    local mode = {
      'mode',
      fmt = function(str)
        return ' ' .. str
      end,
    }

    local filename = {
      'filename',
      file_status = true,
      path = 0,
    }

    local hide_in_width = function()
      return vim.fn.winwidth(0) > 100
    end

    local diagnostics = {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      sections = { 'error', 'warn' },
      symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
      colored = false,
      update_in_insert = false,
      always_visible = false,
      cond = hide_in_width,
    }

    local diff = {
      'diff',
      colored = false,
      symbols = { added = ' ', modified = ' ', removed = ' ' },
      cond = hide_in_width,
    }

    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = themes[env_var_nvim_theme],
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        disabled_filetypes = { 'alpha', 'neo-tree', 'Avante' },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { mode },
        lualine_b = { 'branch' },
        lualine_c = { filename },
        lualine_x = { diagnostics, diff, { 'encoding', cond = hide_in_width }, { 'filetype', cond = hide_in_width } },
        lualine_y = { 'location' },
        lualine_z = { 'progress' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { { 'location', padding = 0 } },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { 'fugitive' },
    }
  end,
}

