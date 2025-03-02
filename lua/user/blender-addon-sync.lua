local M = {}

local function copy_to_appdata(file)
  local appdata_folder = os.getenv("APPDATA") .. "\\Blender Foundation\\Blender\\4.0\\scripts\\addons"

  vim.fn.mkdir(appdata_folder, "p")

  local file_name = vim.fn.fnamemodify(file, ":t")
  local destination = appdata_folder .. "\\" .. file_name

  local ok, err = pcall(vim.loop.fs_copyfile, file, destination)
  if not ok then
    vim.notify("Failed to copy file: " .. err, vim.log.levels.ERROR)
  else
    vim.notify("File saved and copied to: " .. destination, vim.log.levels.INFO)
  end
end

function M.auto_copy_addon(args)
  local first_line = vim.api.nvim_buf_get_lines(args.buf, 0, 1, false)[1]

  if first_line and first_line:match("bl_info.*") then
    copy_to_appdata(args.file)
  end
end

return M
