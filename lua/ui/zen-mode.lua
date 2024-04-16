local settings_stack = {
    _stack = {},
}

--- Push overriden settings onto the settings stack
--- @param opts { key: { type: string, option: string }, overriden_value: any } Overriden settings
settings_stack.push = function(opts)
    -- Deep copy options
    local overriden_settings = vim.tbl_deep_extend("force", {}, opts)

    -- Store current value and override settings
    for _, v in ipairs(overriden_settings) do
        v.current_value = vim[v.key.type][v.key.option]
        vim[v.key.type][v.key.option] = v.overriden_value
    end

    -- Push settings onto stack
    settings_stack._stack[#settings_stack + 1] = overriden_settings
end

--- Pop overriden settings off the settings stack and apply them
--- @see settings_stack.push
settings_stack.pop_and_apply = function()
    assert(settings_stack._stack[#settings_stack] ~= nil, "Settings stack underflow")

    -- Pop settings off stack
    local last_settings = settings_stack._stack[#settings_stack]
    settings_stack._stack[#settings_stack] = nil

    if last_settings ~= nil then
        for _, v in ipairs(last_settings) do
            vim[v.key.type][v.key.option] = v.current_value
        end
    end
end

return {
    "folke/zen-mode.nvim",
    dependencies = { "folke/twilight.nvim" },
    lazy = true,
    event = "VeryLazy",
    keys = { { "<Leader>zm", "<cmd>ZenMode<cr>", desc = "[Z]en [m]ode" } },
    opts = {
        window = { width = 120 },

        on_open = function()
            local overriden_settings = {
                { key = { type = "wo", option = "colorcolumn" }, overriden_value = 0 },
                { key = { type = "bo", option = "textwidth" }, overriden_value = 0 },
            }
            settings_stack.push(overriden_settings)
        end,

        on_close = function()
            settings_stack.pop_and_apply()
        end,
    },
}
