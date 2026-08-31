assert(SMODS.current_mod.lovely, "Lovely patches were not loaded! Make sure your mod is in the right place.")

SMODS.current_mod.optional_features = {
    --quantum_enhancements = true,
    --object_weights = true,
    post_trigger = true
}


local function load_dir(path)
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


-- IMPORTANT: comment this line when sharing the mod!
--assert(SMODS.load_file("debug.lua"))()


load_dir("main")
load_dir("items")

local draw_card_ref = draw_card
function draw_card(from, to, percent, dir, sort, card, delay, mute, stay_flipped, vol, discarded_only)
    return draw_card_ref(from, to, percent, dir, sort, card, 0, mute, stay_flipped, vol, discarded_only)
end
