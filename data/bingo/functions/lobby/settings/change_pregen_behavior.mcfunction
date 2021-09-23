#> bingo:lobby/settings/change_pregen_behavior
#
# This function prints the prompt for changing pregen behavior.
#
# @within bingo:lobby/set_signs
# @user
# @context entity Player changing the setting

tellraw @s [{"translate": "bingo.lobby.settings.pregen_behavior.info.on_game_start.prefix"}, {"translate": "bingo.lobby.settings.pregen_behavior.info.on_game_start", "color": "gray"}, "\n\n", {"translate": "bingo.lobby.settings.pregen_behavior.info.on_card_generation.prefix"}, {"translate": "bingo.lobby.settings.pregen_behavior.info.on_card_generation", "color": "gray"}, "\n"]
execute if score $automatically_pregen bingo.settings matches 0 run tellraw @s ["[", {"translate": "bingo.lobby.settings.pregen_behavior.turn_off", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger bingo.settings set 21"}}, "]"]
execute if score $automatically_pregen bingo.settings matches 1 run tellraw @s ["[", {"translate": "bingo.lobby.settings.pregen_behavior.turn_on", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger bingo.settings set 22"}}, "]"]