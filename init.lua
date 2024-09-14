-- Install lazy

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

-- Leader is space
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Start lazy
require("lazy").setup("plugins")

require("options") -- Load Neovim Basic Configuration
require("keymaps") -- Load Custom Keybindings for Neovim
require("lsp") -- Load specific lsp configs

vim.cmd[[colorscheme dracula]]
require('lualine').setup {
    options = {
        theme = 'dracula-nvim'
    }
}
