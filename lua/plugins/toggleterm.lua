return {
  "akinsho/toggleterm.nvim",
  enabled = false,
  lazy = false,
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<c-\>]],
      shade_terminals = false,
      shell = "pwsh.exe",
    })
  end,
  keys = {
    -- { [[<C-\>]] },
    { "<leader>0", "<Cmd>2ToggleTerm<Cr>", desc = "Terminal panel" },
    {
      "<leader>td",
      "<cmd>ToggleTerm size=40 dir=. direction=vertical<cr>",
      desc = "Open a vertical terminal at the Desktop directory",
    },
  },
}
