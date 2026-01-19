local plugins = { "oil", "fzf",  "smart-pairs", "term" }

for _, plugin in ipairs(plugins) do
	require("plugins/" .. plugin)
end
