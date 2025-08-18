return {
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>",  ":<C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>",  ":<C-U>TmuxNavigateDown<cr>" },
      { "<c-k>",  ":<C-U>TmuxNavigateUp<cr>" },
      { "<c-l>",  ":<C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", ":<C-U>TmuxNavigatePrevious<cr>" },
    },
  },
}
