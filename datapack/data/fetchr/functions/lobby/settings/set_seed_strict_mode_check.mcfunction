#> fetchr:lobby/settings/set_seed_strict_mode_check
#
# This function checks whether strict mode is active and the player clicking is
# a confirmed operator, and the either asks the player to confirm their op
# status or prints instructions for generting a card from a set seed
#
# @user
# @context entity Player changing the setting

execute unless score $strict_mode fetchr.settings matches 1 run tellraw @s [{"translate": "fetchr.lobby.card_generation.from_seed.instructions", "with": [{"translate": "fetchr.lobby.card_generation.from_seed.instructions.link", "color":"#00c3ff", "clickEvent": {"action": "suggest_command", "value": "/trigger fetchr.seed set "}}]}, "\n", {"translate": "fetchr.lobby.card_generation.from_seed.explanation", "italic": true, "color": "gray"}]
execute if score $strict_mode fetchr.settings matches 1 if score @s fetchr.operator matches 1 run tellraw @s [{"translate": "fetchr.lobby.card_generation.from_seed.instructions", "with": [{"translate": "fetchr.lobby.card_generation.from_seed.instructions.link", "color":"#00c3ff", "clickEvent": {"action": "suggest_command", "value": "/trigger fetchr.seed set "}}]}, "\n", {"translate": "fetchr.lobby.card_generation.from_seed.explanation", "italic": true, "color": "gray"}]
execute if score $strict_mode fetchr.settings matches 1 if score @s fetchr.operator matches 0 run function fetchr:util/confirm_operator_status