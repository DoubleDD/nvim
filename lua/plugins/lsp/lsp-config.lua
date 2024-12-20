return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.solargraph.setup({
        capabilities = capabilities,
      })
      lspconfig.html.setup({
        capabilities = capabilities,
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.jsonls.setup({
        capabilities = capabilities,
        settings = {
          json = {
            format = {
              enable = true,
            },
          },
        },
      })
      lspconfig.gopls.setup({
        settings = {
          golps = {
            ui = {
              completion = {
                usePlaceholders = true,
              },
            },
          },
        },
      })
      lspconfig.angularls.setup({
        -- 可以添加更多设置，比如 on_attach、capabilities 等等
        -- capabilities = capabilities,
        flags = {
          debounce_text_changes = 150,
        },
      })
    end,
  },
  {
    "onsails/lspkind-nvim",
    config = function()
      local lspkind = require("lspkind")
      lspkind.init({
        mode = "symbol", -- 显示图标和文本
        maxwidth = 50, -- 最大宽度
        ellipsis_char = "...", -- 超出部分显示省略号
        preset = "default", -- 预设样式
        symbol_map = {
          Text = "󰉿",
          Method = "󰆧",
          Function = "󰊕",
          Constructor = "",
          Field = "󰜢",
          Variable = "󰀫",
          Class = "󰠱",
          Interface = "",
          Module = "",
          Property = "󰜢",
          Unit = "󰑭",
          Value = "󰎠",
          Enum = "",
          Keyword = "󰌋",
          Snippet = "",
          Color = "󰏘",
          File = "󰈙",
          Reference = "󰈇",
          Folder = "󰉋",
          EnumMember = "",
          Constant = "󰏿",
          Struct = "󰙅",
          Event = "",
          Operator = "󰆕",
          TypeParameter = "",
        },
      })

      require("cmp").setup({
        formatting = {
          fields = { "abbr", "kind", "menu" },
          format = lspkind.cmp_format({
            mode = "symbol",
            maxwidth = 50,
            ellipsis_char = "...",
          }),
        },
      })
    end,
    dependencies = { "hrsh7th/nvim-cmp" }, -- 确保与 nvim-cmp 兼容
  },
}
