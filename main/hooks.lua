local oldevalcard = eval_card
function eval_card(card, context)
    if not card then return end
    local g, post = oldevalcard(card, context)
    if not card:can_calculate(context.ignore_debuff, context.remove_playing_cards or context.joker_type_destroyed) then
        return
            g, post
    end
    local superior_mimes = SMODS.find_card("j_dzhandrys_jokers_superior_mime")
    if next(superior_mimes) then
        for k, v in pairs(g) do
            if type(v) == 'table' and v.repetitions and type(v.repetitions) == 'number' then
                v.repetitions = v.repetitions * #superior_mimes
            end
        end
    end
    return g, post
end
