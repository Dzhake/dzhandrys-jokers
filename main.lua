assert(SMODS.current_mod.lovely, "Lovely patches were not loaded! Make sure your mod is in the right place.")

SMODS.current_mod.optional_features = {
    --quantum_enhancements = true,
    --object_weights = true,
    --post_trigger = true
}


local function load_dir(path)
    local index_info = SMODS.NFS.getInfo(SMODS.current_mod.path .. path .. "/" .. "_index.lua")
    if index_info and index_info.type == "file" then
        local index = assert(SMODS.load_file(path .. "/" .. "_index.lua"))()
        if not index then return end
        local function load_table(table, path_append, path_type)
            for _, item in ipairs(table) do
                local full_path = SMODS.current_mod.path .. path .. "/" .. item .. (path_append or "")
                local info = SMODS.NFS.getInfo(full_path)
                if info then
                    if info.type == path_type then
                        assert(SMODS.load_file(path .. "/" .. item .. (path_append or "")))()
                    else
                        print("dzhandrys jokers ERROR: path is said to be a " .. path_type .. ", but it's not: '" ..
                            full_path .. "' type: '" .. info.type .. "'")
                    end
                else
                    print("dzhandrys jokers ERROR: cannot find path: " .. full_path)
                end
            end
        end

        if index.files then load_table(index.files, ".lua", "file") end
        if index.dirs then load_table(index.dirs, "", "directory") end
        return
    end

    -- no index, load all items in alphabetical order
    local items = SMODS.NFS.getDirectoryItems(SMODS.current_mod.path .. path)

    for _, item in ipairs(items) do
        local full_path = SMODS.current_mod.path .. path .. "/" .. item
        local info = SMODS.NFS.getInfo(full_path)

        if info.type == "directory" then
            load_dir(path .. "/" .. item)
        elseif info.type == "file" and item:match("%.lua$") then
            assert(SMODS.load_file(path .. "/" .. item))()
        end
    end
end

load_dir("main")
load_dir("items")

local draw_card_ref = draw_card
function draw_card(from, to, percent, dir, sort, card, delay, mute, stay_flipped, vol, discarded_only)
    return draw_card_ref(from, to, percent, dir, sort, card, 0, mute, stay_flipped, vol, discarded_only)
end
