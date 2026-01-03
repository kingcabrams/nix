local direction = {
	["h"] = "left",
	["j"] = "bottom",
	["k"] = "top",
	["l"] = "right",
}

local function global_pane_switch(dir)
	local old_pane = vim.fn.winnr()
	vim.cmd.wincmd(dir)
	local pane = vim.fn.winnr()

	if old_pane == pane then
		vim.system({ "kitten", "@", "focus-window", "-m", "neighbor:" .. direction[dir] })
	end
end

vim.keymap.set("n", "<A-h>", function()
	global_pane_switch("h")
end)
vim.keymap.set("n", "<A-j>", function()
	global_pane_switch("j")
end)
vim.keymap.set("n", "<A-k>", function()
	global_pane_switch("k")
end)
vim.keymap.set("n", "<A-l>", function()
	global_pane_switch("l")
end)
