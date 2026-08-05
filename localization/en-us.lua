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
            j_dzhrj_cryptic_joker = {
                name = "Cryptic Joker",
                text = {
                    "{X:mult,C:white}X#1# {} Mult"
                }
            },
            j_dzhrj_cryptic_greedy_joker = {
                name = "Cryptic Greedy Joker",
                text = {
                    "Played cards with",
                    "{C:diamonds}#2#{} suit give",
                    "{X:chips,C:white}X#1#{} Chips when scored",
                }
            },
            j_dzhrj_cryptic_lusty_joker = {
                name = "Cryptic Lusty Joker",
                text = {
                    "Played cards with",
                    "{C:hearts}#2#{} suit give",
                    "{X:chips,C:white}X#1#{} Chips when scored",
                }
            },
            j_dzhrj_cryptic_wrathful_joker = {
                name = "Cryptic Wrathful Joker",
                text = {
                    "Played cards with",
                    "{C:spades}#2#{} suit give",
                    "{X:chips,C:white}X#1#{} Chips when scored",
                }
            },
            j_dzhrj_cryptic_gluttonous_joker = {
                name = "Cryptic Gluttonous Joker",
                text = {
                    "Played cards with",
                    "{C:clubs}#2#{} suit give",
                    "{X:chips,C:white}X#1#{} Chips when scored",
                }
            },
            j_dzhrj_cryptic_jolly_joker = {
                name = "Cryptic Jolly Joker",
                text = {
                    "{X:mult,C:white}X#1#{} Mult if played",
                    "hand does {C:red}not contain",
                    "a {C:attention}#2#",
                },
            },
            j_dzhrj_cryptic_zany_joker = {
                name = "Cryptic Zany Joker",
                text = {
                    "{X:mult,C:white}X#1#{} Mult if played",
                    "hand does {C:red}not contain",
                    "a {C:attention}#2#",
                },
            },
            j_dzhrj_cryptic_mad_joker = {
                name = "Cryptic Mad Joker",
                text = {
                    "{X:mult,C:white}X#1#{} Mult if played",
                    "hand does {C:red}not contain",
                    "a {C:attention}#2#",
                },
            },
            j_dzhrj_cryptic_crazy_joker = {
                name = "Cryptic Crazy Joker",
                text = {
                    "{X:mult,C:white}X#1#{} Mult if played",
                    "hand does {C:red}not contain",
                    "a {C:attention}#2#",
                },
            },
            j_dzhrj_cryptic_droll_joker = {
                name = "Cryptic Droll Joker",
                text = {
                    "{X:mult,C:white}X#1#{} Mult if played",
                    "hand does {C:red}not contain",
                    "a {C:attention}#2#",
                },
            },

            j_dzhrj_cryptic_sly_joker = {
                name = "Cryptic Sly Joker",
                text = {
                    "{X:chips,C:white}X#1#{} Chips if played",
                    "hand does {C:red}not contain",
                    "a {C:attention}#2#",
                },
            },
            j_dzhrj_cryptic_wily_joker = {
                name = "Cryptic Wily Joker",
                text = {
                    "{X:chips,C:white}X#1#{} Chips if played",
                    "hand does {C:red}not contain",
                    "a {C:attention}#2#",
                },
            },
            j_dzhrj_cryptic_clever_joker = {
                name = "Cryptic Clever Joker",
                text = {
                    "{X:chips,C:white}X#1#{} Chips if played",
                    "hand does {C:red}not contain",
                    "a {C:attention}#2#",
                },
            },
            j_dzhrj_cryptic_devious_joker = {
                name = "Cryptic Devious Joker",
                text = {
                    "{X:chips,C:white}X#1#{} Chips if played",
                    "hand does {C:red}not contain",
                    "a {C:attention}#2#",
                },
            },
            j_dzhrj_cryptic_crafty_joker = {
                name = "Cryptic Crafty Joker",
                text = {
                    "{X:chips,C:white}X#1#{} Chips if played",
                    "hand does {C:red}not contain",
                    "a {C:attention}#2#",
                },
            },
            j_dzhrj_cryptic_half_joker = {
                name = "Cryptic Half Joker",
                text = {
                    "Creates a {C:dark_edition}Negative {C:tarot,T:c_hanged_man}The Hanged Man",
                    "when {C:attention}Blind{} is selected",
                },
                unlock = {
                    "Reduce deck size to {C:attention}#1#{C:inactive} or less ;)",
                    "{C:inactive}(Currently {C:attention}#2#{C:inactive})"
                },
            },
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
            j_dzhrj_cryptic_credit_card = {
                name = "Cryptic Credit Card",
                text = {
                    "Rerolls cost {C:money}$5{} less"
                },
                unlock = {
                    "Have {X:money,C:white}$#1#{} or less",
                },
            },
            j_dzhrj_cryptic_ceremonial_dagger = {
                name = "Cryptic Ceremonial Dagger",
                text = {
                    "When blind is selected, sell joker to the right,",
                    "ignoring Eternal sticker"
                }
            },
            j_dzhrj_cryptic_ceremonial_dagger_upgraded = {
                name = "Cryptic Ceremonial Dagger",
                text = {
                    "When blind is selected, sell joker to the right",
                    "for {X:money,C:white}X#1#{} its sell value,",
                    "ignoring Eternal sticker,"
                }
            },
            j_dzhrj_cryptic_madness = {
                name = "Cryptic Madness",
                text = {
                    "{C:attention}Eternal{} jokers each give {X:mult,C:white}X#1#{} Mult"
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
