local M = {}

local function command(cmd, dir)
  return "cd " .. dir .. " && " .. cmd .. ' && cd  "' .. vim.fn.getcwd() .. '"'
end

local neoconf = require("neoconf")
local execenv = require("user.execenv")

local function set_execenv()
  local env = neoconf.get("build.execenv")

  if not env then return end

  if execenv.current ~= env then
    vim.cmd("SetExecEnv " .. env)
  end
end

function M.build()
  local cmd = neoconf.get("build.cmd")
  local dir = neoconf.get("build.dir")
  if not dir then
    dir = "."
  end

  if not cmd then
    vim.notify("No build command found in NeoConf", vim.log.levels.ERROR)
    return
  end

  set_execenv()
  vim.cmd("Exec " .. command(cmd, dir))
end

function M.run()
  local cmd = neoconf.get("build.run.cmd")
  local dir = neoconf.get("build.run.dir")
  if not dir then
    dir = "."
  end

  if not cmd then
    vim.notify("No run command found in NeoConf", vim.log.levels.ERROR)
    return
  end

  set_execenv()
  vim.cmd("Exec " .. command(cmd, dir))
end

function M.build_and_run()
  local build_cmd = neoconf.get("build.cmd")
  local run_cmd = neoconf.get("build.run.cmd")
  local bdir = neoconf.get("build.dir")
  local rdir = neoconf.get("build.run.dir")
  if not bdir then
    bdir = "."
  end
  if not rdir then
    rdir = "."
  end

  if not build_cmd then
    vim.notify("No build command found in NeoConf", vim.log.levels.ERROR)
    return
  end

  if not run_cmd then
    vim.notify("No run command found in NeoConf", vim.log.levels.ERROR)
    return
  end

  local build = command(build_cmd, bdir)
  local run = command(run_cmd, rdir)

  set_execenv()
  vim.cmd("Exec " .. build .. " && " .. run)
end

function M.clean()
  local cmd = neoconf.get("build.clean.cmd")
  local dir = neoconf.get("build.clean.dir")
  if not dir then
    dir = "."
  end

  if not cmd then
    vim.notify("No clean command found in NeoConf", vim.log.levels.ERROR)
    return
  end

  set_execenv()
  vim.cmd("Exec " .. command(cmd, dir))
end

function M.config()
  local cmd = neoconf.get("build.config.cmd")
  local dir = neoconf.get("build.config.dir")
  if not dir then
    dir = "."
  end

  if not cmd then
    vim.notify("No config command found in NeoConf", vim.log.levels.ERROR)
    return
  end

  set_execenv()
  vim.cmd("Exec " .. command(cmd, dir))
end

vim.api.nvim_create_user_command("BuildProject", M.build, {})
vim.api.nvim_create_user_command("RunProject", M.run, {})
vim.api.nvim_create_user_command("BuildAndRunProject", M.build_and_run, {})
vim.api.nvim_create_user_command("CleanProject", M.clean, {})
vim.api.nvim_create_user_command("ConfigProject", M.config, {})

return M
