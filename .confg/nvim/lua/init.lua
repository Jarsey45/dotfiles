if vim.g.vscode then
	local vscode = require('vscode')
	vim.g.clipboard = vim.g.vscode_clipboard
else
	-- nvim-tree config

	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1
	vim.opt.termguicolors = true

	-- requires
	require("nvim-tree").setup({
	  sort_by = "case_sensitive",
	  view = {
	    width = 30,
	  },
	  renderer = {
	    group_empty = true,
	  },
	  filters = {
	    dotfiles = true,
	  },
	})
	require("oil").setup()
end
