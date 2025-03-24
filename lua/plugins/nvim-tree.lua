return {
  "nvim-tree/nvim-tree.lua",
  requires = "nvim-tree/nvim-web-devicons", -- 可选图标支持
  config = function()
    require("transparent").clear_prefix("NvimTree")
    require("nvim-tree").setup({
      update_focused_file = {
        enable = true,  -- 启用更新聚焦文件的功能
        update_cwd = false, -- 是否更新工作目录
        ignore_list = {} -- 忽略列表，不在此列表中的文件会被高亮
      },
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
