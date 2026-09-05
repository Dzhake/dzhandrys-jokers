local ref_eval_card = eval_card
function eval_card(card, context)
    if not card then return end
    local g, post = ref_eval_card(card, context)
    if G._dzhrj_calculating_mod_retriggers then
        return
            g, post
    end

    G._dzhrj_calculating_mod_retriggers = true
    local base_add, base_mult = 0, 1
    local ret = SMODS.calculate_context({
        dzhrj_mod_retriggers = true,
        other_context = context,
        dzhrj_retriggers_add = base_add,
        dzhrj_retriggers_mult = base_mult,
    })
    G._dzhrj_calculating_mod_retriggers = nil
    if not ret then return g, post end

    local retriggers_add = ret.dzhrj_retriggers_add or base_add
    local retriggers_mult = ret.dzhrj_retriggers_mult or base_mult

    if (retriggers_add ~= base_add) or (retriggers_mult ~= base_mult) then
        for k, v in pairs(g) do
            if type(v) == 'table' then
                if v.repetitions then
                    v.repetitions = v.repetitions + retriggers_add
                else
                    v.repetitions = retriggers_add
                end
                v.repetitions = v.repetitions * retriggers_mult
            end
        end
    end
    return g, post
end

local ref_calculate_individual_effect = SMODS.calculate_individual_effect
function SMODS.calculate_individual_effect(effect, scored_card, key, amount, from_edition)
    local amount_return_flags = {
        dzhrj_retriggers_add = true,
        dzhrj_retriggers_mult = true,
        dzhrj_bonus_calculations_add = true,
    }

    if amount_return_flags[key] then
        return { [key] = amount }
    end
    return ref_calculate_individual_effect(effect, scored_card, key, amount, from_edition)
end

table.insert(SMODS.other_calculation_keys, "dzhrj_retriggers_add")
table.insert(SMODS.other_calculation_keys, "dzhrj_retriggers_mult")
table.insert(SMODS.other_calculation_keys, "dzhrj_bonus_calculations_add")

local ref_update_context_flags = SMODS.update_context_flags
function SMODS.update_context_flags(context, flags)
    if flags.dzhrj_retriggers_add then context.dzhrj_retriggers_add = flags.dzhrj_retriggers_add end
    if flags.dzhrj_retriggers_mult then context.dzhrj_retriggers_mult = flags.dzhrj_retriggers_mult end
    if flags.dzhrj_bonus_calculations_add then context.dzhrj_bonus_calculations_add = flags.dzhrj_bonus_calculations_add end
    ref_update_context_flags(context, flags)
end

local ref_calculate_context = SMODS.calculate_context
function SMODS.calculate_context(context, return_table)
    if not G._dzhrj_calculating_bonus_calculations and context.remove_playing_cards then
        G._dzhrj_calculating_bonus_calculations = true

        local ret = SMODS.calculate_context({
            dzhrj_calculate_bonus_calculations = true,
            dzhrj_bonus_calculations_add = 0,
            other_context = context,
        })

        if not ret then
            return ref_calculate_context(context, return_table)
        end

        local count = ret.dzhrj_bonus_calculations_add or 0
        for i = 0, count do
            ret = ref_calculate_context(context, return_table)
        end
        G._dzhrj_calculating_bonus_calculations = nil
        return ret
    else
        return ref_calculate_context(context, return_table)
    end
end
