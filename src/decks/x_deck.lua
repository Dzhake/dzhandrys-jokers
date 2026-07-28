SMODS.Back {
    key = "x_deck",
    atlas = "decks",
    pos = { x = 0, y = 0 },
    config = {
        xmult_on_each_xmult_trigger = -2,
    },
    loc_vars = function(self, info_queue, center)
        return { vars = { self.config.xmult_on_each_xmult_trigger, colours = { G.C.MULT } } }
    end,
    calculate = function(self, back, context)
        if context.post_trigger and (context.other_ret.jokers.mult or context.other_ret.jokers.h_mult or context.other_ret.jokers.mult_mod or context.other_ret.jokers.x_mult or context.other_ret.jokers.Xmult or context.other_ret.jokers.xmult or context.other_ret.jokers.x_mult_mod or context.other_ret.jokers.Xmult_mod) then
            return { xmult = self.config.xmult_on_each_xmult_trigger }
        end
    end
}

--[[local scie = SMODS.calculate_individual_effect
function SMODS.calculate_individual_effect(effect, scored_card, key, amount, from_edition)
    local ret = scie(effect, scored_card, key, amount, from_edition)
    if
        G.GAME.selected_back.effect.center.config.xmult_on_each_xmult_trigger and
        (((key == "x_mult" or key == "xmult" or key == "Xmult" or key == "x_mult_mod" or key == "xmult_mod" or key == "Xmult_mod")
            and amount ~= 1) or ((key == "mult" or key == "mult_mod")) and amount ~= 0) and mult
    then
        local xmult = G.GAME.selected_back.effect.center.config.xmult_on_each_xmult_trigger
        mult = mod_mult(mult * xmult)
        update_hand_text({ delay = 0 }, { mult = mult })
        card_eval_status_text(
            effect.message_card or effect.juice_card or scored_card or effect.card or effect.focus, 'x_mult', xmult)
    end
    return ret
end
]]
