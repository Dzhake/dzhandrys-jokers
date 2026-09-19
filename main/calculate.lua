SMODS.current_mod.calculate = function(self, context)
    if context.end_of_round and context.main_eval and context.game_over == false and G.GAME.blind.config.blind.boss.showdown then
        G.GAME._dzhrj_used_soul_pack = nil
    end
end
