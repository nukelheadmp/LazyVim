-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "d", '"_d')
vim.keymap.set("n", "D", '"_D')
vim.keymap.set("n", "c", '"_c')
vim.keymap.set("n", "C", '"_C')
vim.keymap.set("v", "d", '"_d')
vim.keymap.set("v", "D", '"_D')
vim.keymap.set("v", "c", '"_c')
vim.keymap.set("v", "C", '"_C')
vim.keymap.set("i", "jk", "<esc>")

vim.keymap.set("n", "<leader>D", "<nop>", { desc = "[D]ocs" })
vim.keymap.set("n", "<leader>Dn", function()
  vim.cmd("cd " .. vim.g.docrepos.notes)
  vim.cmd("e README.md")
end, { desc = "[N]otes" })
vim.keymap.set("n", "<leader>Dd", function()
  vim.cmd("cd " .. vim.g.docrepos.documentation)
  vim.cmd("e README.md")
end, { desc = "[D]ocumentation" })
vim.keymap.set("n", "<leader>Ds", function()
  vim.cmd("cd " .. vim.g.docrepos.scripts)
end, { desc = "[S]cripts" })
