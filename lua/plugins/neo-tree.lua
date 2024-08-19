return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    -- vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
    require("transparent").clear_prefix("NeoTree")
    require("neo-tree").setup({
      filesystem = {
        follow_current_file = { enabled = true },
      },
      buffers = {
        follow_current_file = { enabled = true },
      },
    })
  end,
}
