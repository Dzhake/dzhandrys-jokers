SMODS.Joker {
    key = "superior_mime",
    attributes = { "superior", "retrigger" },
    blueprint_compat = true,
    atlas = "jokers",
    pos = { x = 4, y = 1 },
    config = {
        extra = {
            retriggers = 1,
        }
    },
    rarity = 3,
    cost = 12,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.retriggers
            }
        }
    end,
    calculate = function(self, card, context)

    end,
}

local oldevalcard = eval_card
function eval_card(card, context)
    if not card then return end
    local g, post = oldevalcard(card, context)
    if not card:can_calculate(context.ignore_debuff, context.remove_playing_cards or context.joker_type_destroyed) then
        return
            g, post
    end
    local mimes = SMODS.find_card("j_dzhandrys_jokers_superior_mime")
    if next(mimes) then
        for k, v in pairs(g) do
            if type(v) == 'table' and v.repetitions and type(v.repetitions) == 'number' then
                v.repetitions = v.repetitions * (2 ^ #mimes)
            end
        end
    end
    return g, post
end
