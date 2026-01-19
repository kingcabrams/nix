local api = vim.api
local TS = vim.treesitter

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c", "cpp" },
	callback = function(args)
		vim.keymap.set("i", "{", function()
			local node = TS.get_node()

			if node and (node:type() == "if_statement" or node:type() == "for_statement" or node:type() == "while_statement") then
				local row = api.nvim_win_get_cursor(0)[1]
				local _, col, _ = node:start()

				local expandtab = api.nvim_get_option_value("expandtab", { buf = args.buf })
				local padding = expandtab and " " or "\t"

				api.nvim_buf_set_lines(args.buf, row + 1, row + 1, false, {
					string.rep(padding, col) .. "}",
				})
			end

			api.nvim_feedkeys("{", "n", false)
		end)
	end,
})
