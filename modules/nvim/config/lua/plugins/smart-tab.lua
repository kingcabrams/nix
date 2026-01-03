local tabkey = "<Tab>"
local api = vim.api
local TS = vim.treesitter

local function line_start()
	local line = api.nvim_get_current_line()
	local _, col = unpack(api.nvim_win_get_cursor(0))

	line = string.gsub(string.sub(line, 1, col), "%s", "")
	return line == ""
end

local function tabout()
	if not line_start() then
		local node = TS.get_node()

		if node and node:parent() then
			local p_row, p_col, _ = node:parent():end_()
			vim.fn.setpos(".", { 0, p_row + 1, p_col + 1, 0 })
			return
		end
	end

	api.nvim_feedkeys(api.nvim_replace_termcodes(tabkey, true, false, true), "n", false)
end

vim.keymap.set("i", "<A-v>", function()
	vim.notify(vim.treesitter.get_node():type(), vim.log.levels.ERROR)
end)

vim.keymap.set("i", "<A-c>", function()
	vim.notify(vim.treesitter.get_node():parent():type(), vim.log.levels.ERROR)
end)

vim.keymap.set("i", tabkey, tabout)
