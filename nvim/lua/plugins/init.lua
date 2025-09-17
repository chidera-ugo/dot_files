return {
  "tpope/vim-fugitive",
  "windwp/nvim-ts-autotag",
  "nvim-pack/nvim-spectre",
  "nvim-tree/nvim-web-devicons",
  "nvim-lua/plenary.nvim",
  "vadimcn/codelldb",
  "mbbill/undotree",
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    "EdenEast/nightfox.nvim",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
      require("ibl").setup()
    end,
  },
}
