-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Скопировать полный путь к файлу
vim.keymap.set("n", "<leader>fp", ':let @+ = expand("%:p")<CR>', { desc = "[F]ile [P]ath to clipboard" })

-- Скопировать только имя файла
vim.keymap.set("n", "<leader>fn", ':let @+ = expand("%:t")<CR>', { desc = "[F]ile [N]ame to clipboard" })
