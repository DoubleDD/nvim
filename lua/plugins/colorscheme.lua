return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = -1,
    opts = {},
    config = function()
      vim.cmd([[colorscheme tokyonight]])
      require("tokyonight").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        style = "night",                         -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        -- light_style = "day", -- The theme is used when the background is set to light
        transparent = vim.g.transparent_enabled, -- Enable this to disable setting the background color
        terminal_colors = false,                 -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
        styles = {
          -- Style to be applied to different syntax groups
          -- Value is any valid attr-list value for `:help nvim_set_hl`
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
          -- Background styles. Can be "dark", "transparent" or "normal"
          sidebars = "transparent",       -- style for sidebars, see below
          floats = "transparent",         -- style for floating windows
        },
        sidebars = { "qf", "help" },      -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
        -- day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
        hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
        dim_inactive = true,              -- dims inactive windows
        lualine_bold = true,              -- When `true`, section headers in the lualine theme will be bold

        --- You can override specific color groups to use other groups or a hex color
        --- function will be called with a ColorScheme table
        ---@param colors ColorScheme
        -- on_colors = function(colors) end,

        --- You can override specific highlights to use other groups or a hex color
        --- function will be called with a Highlights and ColorScheme table
        ---@param highlights Highlights
        ---@param colors ColorScheme
        on_highlights = function(hl, c)
          local prompt = "#2d3149"
          hl.TelescopeNormal = {
            bg = c.bg_dark,
            fg = c.fg_dark,
          }
          hl.TelescopeBorder = {
            bg = c.bg_dark,
            fg = c.bg_dark,
          }
          hl.TelescopePromptNormal = {
            bg = prompt,
          }
          hl.TelescopePromptBorder = {
            bg = prompt,
            fg = prompt,
          }
          hl.TelescopePromptTitle = {
            bg = prompt,
            fg = prompt,
          }
          hl.TelescopePreviewTitle = {
            bg = c.bg_dark,
            fg = c.bg_dark,
          }
          hl.TelescopeResultsTitle = {
            bg = c.bg_dark,
            fg = c.bg_dark,
          }
        end,
      })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        theme = "tokyonight",
      })
      -- require("transparent").clear_prefix("lualine")
    end,
  },
  {
    "xiyaowong/transparent.nvim",
    config = function()
      vim.api.nvim_set_hl(0, "LazyBorder", { fg = "#FFFFFF", bg = "#000000" })
      vim.api.nvim_set_hl(0, "MasonBorder", { fg = "#FFFFFF", bg = "#000000" })
      local t = require("transparent")
      t.setup({    -- Optional, you don't have to run setup.
        groups = { -- table: default groups
          "Normal",
          "NormalNC",
          "Comment",
          "Constant",
          "Special",
          "Identifier",
          "Statement",
          "PreProc",
          "Type",
          "Underlined",
          "Todo",
          "String",
          "Function",
          "Conditional",
          "Repeat",
          "Operator",
          "Structure",
          "LineNr",
          "NonText",
          "SignColumn",
          "CursorLine",
          "CursorLineNr",
          "StatusLine",
          "StatusLineNC",
          "EndOfBuffer",
        },
        extra_groups = {
          "NormalFloat",
          -- Telescope 插件的相关高亮组
          "TelescopeNormal",        -- 弹窗主区域
          "TelescopeBorder",        -- 弹窗边框
          "TelescopePromptNormal",  -- 搜索提示区域
          "TelescopePromptBorder",  -- 搜索提示边框
          "TelescopeResultsNormal", -- 搜索结果区域
          "TelescopeResultsBorder", -- 搜索结果边框
          "TelescopePreviewNormal", -- 预览区域
          "TelescopePreviewBorder", -- 预览边框
        },                          -- table: additional groups that should be cleared
        exclude_groups = {},        -- table: groups you don't want to clear
      })
      vim.cmd([[TransparentEnable]])
    end,
  },

  {
    "stevearc/dressing.nvim",
    config = function()
      require("dressing").setup({
        input = {
          enabled = true,
          -- 输入框配置
          border = "double", -- 边框样式，可以是 'rounded', 'single', 'double', 'solid', 'shadow'
          win_options = {
            winblend = 90,  -- 控制透明度 (0 表示不透明, 100 表示完全透明)
          },
        },
        select = {
          -- 选择列表配置
          backend = { "telescope", "builtin" }, -- 可以选择后端，比如使用 telescope
          builtin = {
            border = "double",                 -- 边框样式
            win_options = {
              winblend = 0,                     -- 控制透明度
            },
          },
          telescope = {
            -- 如果使用 telescope 作为选择列表后端，可以在这里配置 telescope
          },
        },
      })
    end,
  },
}
