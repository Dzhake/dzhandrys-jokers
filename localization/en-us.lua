return {
    descriptions = {
        Back = {
            b_dzhrj_x_deck = {
                name = "X Deck",
                text = {
                    -- post_trigger only works with jokers
                    --"When a {C:mult}+ Mult{} or {B:1,C:white}X Mult{} is applied,",
                    "When a joker gives {C:mult}+ Mult{} or {B:1,C:white}X Mult{}",
                    "an additional {X:mult,C:white}X#1#{} Mult is applied"
                }
            }
        },
        Joker = {
            j_dzhrj_cryptic_joker_stencil = {
                name = "Cryptic Joker Stencil",
                text = {
                    "{X:mult,C:white}X#2#{} Mult per each unused card selection",
                    "{C:inactive}(Minimum {X:mult,C:white}X#3#{C:inactive}, current selection limit: {C:attention}#1#{C:inactive})",
                },
            },
            j_dzhrj_cryptic_four_fingers = {
                name = "Cryptic Four Fingers",
                text = {
                    "All hands count as {C:attention}Straight Flush"
                },
            },
            j_dzhrj_cryptic_mime = {
                name = "Cryptic Mime",
                text = {
                    "{E:1,X:spades,C:hearts}Double{} all retriggers",
                    "{C:inactive,s:0.8}(additive :c)"
                },
            },
            j_dzhrj_cryptic_ceremonial_dagger = {
                name = "Cryptic Dagger",
                text = {
                    "When blind is selected,",
                    "sell card to the right",
                    "{C:inactive}????????????????????,",
                    "ignoring Eternal sticker"
                }
            },
            j_dzhrj_cryptic_ceremonial_dagger_upgraded = {
                name = "Bloody Cryptic Dagger",
                text = {
                    "When blind is selected,",
                    "sell card to the right",
                    "for {X:money,C:white}X#1#{} its sell value,",
                    "ignoring Eternal sticker"
                }
            },
            j_dzhrj_cryptic_madness = {
                name = "Cryptic Madness",
                text = {
                    "{C:attention}Eternal{} jokers each give {X:mult,C:white}X#1#{} Mult"
                }
            },
            j_dzhrj_cryptic_oops = {
                name = "Oops! All NaN",
                text = {
                    "All probabilities are {C:green,E:1,S:1.1}guaranteed"
                }
            },

            j_dzhrj_p03 = {
                name = "P03",
                text = {
                    "Gain {C:attention}+#2#{} hand size after play or discard,",
                    "resets to {C:attention}+#3#{} when blind is selected",
                    "{C:inactive}(Currently {C:attention}+#1#{C:inactive} hand size)"
                }
            }
        }
    }
}
