#> fetchr:lobby/settings/change_pregen_behavior
#
# This function prints the prompt for changing pregen behavior.
#
# @within
# 	fetchr:lobby/settings/pregen_strict_mode_check
# 	fetchr:lobby/player_tick
# @context entity Player changing the setting

tellraw @s [{"translate": "fetchr.lobby.settings.pregen_behavior.info.on_game_start.prefix"}, {"translate": "fetchr.lobby.settings.pregen_behavior.info.on_game_start", "color": "gray"}, "\n\n", {"translate": "fetchr.lobby.settings.pregen_behavior.info.on_card_generation.prefix"}, {"translate": "fetchr.lobby.settings.pregen_behavior.info.on_card_generation", "color": "gray"}, "\n"]
execute if score $automatically_pregen fetchr.settings matches 0 run tellraw @s ["[", {"translate": "fetchr.lobby.settings.pregen_behavior.turn_off", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.settings set 21"}}, "]"]
execute if score $automatically_pregen fetchr.settings matches 1 run tellraw @s ["[", {"translate": "fetchr.lobby.settings.pregen_behavior.turn_on", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.settings set 22"}}, "]"]