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
      local configs = require("lspconfig.configs")

      -- 注册新的 LSP
      if not configs.caddy_lsp then
        configs.caddy_lsp = {
          default_config = {
            cmd = { "/Users/kedong/code/com.github/caddy/caddyfile-language-server/caddy-lsp" },
            filetypes = { "caddyfile" },
            root_dir = function(fname)
              return lspconfig.util.find_git_ancestor(fname) or vim.loop.os_homedir()
            end,
            settings = {},
          },
        }
      end
      -- 启动 LSP
      -- lspconfig.caddy_lsp.setup({
      --   capabilities = require("cmp_nvim_lsp").default_capabilities(),
      --   on_attach = function(client, bufnr)
      --     -- 启用自动补全
      --     vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

      -- -- 键位映射
      -- local opts = { noremap=true, silent=true, buffer=bufnr }
      -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
      -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
      -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
      -- vim.keymap.set('n', '<space>wl', function()
      --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      -- end, opts)
      -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
      -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
      -- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
      -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      --   end,
      -- })
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
