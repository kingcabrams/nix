require('fzf-lua').setup({
    winopts = {
        split = "belowright 8new",
    },
})

vim.keymap.set("n", "<C-p>", function()
    FzfLua.files()
end)
