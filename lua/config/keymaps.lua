-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local execenv = require("user.execenv")
vim.keymap.set("n", "<leader>h", "", { desc = "Execution environment" })
vim.keymap.set("n", "<leader>hm", execenv.msvc, { desc = "MSVC (cmd.exe) execution environment" })
vim.keymap.set("n", "<leader>hp", execenv.pwsh, { desc = "Powershell 7 execution environment" })
vim.keymap.set("n", "<leader>hc", execenv.cmd, { desc = "Command Prompt execution environment" })
vim.keymap.set("n", "<leader>hl", execenv.wsl, { desc = "Linux (WSL) execution environment" })

local build = require("user.build")
vim.keymap.set("n", "<leader>B", "", { desc = "Build Project" })
vim.keymap.set("n", "<leader>Bb", build.build, { desc = "Build Project" })
vim.keymap.set("n", "<leader>Br", build.run, { desc = "Run Project" })
vim.keymap.set("n", "<leader>Bc", build.clean, { desc = "Clean Project" })
vim.keymap.set("n", "<leader>BB", build.build_and_run, { desc = "Build And Run Project" })
vim.keymap.set("n", "<leader>BC", build.config, { desc = "Config Project" })
