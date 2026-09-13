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
    cost = 7,
    config = {
        extra = {
            hands_until_trigger = 5,
            hands_reset = 5,
            hands_change = 1,
            triggers = 0,
            xmult = 4,
        }
    },
    loc_vars = function(self, info_queue, card)
        local extra = card.ability.extra
        return {
            vars = {
                extra.xmult, extra.hands_reset + 1, extra.hands_change, localize { type = 'variable', key = (extra.hands_until_trigger == 0 and 'loyalty_active' or 'loyalty_inactive'), vars = { extra.hands_until_trigger } }
            }
        }
    end,
    set_sprites = function(self, card, front)
        if not card.config.center.unlocked or not card.config.center.discovered then return end
        G.E_MANAGER:add_event(Event({
            func = function()
                local x = math.floor(math.max(math.min(card.ability.extra.triggers, 5), 0))
                card.children.center:set_sprite_pos({ x = x, y = 3 }) -- POS
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

        if (context.joker_main or context.setting_blind) and not context.blueprint and card.ability.extra.hands_until_trigger == 0 and card.ability.extra.hands_reset ~= 0 then
            local eval = function(c)
                return c.ability.extra.hands_until_trigger == 0 and not G.RESET_JIGGLES
            end
            juice_card_until(card, eval, true)
        end

        if context.joker_main then
            card.ability.extra.hands_until_trigger = card.ability.extra.hands_until_trigger - 1

            if card.ability.extra.hands_until_trigger < 0 then
                card.ability.extra.triggers = card.ability.extra.triggers + 1
                -- i don't think i should call SMODS.scale_card here
                card.ability.extra.hands_reset = math.max(
                    card.ability.extra.hands_reset - card.ability.extra.hands_change, 0)
                card.ability.extra.hands_until_trigger = card.ability.extra.hands_reset
                return {
                    xmult = card.ability.extra.xmult,
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            blocking = false,
                            func = function()
                                card:juice_up(0.8, 0.8)
                                local x = math.floor(math.max(math.min(card.ability.extra.triggers, 5), 0))
                                card.children.center:set_sprite_pos({ x = x, y = 3 }) -- POS
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
            end
        end
    end
}
