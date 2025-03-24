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
      -- helm
      lspconfig.helm_ls.setup {
        settings = {
          ['helm-ls'] = {
            yamlls = {
              enabled = true,
              enabledForFilesGlob = "*.{yaml,yml}",
              diagnosticsLimit = 50,
              showDiagnosticsDirectly = false,
              path = "/Users/kedong/.volta/bin/yaml-language-server",
              config = {
                schemas = {
                  kubernetes = "templates/**",
                },
                completion = true,
                hover = true,
                -- any other config from https://github.com/redhat-developer/yaml-language-server#language-server-settings
              } }
          }
        }
      }
      -- 启用python的静态类型检查
      lspconfig.pyright.setup {
        settings = {
          pyright = {
            -- Using Ruff's import organizer
            disableOrganizeImports = true,
          },
          python = {
            analysis = {
              autoImportCompletions = true, -- 自动补全导入
              autoSearchPaths = true,
              typeCheckingMode = "strict"
            }
          }
        }
      }
      -- 启用 python ruff server ,rust编写的
      -- lspconfig.ruff.setup({
      --   cmd = {
      --     os.getenv("HOME") .. "/miniconda3/bin/ruff",
      --   },
      --   init_options = {
      --     settings = {
      --       -- Ruff language server settings go here
      --     }
      --   }
      -- })
      -- vim.api.nvim_create_autocmd("LspAttach", {
      --   group = vim.api.nvim_create_augroup('lsp_attach_disable_ruff_hover', { clear = true }),
      --   callback = function(args)
      --     local client = vim.lsp.get_client_by_id(args.data.client_id)
      --     if client == nil then
      --       return
      --     end
      --     if client.name == 'ruff' then
      --       -- Disable hover in favor of Pyright
      --       client.server_capabilities.hoverProvider = false
      --     end
      --   end,
      --   desc = 'LSP: Disable hover capability from Ruff',
      -- })
      -- 启用pylsp
      lspconfig.pylsp.setup {
        cmd = {
          os.getenv("HOME") .. "/miniconda3/bin/pylsp", -- 虚拟环境路径
          -- 或默认全局路径（如/usr/local/bin/pylsp）
        },
        settings = {
          pylsp = {
            plugins = {
              pylsp_mypy = { enabled = false },
              jedi_completion = { fuzzy = true }, -- 启用模糊补全
              pycodestyle = {
                enabled = true,
                max_line_length = 120 -- 添加这个行宽设置
              },
              -- flake8 = { enabled = false },       -- 关闭 flake8
              -- pyls_isort = { enabled = false },   -- 关闭 isort
            }
          }
        },
        on_attach = function(client, bufnr)
          vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":!ruff check --fix %", { silent = true })
          -- vim.api.nvim_command("ruff check --fix %")
        end,

      }

      -- 配置 XML LSP 服务器
      lspconfig.xmlformatter.setup {}


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
        mode = "symbol",       -- 显示图标和文本
        maxwidth = 50,         -- 最大宽度
        ellipsis_char = "...", -- 超出部分显示省略号
        preset = "default",    -- 预设样式
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
