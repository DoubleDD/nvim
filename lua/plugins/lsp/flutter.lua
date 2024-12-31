return {
  {
    'nvim-flutter/flutter-tools.nvim',
    lazy = false,
    ft = {"dart","dart-lang"},
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = function()
      -- alternatively you can override the default configs
      require("flutter-tools").setup {
        ui = {
          -- the border type to use for all floating windows, the same options/formats
          -- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
          border = "rounded",
          -- this determines whether notifications are show with `vim.notify` or with the plugin's custom ui
          -- please note that this option is eventually going to be deprecated and users will need to
          -- depend on plugins like `nvim-notify` instead.
          -- notification_style = 'native' | 'plugin'
          notification_style = 'native',
        },
        decorations = {
          statusline = {
            -- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
            -- this will show the current version of the flutter app from the pubspec.yaml file
            app_version = false,
            -- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
            -- this will show the currently running device if an application was started with a specific
            -- device
            device = false,
            -- set to true to be able use the 'flutter_tools_decorations.project_config' in your statusline
            -- this will show the currently selected project configuration
            project_config = false,
          }
        },
        debugger = { -- integrate with nvim dap + install dart code debugger
          enabled = false,
          -- if empty dap will not stop on any exceptions, otherwise it will stop on those specified
          -- see |:help dap.set_exception_breakpoints()| for more info
          exception_breakpoints = {},
          -- whether to call tostring() on objects in debug views like hovers and the
          -- variables list.
          -- invoking tostring() has a performance cost and may introduce side-effects,
          -- although users may expected this functionality. null is treated like false.
          evaluate_to_string_in_debug_views = true,
          register_configurations = function(paths)
            require("dap").configurations.dart = {
              --put here config that you would find in .vscode/launch.json
            }
            -- if you want to load .vscode launch.json automatically run the following:
            -- require("dap.ext.vscode").load_launchjs()
          end,
        },
        -- flutter_path = "<full/path/if/needed>", -- <-- this takes priority over the lookup
        -- flutter_lookup_cmd = nil,             -- example "dirname $(which flutter)" or "asdf where flutter"
        root_patterns = { ".git", "pubspec.yaml" }, -- patterns to find the root of your flutter project
        fvm = false,                                -- takes priority over path, uses <workspace>/.fvm/flutter_sdk if enabled
        widget_guides = {
          enabled = true,
        },
        closing_tags = {
          highlight = "errormsg", -- highlight for the closing tag
          prefix = ">",           -- character to use for close tag e.g. > widget
          priority = 10,          -- priority of virtual text in current line
          -- consider to configure this when there is a possibility of multiple virtual text items in one line
          -- see `priority` option in |:help nvim_buf_set_extmark| for more info
          enabled = true -- set to false to disable
        },
        dev_log = {
          enabled = true,
          filter = nil, -- optional callback to filter the log
          -- takes a log_line as string argument; returns a boolean or nil;
          -- the log_line is only added to the output if the function returns true
          notify_errors = false, -- if there is an error whilst running then notify the user
          open_cmd = "15split",  -- command to use to open the log buffer
          focus_on_open = true,  -- focus on the newly opened log window
        },
        dev_tools = {
          autostart = false,         -- autostart devtools server if not detected
          auto_open_browser = false, -- automatically opens devtools in the browser
        },
        lsp = {
          color = { -- show the derived colours for dart variables
            enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
            background = true, -- highlight the background
            background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
            foreground = false, -- highlight the foreground
            virtual_text = true, -- show the highlight using virtual text
            virtual_text_str = "■", -- the virtual text character to highlight
          },
          on_attach = function(client, bufnr)
            -- 自定义 lsp 绑定
            local wk = require("which-key")
            wk.add({
              {
                { "<leader>go", "<cmd>FlutterOutlineToggle<cr>", desc = "flutter outline" }, -- no need to specify mode since it's inherited
              },
            })
          end,
          -- on_attach = my_custom_on_attach,
          -- capabilities = my_custom_capabilities, -- e.g. lsp_status capabilities
          --- or you can specify a function to deactivate or change or control how the config is created
          -- capabilities = function(config)
          --   config.specificthingidontwant = false
          --   return config
          -- end,
          -- see the link below for details on each option:
          -- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/readme.md#client-workspace-configuration
          settings = {
            showtodos = true,
            completefunctioncalls = true,
            -- analysisexcludedfolders = { "<path-to-flutter-sdk-packages>" },
            renamefileswithclasses = "prompt", -- "always"
            enablesnippets = true,
            updateimportsonrename = true,      -- whether to update imports and other directives when files are renamed. required for `flutterrename` command.
          }
        }
      }

      require("telescope").load_extension("flutter")
    end,
  }
}
