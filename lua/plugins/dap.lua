return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      -- 初始化 nvim-dap
      local dap = require("dap")

      -- 配置 go-debug-adapter
      dap.adapters.go = {
        type = "executable",
        command = "dlv",
        args = { "dap", "-l", "127.0.0.1:38697" },
      }

      -- 配置 Go 调试配置
      dap.configurations.go = {
        {
          type = "go",
          name = "Debug",
          request = "launch",
          program = "${file}",
          env = {},
          args = {},
          showLog = false,
          buildFlags = "",
        },
        {
          type = "go",
          name = "Debug Test",
          request = "launch",
          mode = "test",
          program = "${file}",
          env = {},
          args = {},
          showLog = false,
          buildFlags = "",
        },
      }
    end,
  },
  {
    "folke/neodev.nvim",
    opts = {},
    config = function()
      require("neodev").setup({
        library = {
          enabled = true, -- when not enabled, neodev will not change any settings to the LSP server
          -- these settings will be used for your Neovim config directory
          runtime = true, -- runtime path
          types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
          -- plugins = true, -- installed opt or start plugins in packpath
          -- you can also specify the list of plugins to make available as a workspace library
          plugins = { "nvim-dap-ui", "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
        },
        setup_jsonls = true, -- configures jsonls to provide completion for project specific .luarc.json files
        -- for your Neovim config directory, the config.library settings will be used as is
        -- for plugin directories (root_dirs having a /lua directory), config.library.plugins will be disabled
        -- for any other directory, config.library.enabled will be set to false
        override = function(root_dir, options) end,
        -- With lspconfig, Neodev will automatically setup your lua-language-server
        -- If you disable this, then you have to set {before_init=require("neodev.lsp").before_init}
        -- in your lsp start options
        lspconfig = true,
        -- much faster, but needs a recent built of lua-language-server
        -- needs lua-language-server >= 3.6.0
        pathStrict = true,
      })
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      -- 初始化 nvim-dap-ui
      local dapui = require("dapui")

      -- 配置 dapui
      dapui.setup({
        icons = { expanded = "▾", collapsed = "▸" },
        mappings = {
          -- 使用这些键绑定来展开/折叠调试窗口
          expand = { "<CR>", "<2-LeftMouse>" },
          open = "o",
          remove = "d",
          edit = "e",
          repl = "r",
          toggle = "t",
        },
        layouts = {
          {
            elements = {
              "scopes",
              "breakpoints",
              "stacks",
              "watches",
            },
            size = 40,
            position = "left",
          },
          {
            elements = {
              "repl",
              "console",
            },
            size = 10,
            position = "bottom",
          },
        },
        floating = {
          max_height = nil, -- 浮动窗口的最大高度
          max_width = nil, -- 浮动窗口的最大宽度
          border = "single", -- 浮动窗口的边框样式
        },
        windows = { indent = 1 },
      })

      -- 自动打开和关闭 dapui
      local dap = require("dap")
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

    end,
  },

  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      -- 初始化 nvim-dap-virtual-text
      require("nvim-dap-virtual-text").setup({
        enabled = true, -- 启用虚拟文本
        enabled_commands = true, -- 启用命令
        highlight_changed_variables = true, -- 高亮改变的变量
        highlight_new_as_changed = false, -- 将新变量视为已改变
        show_stop_reason = true, -- 显示停止原因
        commented = false, -- 注释虚拟文本
        only_first_definition = true, -- 仅显示第一个定义
        all_references = false, -- 显示所有引用
        display_callback = function(variable, _buf, _stackframe, _node)
          return variable.name .. " = " .. variable.value
        end,
        virt_text_pos = "eol", -- 虚拟文本位置（eol 或 inline）
        all_frames = false, -- 显示所有帧
        virt_lines = false, -- 显示虚拟行
        virt_text_win_col = nil, -- 虚拟文本窗口列
      })
    end,
  },
}
