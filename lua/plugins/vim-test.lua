return {
  "vim-test/vim-test",
  keys = {
    { "<leader>tn", "<cmd>TestNearest<cr>", desc = "Test Nearest" },
    { "<leader>tf", "<cmd>TestFile<cr>",    desc = "Test File" },
    { "<leader>tl", "<cmd>TestLast<cr>",    desc = "Test Last" },
  },
  init = function()
    vim.g["test#strategy"] = "neovim"
  end,
}
