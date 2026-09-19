-- bonus retriggers hooks (cryptic mime)
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

-- context retriggers (hanged chad)
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

-- cryptic credit card effect
local ref_ease_dollars = ease_dollars
function ease_dollars(mod, instant)
    if mod < 0 then
        ref_ease_dollars(mod, instant)
        return
    end
    local credit_cards = SMODS.find_card("j_dzhrj_cryptic_credit_card")
    if not next(credit_cards) then
        ref_ease_dollars(mod, instant)
        return
    end
    local card = credit_cards[1]
    local scalar_table = { scalar = mod * card.ability.extra.bankrupt_at_mod }
    SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "bankrupt_at",
        scalar_value = "scalar",
        scalar_table = scalar_table,
        no_message = true,
    })
    card:juice_up(0.8)
    G.GAME.bankrupt_at = G.GAME.bankrupt_at - scalar_table.scalar
end

-- astronomer effect
local ref_create_card = create_card
function create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
    if _type == "Planet" then
        local astronomers = SMODS.find_card("j_dzhrj_cryptic_astronomer")
        if next(astronomers) then
            forced_key = astronomers[1].ability.extra.planet
        end
    end
    return ref_create_card(_type, area, legendary, _rarity, skip_materialize, soulable, forced_key, key_append)
end

-- booster pack pack patch
local ref_use_card = G.FUNCS.use_card
function G.FUNCS.use_card(e, mute, nosave)
    if G.GAME._dzhrj_booster_pack and e.config.ref_table.ability.set == "Booster" then
        G.GAME._dzhrj_booster_pack = nil
        stop_use()
        if G.booster_pack then
            G.booster_pack.alignment.offset.y = G.ROOM.T.y + 9
            G.booster_pack:remove()
            G.booster_pack = nil
            if G.booster_pack_sparkles then
                G.booster_pack_sparkles:remove(); G.booster_pack_sparkles = nil
            end
            if G.booster_pack_stars then
                G.booster_pack_stars:remove(); G.booster_pack_stars = nil
            end
            if G.booster_pack_meteors then
                G.booster_pack_meteors:remove(); G.booster_pack_meteors = nil
            end
        end

        --[[G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2 * delayfac,
            func = function()
                G.FUNCS.draw_from_hand_to_deck()
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2 * delayfac,
                    func = function()
                        if G.shop and G.shop.alignment.offset.py then
                            G.shop.alignment.offset.y = G.shop.alignment.offset.py
                            G.shop.alignment.offset.py = nil
                        end
                        if G.blind_select and G.blind_select.alignment.offset.py then
                            G.blind_select.alignment.offset.y = G.blind_select.alignment.offset.py
                            G.blind_select.alignment.offset.py = nil
                        end
                        if G.round_eval and G.round_eval.alignment.offset.py then
                            G.round_eval.alignment.offset.y = G.round_eval.alignment.offset.py
                            G.round_eval.alignment.offset.py = nil
                        end
                        G.CONTROLLER.interrupt.focus = true

                        G.E_MANAGER:add_event(Event({
                            func = function()
                                if G.shop then G.CONTROLLER:snap_to({ node = G.shop:get_UIE_by_ID('next_round_button') }) end
                                return true
                            end
                        }))
                        G.STATE = G.GAME.PACK_INTERRUPT
                        ease_background_colour_blind(G.GAME.PACK_INTERRUPT)
                        G.GAME.PACK_INTERRUPT = nil
                        return true
                    end
                }))
                for i = 1, #G.GAME.tags do
                    if G.GAME.tags[i]:apply_to_run({ type = 'new_blind_choice' }) then break end
                end

                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2 * delayfac,
                    func = function()
                        save_run()
                        return true
                    end
                }))

                return true
            end
        }))]]
        --[[G.FUNCS.end_consumeable(nil, 0)
        -- double nested event because end_consumeable has some, and we need to run use_card after events in use_consumeable
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            func = function()
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    func = function()
                        ref_use_card(e, mute, nosave)
                        return true
                    end
                }))
                return true
            end
        }))
        return]]
    end
    ref_use_card(e, mute, nosave)
end
