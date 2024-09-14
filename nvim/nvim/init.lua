vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- add window split plugig
-- add finder plugin
-- add tabs plugin
-- add neotree toggle on start
-- add grovebox
vim.opt.clipboard = "unnamedplus"
-- Function to check if yank is to the system clipboard and use osc52
local function copy()
  if vim.v.event.operator == 'y' and vim.v.event.regname == '+' then
    require('osc52').copy_register('+')
  end
end

-- Create an autocmd that triggers on TextYankPost event
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = copy,
})



require("core.options")
require("core.keymaps")
require("core.plugins")
require("core.plugin_config")
