local mod = SMODS.current_mod

--[[mod.ui_config = {
    colour = HEX("3E089C"),                                                                            -- Colour of the mod menu
    author_colour = HEX("52E815"),                                                                     -- Colour of the text displaying the mod authors
    bg_colour = { HEX("3E089C"), lighten(HEX("3E089C"), 0.2), darken(HEX("3E089C"), 0.2) },            -- Colour of the area behind the mod menu.
    back_colour = HEX("52E815"),                                                                       -- Colour of the "Back" button
    tab_button_colour = HEX("52E815"),                                                                 -- Colour of the tab buttons
    collection_colour = HEX("52E815"),                                                                 -- Colour of the collections menu. Defaults to `colour` if not provided.
    collection_bg_colour = { HEX("3E089C"), lighten(HEX("3E089C"), 0.2), darken(HEX("3E089C"), 0.2) }, -- Colour of the area behind the collections menu. Defaults to `bg_colour` if not provided.
    collection_back_colour = HEX("3E089C"),                                                            -- Colour of the "Back" button in the collections menu. Defaults to `back_colour` if not provided.
    collection_option_cycle_colour = HEX("52E815")                                                     -- Colour of the option cycle in the collection
}]]

mod.config_tab = function()
    return {
        n = G.UIT.ROOT,
        config = { r = 0.1, minw = 8, align = "tm", padding = 0.2, colour = G.C.BLACK },
        nodes = {
            {
                n = G.UIT.R,
                config = { padding = 0.2 },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = { align = "cr" },
                        nodes = {
                            create_toggle({
                                label = localize("c_dzhrj_cryptid_splash"),
                                info = localize("c_dzhrj_cryptid_splash_desc"),
                                ref_table = mod.config,
                                ref_value = 'cryptid_splash',
                                callback = function() SMODS.save_mod_config(mod) end
                            }),
                            create_toggle({
                                label = localize("c_dzhrj_cryptid_screenwipe"),
                                info = localize("c_dzhrj_cryptid_screenwipe_desc"),
                                ref_table = mod.config,
                                ref_value = 'cryptid_screenwipe',
                                callback = function() SMODS.save_mod_config(mod) end
                            }),
                            create_toggle({
                                label = localize("c_dzhrj_negative_screenwipe"),
                                info = localize("c_dzhrj_negative_screenwipe_desc"),
                                ref_table = mod.config,
                                ref_value = 'negative_screenwipe',
                                callback = function() SMODS.save_mod_config(mod) end
                            }),
                        }
                    },
                }
            },
        }
    }
end
