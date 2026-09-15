local function update_sprites(card)
    local x = math.floor(math.max(math.min(card.ability.extra.triggers / 2, 5), 0))
    card.children.center:set_sprite_pos({ x = x, y = 3 }) -- POS
end

local juice_until = function(c)
    return c.ability.extra.hands_until_trigger == 0 and not G.RESET_JIGGLES and c.ability.extra.hands_reset ~= 0
end

SMODS.Joker {
    key = "cryptic_loyalty_card",
    attributes = { "cryptic", "xmult", "hands" },
    atlas = "jokers",
    -- if changing pos, search for "POS" in this file
    pos = { x = 0, y = 3 },
    blueprint_compat = false,
    perishable_compat = false,
    demicoloncompat = true,
    rarity = 3,
    cost = 8,
    config = {
        extra = {
            hands_until_trigger = 5,
            hands_reset = 5,
            hands_change = 0.5,
            triggers = 0,
            xmult = 3,
        }
    },
    loc_vars = function(self, info_queue, card)
        local extra = card.ability.extra
        local next_decrease = extra.hands_reset % 1 ~= 0
        return {
            vars = {
                extra.xmult,
                math.ceil(extra.hands_reset) + 1,
                extra.hands_change,
                localize { type = 'variable', key = (extra.hands_until_trigger == 0 and 'loyalty_active' or 'loyalty_inactive'), vars = { extra.hands_until_trigger } },
                localize { type = 'variable', key = (extra.hands_reset == 0 and 'dzhrj_loyalty_max_level' or next_decrease and 'dzhrj_loyalty_singular_triggers' or 'dzhrj_loyalty_plural_triggers'), vars = { next_decrease and 1 or 2 } },
            }
        }
    end,
    set_sprites = function(self, card, front)
        if not card.config.center.unlocked or not card.config.center.discovered then return end
        G.E_MANAGER:add_event(Event({
            func = function()
                update_sprites(card)
                return true
            end
        }))
    end,
    calculate = function(self, card, context)
        if context.forcetrigger then
            return {
                xmult = card.ability.extra.xmult
            }
        end

        if context.setting_blind and card.ability.extra.hands_reset ~= 0 and card.ability.extra.hands_until_trigger == 0 and not context.blueprint then
            juice_card_until(card, juice_until, true)
            return
        end

        if context.joker_main then
            card.ability.extra.hands_until_trigger = card.ability.extra.hands_until_trigger - 1
            if card.ability.extra.hands_until_trigger == 0 then
                juice_card_until(card, juice_until, true)
            end

            if card.ability.extra.hands_until_trigger < 0 then
                card.ability.extra.triggers = card.ability.extra.triggers + 1
                local upgraded = card.ability.extra.hands_reset > 0 and card.ability.extra.hands_reset % 1 ~= 0
                -- i don't think i should call SMODS.scale_card here
                card.ability.extra.hands_reset = math.max(
                    card.ability.extra.hands_reset - card.ability.extra.hands_change, 0)
                card.ability.extra.hands_until_trigger = math.ceil(card.ability.extra.hands_reset)
                if upgraded then
                    return {
                        xmult = card.ability.extra.xmult,
                        func = function()
                            G.E_MANAGER:add_event(Event({
                                blocking = false,
                                func = function()
                                    card:juice_up(0.8, 0.8)
                                    update_sprites(card)
                                    SMODS.calculate_effect({
                                        message = localize('k_upgrade_ex'),
                                        colour = G.C.FILTER,
                                        card = self
                                    }, card)
                                    return true
                                end
                            }))
                            return true
                        end
                    }
                else
                    return {
                        xmult = card.ability.extra.xmult
                    }
                end
            end
        end
    end
}
