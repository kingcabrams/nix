local function toggle_term()
    if vim.bo.buftype == "terminal" then
        vim.cmd("b#")
        return
    end

	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		local name = vim.api.nvim_buf_get_name(buf)
		if name:match("term://") and not name:match("fzf") then
			vim.cmd("b" .. buf)
            vim.cmd("startinsert")
			return
		end
	end

	vim.cmd("term")
    vim.cmd("startinsert")
end

vim.keymap.set("n", "<leader>t", toggle_term)
vim.keymap.set("t", "<esc>", "<c-\\><c-n>")
