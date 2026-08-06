local mod_id = "dzhandrys_jokers"
SMODS.Keybind {
    key_pressed = '4',
    held_keys = { 'lctrl' },
    action = function()
        local mod = SMODS.find_mod(mod_id)[1]
        if not mod then
            print(mod_id .. " not found")
            return
        end

        local path = mod.path .. 'localization/en-us.lua'
        local content = SMODS.NFS.read(path)
        if not content then
            print("Could not read loc file at: " .. path)
            return
        end

        local loc_data = assert(load(content, path))()

        -- Process descriptions
        if loc_data and loc_data.descriptions then
            for set, entries in pairs(loc_data.descriptions) do
                G.localization.descriptions[set] = G.localization.descriptions[set] or {}
                for key, val in pairs(entries) do
                    if val.text and type(val.text) == 'table' then
                        val.text_parsed = {}
                        for _, line in ipairs(val.text) do
                            val.text_parsed[#val.text_parsed + 1] = loc_parse_string(line)
                        end
                    end
                    if val.name and type(val.name) == 'string' then
                        val.name_parsed = {}
                        val.name_parsed[#val.name_parsed + 1] = loc_parse_string(val.name)
                    end

                    G.localization.descriptions[set][key] = val
                end
            end
        end

        -- misc stuff
        if loc_data and loc_data.misc then
            for cat, entries in pairs(loc_data.misc) do
                G.localization.misc[cat] = G.localization.misc[cat] or {}
                for key, val in pairs(entries) do
                    G.localization.misc[cat][key] = val
                end
            end
        end

        print("Reloaded")
    end
}
