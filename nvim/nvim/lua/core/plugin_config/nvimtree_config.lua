require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
  git = {
    ignore = false,
  },
})

vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    require'nvim-tree.api'.tree.toggle()
  end,
})

vim.keymap.set('n', '<c-n>', ':NvimTreeFindFile<CR>')
