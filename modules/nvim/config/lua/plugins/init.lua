local plugins = { "oil", "fzf", "colorschemes", "smart-tab", "smart-pairs" }

for _, plugin in ipairs(plugins) do
	require("plugins/" .. plugin)
end
