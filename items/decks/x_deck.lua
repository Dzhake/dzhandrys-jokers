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
        if context.post_trigger then
            local other_ret = context.other_ret.jokers or {}
            if (other_ret.mult or other_ret.h_mult or other_ret.mult_mod or other_ret.x_mult or other_ret.Xmult or other_ret.xmult or other_ret.x_mult_mod or other_ret.Xmult_mod) then
                return { xmult = self.config.xmult_on_each_xmult_trigger }
            end
        end
    end
}
