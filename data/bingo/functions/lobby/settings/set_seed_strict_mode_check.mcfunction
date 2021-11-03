#> bingo:lobby/settings/set_seed_strict_mode_check
#
# This function checks whether strict mode is active and the player clicking is
# a confirmed operator, and the either asks the player to confirm their op
# status or prints instructions for generting a card from a set seed
#
# @within bingo:lobby/set_signs
# @user
# @context entity Player changing the setting

execute if score $strict_mode bingo.settings matches 0 run tellraw @s [{"translate": "bingo.lobby.card_generation.from_seed.instructions", "with": [{"translate": "bingo.lobby.card_generation.from_seed.instructions.link", "color":"#00c3ff", "clickEvent": {"action": "suggest_command", "value": "/trigger bingo.seed set "}}]}, "\n", {"translate": "bingo.lobby.card_generation.from_seed.explanation", "italic": true, "color": "gray"}]
execute if score $strict_mode bingo.settings matches 1 if score @s bingo.operator matches 1 run tellraw @s [{"translate": "bingo.lobby.card_generation.from_seed.instructions", "with": [{"translate": "bingo.lobby.card_generation.from_seed.instructions.link", "color":"#00c3ff", "clickEvent": {"action": "suggest_command", "value": "/trigger bingo.seed set "}}]}, "\n", {"translate": "bingo.lobby.card_generation.from_seed.explanation", "italic": true, "color": "gray"}]
execute if score $strict_mode bingo.settings matches 1 if score @s bingo.operator matches 0 run function bingo:util/confirm_operator_status