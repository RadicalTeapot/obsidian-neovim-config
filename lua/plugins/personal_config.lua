local personal_config = vim.fs.normalize("$localappdata/_nvim_personal_config/personal_config")
local plugins = {}
if (vim.uv or vim.loop).fs_stat(personal_config) then
	return {
		dir=personal_config, 
		opts = {},
		priority=999,
	}
end
vim.notify("Could not find personal config plugin in "..personal_config, vim.log.levels.WARN)
return {}
