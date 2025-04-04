return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				clangd = {
					cmd = {
						"clangd",
						"--compile-commands-dir=build",
						"--log=error",
					},
					init_options = {
						clangdFileStatus = true,
					},
				},
			},
		},
	},
}
