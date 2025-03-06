local M = {}

M.current = "pwsh"

function M.msvc()
  vim.opt.shell = "cmd.exe"
  vim.opt.shellredir = "> %s"
  vim.opt.shellpipe = "> %s"
  vim.opt.shellquote = ""
  vim.opt.shellxquote = ""
  vim.opt.shellcmdflag =
    '/c "%LOCALAPPDATA%\\nvim\\files\\msvc_launch.bat" && '
  M.current = "msvc"
  vim.notify("Execution environment set to MSVC")
end

function M.pwsh()
  vim.opt.shell = "pwsh.exe"
  vim.opt.shellredir = "| Out-File -Encoding UTF8 %s"
  vim.opt.shellpipe = "| Out-File -Encoding UTF8 %s"
  vim.opt.shellquote = ""
  vim.opt.shellxquote = ""
  vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command $PSStyle.OutputRendering = 'Ansi'; "
  M.current = "pwsh"
  vim.notify("Execution environment set to Powershell 7")
end

function M.cmd()
  vim.opt.shell = "cmd.exe"
  vim.opt.shellredir = "> %s"
  vim.opt.shellpipe = "> %s"
  vim.opt.shellquote = ""
  vim.opt.shellxquote = ""
  vim.opt.shellcmdflag = "/c "
  M.current = "cmd"
  vim.notify("Execution environment set to cmd.exe")
end

function M.wsl()
  vim.opt.shell = "wsl"
  vim.opt.shellredir = "> %s"
  vim.opt.shellpipe = "> %s"
  vim.opt.shellquote = ""
  vim.opt.shellxquote = ""
  vim.opt.shellcmdflag = "-e bash -c "
  M.current = "wsl"
  vim.notify("Execution environment set to WSL")
end

vim.api.nvim_create_user_command("SetExecEnv", function(opts)
  local arg = opts.fargs[1]
  if arg == "msvc" then
    M.msvc()
  elseif arg == "pwsh" then
    M.pwsh()
  elseif arg == "cmd" then
    M.cmd()
  elseif arg == "wsl" then
    M.wsl()
  else
    vim.notify("No execution environment for " .. arg, vim.log.levels.ERROR)
  end
end
, { nargs = 1 })

return M
