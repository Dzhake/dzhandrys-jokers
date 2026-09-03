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
                    --"{C:inactive,s:0.8}(additive :c)"
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
                    "Come back when you unlock more jokers"
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
                    "Upgrade all poker hands by {C:planet}#1#{}",
                    "level at end of round.",
                    "Upgrade amount increases by {C:planet}#2#{}",
                    "when {C:attention}Boss Blind{} is defeated",
                },
            },
            j_dzhrj_cryptic_shortcut = {
                name = "Cryptic Shortcut",
                text = {
                    "After drawing cards with no discards left,",
                    "if your hand doesn't contain a {C:attention}Straight{},",
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
                    "Retrigger playing card {C:red}removal{} effects twice",
                    "{C:inactive}(e.g. destroy, shatter)"
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
    }
}
