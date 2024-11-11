return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "moon",
      light_style = "day",
      transparent = true,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "transparent",
        floats = "transparent",
      },
      day_brightness = 0.3,
      dim_inactive = false,
      lualine_bold = false,
      plugins = {
        all = package.loaded.lazy == nil,
        auto = true,
      }
    },
    config = function()
      require("tokyonight").load()
      -- Clear background colors for certain highlight groups
      vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })  
    end
  }
