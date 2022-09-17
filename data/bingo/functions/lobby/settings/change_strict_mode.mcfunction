#> bingo:lobby/settings/change_strict_mode
#
# This function prints the prompt for changing strict mode.
#
# @within bingo:lobby/settings/strict_mode_operator_check
# @context entity Player changing the setting

#>
# @private
#declare score_holder <player_name>
tellraw @s ["\n\n\n\n\n", {"translate": "bingo.lobby.settings.strict_mode.info", "color": "green"}, "\n\n", {"translate": "bingo.lobby.settings.strict_mode.revoke_from_player", "color": "gray", "italic": true, "with": [{"translate": "bingo.lobby.settings.strict_mode.revoke_from_player.click", "color": "#00c3ff", "clickEvent": {"action": "suggest_command", "value": "/scoreboard players set <player_name> bingo.operator 0"}}, {"translate": "bingo.lobby.settings.strict_mode.revoke_from_player.click2", "color": "#00c3ff", "clickEvent": {"action": "suggest_command", "value": "/scoreboard players set <player_name> bingo.operator 1"}}]}]

execute if score $strict_mode bingo.settings matches 0 run tellraw @s ["\n[", {"translate": "bingo.lobby.settings.strict_mode.from_off_to_on", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/scoreboard players set $strict_mode bingo.settings 1"}}, "]\n[", {"translate": "bingo.lobby.settings.strict_mode.from_off_to_adventure", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/scoreboard players set $strict_mode bingo.settings 2"}}, "]"]
execute if score $strict_mode bingo.settings matches 1 run tellraw @s ["\n[", {"translate": "bingo.lobby.settings.strict_mode.from_on_to_off", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/scoreboard players set $strict_mode bingo.settings 0"}}, "]\n[", {"translate": "bingo.lobby.settings.strict_mode.from_on_to_adventure", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/scoreboard players set $strict_mode bingo.settings 2"}}, "]"]
execute if score $strict_mode bingo.settings matches 2 run tellraw @s ["\n[", {"translate": "bingo.lobby.settings.strict_mode.from_adventure_to_off", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/scoreboard players set $strict_mode bingo.settings 0"}}, "]\n[", {"translate": "bingo.lobby.settings.strict_mode.from_adventure_to_on", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/scoreboard players set $strict_mode bingo.settings 1"}}, "]"]