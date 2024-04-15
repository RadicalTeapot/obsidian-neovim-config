local vaultPath = vim.fn.expand([[$data/Obsidian vaults/Personal vault]])
local notesPath = vim.fs.normalize(vaultPath .. [[/**.md]])

local get_PARA_metadata = function(relative_note_path)
    local parents = relative_note_path:parents()

    local type_name = parents[#parents - 1]
    if type_name == nil then
        return nil
    end

    -- Match against PARA types
    type_name = string.lower(tostring(type_name["stem"]))
    local types = { project = "project", area = "area", resource = "resource", archive = "archive" }
    if types[type_name] == nil then
        return nil
    end

    local type_value = parents[#parents - 2]
    if type_value == nil then
        return nil
    end

    type_value = tostring(type_value["stem"])

    return { name = type_name, value = type_value }
end

return {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    event = {
        "BufReadPre " .. notesPath,
        "BufNewFile " .. notesPath,
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
    },
    opts = {
        workspaces = { { name = "vault", path = vaultPath } },
        daily_notes = {
            folder = "Periodic notes/daily",
            date_format = "%Y-%m-%d",
            -- TODO Add template
        },
        -- Use nvim_cmp after 2 chars have been entered for autocompletion
        completion = { nvim_cmp = true, min_chars = 2 },
        -- TODO Override mappings

        note_frontmatter_func = function(note)
            local client = require("obsidian").get_client()
            local workspace = client.current_workspace

            local out = {}
            if workspace ~= nil then
                local path = note.path:relative_to(workspace.path)
                local metadata = get_PARA_metadata(path)
                if metadata ~= nil then
                    out[metadata.name] = metadata.value
                end
            end

            -- `note.metadata` contains any manually added fields in the frontmatter.
            -- So here we just make sure those fields are kept in the frontmatter.
            if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
                for k, v in pairs(note.metadata) do
                    out[k] = v
                end
            end

            if note.aliases ~= nil and #note.aliases > 0 then
                out["aliases"] = note.aliases
            end
            if note.tags ~= nil and #note.tags > 0 then
                out["tags"] = note.tags
            end

            return out
        end,
    },
}
