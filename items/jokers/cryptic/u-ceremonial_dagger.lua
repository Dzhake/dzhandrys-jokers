SMODS.Joker {
    key = "cryptic_ceremonial_dagger",
    attributes = { "cryptic", "joker" },
    atlas = "jokers",
    -- if changing pos, search for "POS" in this file
    pos = { x = 0, y = 0 },
    blueprint_compat = false,
    perishable_compat = false,
    rarity = 2,
    cost = 6,
    config = {
        extra = {
            jokers_sold = 0,
            jokers_sold_max = 3,
            value_mult = 1,
            value_mult_mod = 1,
        }
    },
    loc_vars = function(self, info_queue, card)
        if card.ability.extra.jokers_sold ~= 0 then
            return {
                key = "j_dzhrj_cryptic_ceremonial_dagger_upgraded",
                vars = {
                    card.ability.extra.value_mult
                }
            }
        end
    end,
    set_sprites = function(self, card, front)
        G.E_MANAGER:add_event(Event({
            func = function()
                local x = math.floor(math.max(math.min(card.ability.extra.jokers_sold, 3), 0))
                card.children.center:set_sprite_pos({ x = x, y = 0 }) -- POS
                return true
            end
        }))
    end,
    calculate = function(self, card, context)
        if (context.setting_blind or context.forcetrigger) and not context.blueprint then
            local my_pos = nil
            local area = card.area
            for i = 1, #area.cards do
                if area.cards[i] == card then
                    my_pos = i
                    break
                end
            end

            if my_pos and area.cards[my_pos + 1] and not area.cards[my_pos + 1].getting_sliced then
                local sliced_card = G.jokers.cards[my_pos + 1]

                sliced_card.getting_sliced = true -- Make sure to do this on destruction effects
                G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                return {
                    func = function()
                        G.GAME.joker_buffer = 0
                        local sell_cost = sliced_card.sell_cost * card.ability.extra.value_mult
                        sliced_card.sell_cost = sell_cost
                        G.FUNCS.sell_card({ config = { ref_table = sliced_card } })
                        if card.ability.extra.jokers_sold < card.ability.extra.jokers_sold_max then
                            card.ability.extra.jokers_sold = card.ability.extra.jokers_sold + 1
                            G.E_MANAGER:add_event(Event({
                                blocking = false,
                                func = function()
                                    card:juice_up(0.8, 0.8)
                                    local x = math.floor(math.max(math.min(card.ability.extra.jokers_sold, 3), 0))
                                    card.children.center:set_sprite_pos({ x = x, y = 0 }) -- POS
                                    return true
                                end
                            }))
                            SMODS.scale_card(card, {
                                ref_table = card.ability.extra,
                                ref_value = "value_mult",
                                scalar_value = "value_mult_mod",
                                scaling_message = {
                                    message = localize('$') .. sell_cost,
                                    colour = G.C.MONEY,
                                    card = self
                                },
                            })
                            return true
                        else
                            G.E_MANAGER:add_event(Event({
                                blocking = false,
                                func = function()
                                    card:juice_up(0.8, 0.8)
                                    return true
                                end
                            }))
                            SMODS.calculate_effect({
                                message = localize('$') .. sell_cost,
                                colour = G.C.MONEY,
                                card = self
                            }, card)
                        end

                        return true
                    end
                }
            end
        end
    end
}
