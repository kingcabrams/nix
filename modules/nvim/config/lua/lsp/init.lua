vim.lsp.enable({
	"nixd",
	"clangd",
	"lua_ls",
	"rust_analyzer",
})

require("conform").setup({
	formatters_by_ft = {
		rust = { "rustfmt" },
		python = { "ruff_format" },
		c = { "clang_format" },
		cpp = { "clang_format" },
		nix = { "nixfmt" },
		lua = { "stylua" },
	},
})

require("lazydev").setup()

vim.keymap.set("n", "<leader>f", function()
	require("conform").format({ async = true, lsp_fallback = true })
end)

vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)

vim.keymap.set("n", "<leader>a", function()
	vim.lsp.buf.code_action()
end)

vim.keymap.set("n", "<leader>r", function()
	vim.lsp.buf.rename()
end)

vim.keymap.set("n", "K", vim.lsp.buf.signature_help)

vim.diagnostic.config({ virtual_text = true })
