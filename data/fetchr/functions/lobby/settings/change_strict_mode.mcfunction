#> fetchr:lobby/settings/change_strict_mode
#
# This function prints the prompt for changing strict mode.
#
# @within fetchr:lobby/settings/strict_mode_operator_check
# @context entity Player changing the setting

#>
# @private
#declare score_holder <player_name>
tellraw @s ["\n\n\n\n\n", {"translate": "fetchr.lobby.settings.strict_mode.info"}, "\n\n", {"translate": "fetchr.lobby.settings.strict_mode.revoke_from_player", "color": "gray", "italic": true, "with": [{"translate": "fetchr.lobby.settings.strict_mode.revoke_from_player.click", "color": "#00c3ff", "clickEvent": {"action": "suggest_command", "value": "/scoreboard players set <player_name> fetchr.operator 0"}}]}]
execute if score $strict_mode fetchr.settings matches 0 run tellraw @s ["\n[", {"translate": "fetchr.lobby.settings.strict_mode.turn_on", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/scoreboard players set $strict_mode fetchr.settings 1"}}, "]"]
execute if score $strict_mode fetchr.settings matches 1 run tellraw @s ["[", {"translate": "fetchr.lobby.settings.strict_mode.turn_off", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/scoreboard players set $strict_mode fetchr.settings 0"}}, "]"]