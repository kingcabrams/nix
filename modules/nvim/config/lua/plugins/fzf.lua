require('fzf-lua').setup({
	'ivy',
	files = {
		git_icons = true,
	},
})

vim.keymap.set("n", "<C-p>", function() FzfLua.files() end)
vim.keymap.set("n", "<leader>/", function() FzfLua.live_grep() end)
vim.keymap.set("n", "<leader>;", function() FzfLua.buffers() end)
