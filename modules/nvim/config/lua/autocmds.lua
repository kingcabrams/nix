-- local function set_kitty_user_var(name, value)
-- 	local command
-- 	if value ~= nil then
-- 		command = { "kitten", "@", "set-user-vars", string.format("%s=%s", name, value) }
-- 	else
-- 		command = { "kitten", "@", "set-user-vars", string.format("%s", name) }
-- 	end
-- 	vim.system(command, {text = true})
-- end
--
-- vim.api.nvim_create_autocmd('VimEnter', {
--   callback = function()
--     set_kitty_user_var('IS_NVIM', '1')
--   end,
-- })
--
-- vim.api.nvim_create_autocmd('VimLeavePre', {
--   callback = function()
--     set_kitty_user_var('IS_NVIM')
--   end,
-- })
--
vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'rust', 'c', 'h', 'hpp', 'cpp', 'lua', 'python', 'nix' };
	callback = function()
		vim.treesitter.start()
	end,
})
