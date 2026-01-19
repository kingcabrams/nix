vim.api.nvim_create_autocmd("FileType", {
	pattern = { "rust", "c", "h", "hpp", "cpp", "lua", "python", "nix" },
	callback = function()
		vim.treesitter.start()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "rust" },
	callback = function()
        vim.opt.makeprg = "cargo build"
	end,
})


