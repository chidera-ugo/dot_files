return {
  {
    "akinsho/bufferline.nvim",
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",
          numbers = "ordinal",
          diagnostics = "nvim_lsp",
          vim.diagnostic.config({
            update_in_insert = true,
          }),
          separator_style = "thick",
        },
      })
    end,
  },
}
