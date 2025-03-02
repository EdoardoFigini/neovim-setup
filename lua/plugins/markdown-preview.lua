return {
  {
    "iamcco/markdown-preview.nvim",
    -- Only load the plugin when editing markdown files
    ft = { "markdown" },
    -- Build command to install dependencies
    build = "cd app && npm install",
    -- Set up the configuration
    config = function()
      -- Set the path to your custom CSS file for markdown preview
      vim.g.mkdp_markdown_css = os.getenv("localappdata") .. "/nvim/files/markdown.css"
      vim.g.mkdp_auto_start = 1
    end,
  },
}
