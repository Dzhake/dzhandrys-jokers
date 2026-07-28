SMODS.current_mod.optional_features = {
    --quantum_enhancements = true,
    --object_weights = true,
}

SMODS.Atlas {
    key = "jokers",
    path = "jokers.png",
    px = 71,
    py = 95,
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

load_dir("src/jokers")
