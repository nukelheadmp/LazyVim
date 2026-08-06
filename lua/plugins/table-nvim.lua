return {
  {
    "SCJangra/table-nvim",
    ft = { "markdown" },
    opts = {
      -- Automatically updates layout on changes
      mappings = {
        next = "<TAB>", -- Move to next cell
        prev = "<S-TAB>", -- Move to previous cell
        digit = "<CR>", -- Format active cell
        echo = "<Leader>te", -- Echo cell info
        sort = "<Leader>ts", -- Sort column
      },
    },
  },
}
