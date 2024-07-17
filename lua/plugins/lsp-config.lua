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
            -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.tsserver.setup({
                capabilities = capabilities,
            })
            lspconfig.solargraph.setup({
                capabilities = capabilities,
            })
            lspconfig.html.setup({
                capabilities = capabilities,
            })
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
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
        end,
    },
    -- UI美化
    -- {
    --     "nvimdev/lspsaga.nvim",
    --     config = function()
    --         require("lspsaga").setup({
    --             finder = {
    --                 max_height = 0.6,
    --                 keys = {
    --                     vsplit = 'v'
    --                 }
    --             }
    --         })
    --     end,
    --     dependencies = {
    --         "nvim-treesitter/nvim-treesitter", -- optional
    --         "nvim-tree/nvim-web-devicons", -- optional
    --     },
    -- },
}
