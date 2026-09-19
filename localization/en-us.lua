return {
    descriptions = {
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
                    "All probabilities are {C:green,E:1,S:1.1}guaranteed",
                    "{C:inactive}(ex: {C:green}1 in 3{C:inactive} -> {C:green}-nan in -nan{C:inactive})",
                }
            },
            j_dzhrj_cryptic_gros_michel = {
                name = "Cryptic Gros Michel",
                text = {
                    "{X:mult,C:white}X#1#{} Mult",
                    "{C:green}#2# in #3#{} chance this",
                    "card is destroyed",
                    "at end of round",
                    "{C:inactive,s:0.8}(Requires Cavendish to self-destruct this run",
                    "{C:inactive,s:0.8}to be able to spawn)"
                },
                unlock = {
                    "Destroy {C:attention}Cavendish{} via it's effect."
                }
            },
            j_dzhrj_cryptic_cavendish_secret = {
                name = "??????",
                text = {
                    "if you're seeing this, something is wrong xd",
                },
                unlock = {
                    "Come back when you unlock joker to the left"
                }
            },
            j_dzhrj_cryptic_cavendish = {
                name = "Cryptic Cavendish",
                text = {
                    "{X:talisman_emult,C:white}^#1#{} Mult",
                    "{C:inactive,s:0.8}(Requires Cryptic Gros Michel to be destroyed in any way",
                    "{C:inactive,s:0.8}but self-destruct this run to be able to spawn)",
                },
                unlock = {
                    "{C:red}Destroy {C:attention}Cryptic Gros Michel{C:inactive} (not via its effect)",
                }
            },
            j_dzhrj_cryptic_vagabond = {
                name = "Cryptic Vagabond",
                text = {
                    "Create a {C:spectral}Spectral{} card",
                    "if hand is played",
                    "with {C:money}$#1#{} or less",
                },
            },
            j_dzhrj_cryptic_rocket = {
                name = "Cryptic Rocket",
                text = {
                    "Upgrade {C:attention}last played poker hand{} by {C:planet}#1#{}",
                    "level{C:inactive}s{} at end of round.",
                    "Upgrade amount increases by {C:planet}#2#{}",
                    "when {C:attention}Boss Blind{} is defeated",
                },
            },
            j_dzhrj_cryptic_shortcut = {
                name = "Cryptic Shortcut",
                text = {
                    "After drawing cards, if you have no discards left",
                    "and your hand doesn't contain a {C:attention}Straight{},",
                    "gain {C:red}+1{} discard"
                },
            },
            j_dzhrj_icon = {
                name = "Icon",
                text = {
                    "First {C:attention}King{} held in hand",
                    "gives {X:mult,C:white}X#1#{} Mult when scored"
                }
            },
            j_dzhrj_hanged_chad = {
                name = "Hanged Chad",
                text = {
                    "Retrigger {C:attention}playing{} card {C:red}removal{} effects {C:attention}twice",
                    "{C:inactive}(e.g. destroy, shatter)"
                }
            },
            j_dzhrj_cryptic_acrobat = {
                name = "Cryptic Acrobat",
                text = {
                    "Retrigger last card held in hand {C:attention}#1#{} times"
                }
            },
            j_dzhrj_cryptic_smeared_joker = {
                name = "Cryptic Smeared Joker",
                text = {
                    "All cards count as the same suit",
                    "{C:inactive}Hearts, obviously"
                }
            },
            j_dzhrj_cryptic_greedy = {
                name = "Cryptic Greedy Joker",
                text = {
                    "Played cards with {C:diamonds}#1#{} suit",
                    "give {C:white,X:mult}X#2#{} Mult and {C:money}$#3#{} when scored"
                }
            },
            j_dzhrj_cryptic_lusty = {
                name = "Cryptic Lusty Joker",
                text = {
                    "Played cards with {C:hearts}#1#{} suit",
                    "have {C:green}#2# in #3#{} chance to give {C:white,X:mult}X#4#{},",
                    "otherwise, give {C:white,X:mult}X#5#"
                }
            },
            j_dzhrj_cryptic_wrathful = {
                name = "Cryptic Wrathful Joker",
                text = {
                    "Played cards with {C:spades}#1#{} suit",
                    "give {C:white,X:mult}X#2#{} Mult",
                    "and {C:white,X:chips}X#3#{} Chips when scored"
                }
            },
            j_dzhrj_cryptic_gluttonous = {
                name = "Cryptic Gluttonous Joker",
                text = {
                    "Played cards with {C:clubs}#1#{} suit",
                    "give {C:mult}+#2#{} Mult, then {C:white,X:mult}X#3#{} Mult",
                    "when scored"
                }
            },
            j_dzhrj_cryptic_loyalty_card = {
                name = "Cryptic Loyalty Card",
                text = {
                    "{X:red,C:white} X#1# {} Mult every {C:attention}#2#{} hands played",
                    "hands amount decreases by {C:attention}1{} every other trigger",
                    "{C:inactive}#4#",
                    "{C:inactive}#5#"
                },
            },
            j_dzhrj_cryptic_hanging_chad = {
                name = "Cryptic Hanging Chad",
                text = {
                    "When a playing card is scored, move it to the right",
                    "{C:inactive}Applies during scoring, meaning",
                    "{C:inactive}jokers to the right trigger after the move",
                }
            },
            j_dzhrj_cryptic_credit_card = {
                name = "Cryptic Credit Card",
                text = {
                    "When you gain money, increase debt limit",
                    "by {C:white,X:money}X#2#{} the money value instead",
                    "{C:inactive}Currently gives {C:red}$-#1# {C:inactive}debt limit",
                },
            },
            j_dzhrj_cryptic_cartomancer = {
                name = "Cryptic Cartomancer",
                text = {
                    "{C:tarot}Arcana{} booster packs have a {C:attention}guaranteed {C:tarot}#1#{}.",
                    "{C:attention}Skip{} any booster pack to reroll the card"
                }
            },
            j_dzhrj_cryptic_astronomer = {
                name = "Cryptic Astronomer",
                text = {
                    --"{C:attention}+#2#{} choice in {C:planet}Celestial{} booster packs.",
                    "All planets are replaced with {C:planet}#1#{}.",
                    "{C:attention}Skip{} any booster pack to reroll the card"
                }
            },
            j_dzhrj_cryptic_drunkard = {
                name = "Cryptic Drunkard",
                text = {
                    "{C:white,X:attention}-1{} Ante"
                }
            },
            j_dzhrj_cryptic_to_the_moon = {
                name = "Cryptic To the Moon",
                text = {
                    "All jokers scale {C:white,X:attention}+X#2#{} faster",
                    "for every {C:money}$#1#{} you have.",
                    "{C:inactive}Currently {C:white,X:attention}X#3#"
                }
            },

            j_dzhrj_p03 = {
                name = "P03",
                text = {
                    "Gain {C:attention}+#2#{} hand size after play or discard,",
                    "resets to {C:attention}+#3#{} when blind is selected",
                    "{C:inactive}(Currently {C:attention}+#1#{C:inactive} hand size)"
                }
            },
            j_dzhrj_martin = {
                name = "Martin of Martins",
                text = {
                    "Cards scored last round appear on top of the deck",
                    "{C:inactive}(Dance of Cards is a really cool game)"
                }
            },
        }
    },

    misc = {
        v_dictionary = {
            dzhrj_loyalty_plural_triggers = "#1# triggers until upgrade",
            dzhrj_loyalty_singular_triggers = "#1# trigger until upgrade",
            dzhrj_loyalty_max_level = "Max level"
        }
    }
}
