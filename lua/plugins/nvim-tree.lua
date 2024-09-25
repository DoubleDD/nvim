return {
  "nvim-tree/nvim-tree.lua",
  requires = "nvim-tree/nvim-web-devicons", -- 可选图标支持
  config = function()
    require("transparent").clear_prefix("NvimTree")
    require("nvim-tree").setup({
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 35,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
    })
  end,
}
