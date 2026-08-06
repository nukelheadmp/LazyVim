-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

--vim.opt.hlsearch = false
--vim.opt.incsearch = true
--vim.o.laststatus = 0

vim.g.docrepos = {
  documentation = os.getenv("HOME") .. "/Documents/Documentation",
  notes = os.getenv("HOME") .. "/Documents/Notes",
  scripts = os.getenv("HOME") .. "/Documents/Scripts",
}
