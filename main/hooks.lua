local ref_eval_card = eval_card
function eval_card(card, context)
    if not card then return end
    local g, post = ref_eval_card(card, context)
    if G._dzhrj_calculating_bonus_retriggers then
        return
            g, post
    end

    local bonus_retriggers_effects = {}
    G._dzhrj_calculating_bonus_retriggers = true
    SMODS.calculate_context({ dzhrj_bonus_retriggers = true }, bonus_retriggers_effects)
    G._dzhrj_calculating_bonus_retriggers = false

    local retriggers_mult = 1
    for i = 1, #bonus_retriggers_effects do
        if bonus_retriggers_effects[i] and bonus_retriggers_effects[i].jokers and bonus_retriggers_effects[i].jokers.dzhrj_do_bonus_retrigger then
            retriggers_mult = retriggers_mult + 1
        end
    end

    if next(bonus_retriggers_effects) then
        for k, v in pairs(g) do
            if type(v) == 'table' and v.repetitions and type(v.repetitions) == 'number' then
                v.repetitions = v.repetitions * retriggers_mult
            end
        end
    end
    return g, post
end
