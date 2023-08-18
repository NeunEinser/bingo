#> fetchr:lobby/settings/toggle_blind_mode
#
# This function checks whether strict mode is active and the player clicking is
# a confirmed operator, and the either asks the player to confirm their op
# status or toggles the blind mode setting.
#
# @user
# @context entity Player changing the setting

execute if score $operator_only fetchr.settings matches 1 unless score @s fetchr.operator matches 1 run function fetchr:util/show_confirm_operator_status_prompt
execute if score $operator_only fetchr.settings matches 1 unless score @s fetchr.operator matches 1 run return 0

scoreboard players add $blind_mode fetchr.settings 1
execute if score $blind_mode fetchr.settings matches 2 run scoreboard players set $blind_mode fetchr.settings 0

execute if score $blind_mode fetchr.settings matches 0 run tellraw @s ["", {"translate": "fetchr.lobby.settings.blind_mode.toggle.off", "color": "red"}, "\n", {"translate": "fetchr.lobby.settings.blind_mode.toggle.info", "color": "gray", "italic": true}]
execute if score $blind_mode fetchr.settings matches 1 run tellraw @s ["", {"translate": "fetchr.lobby.settings.blind_mode.toggle.on", "color": "green"}, "\n", {"translate": "fetchr.lobby.settings.blind_mode.toggle.info", "color": "gray", "italic": true}]

execute if score $blind_mode fetchr.settings matches 0 run data modify entity @e[type=minecraft:marker, tag=fetchr.blind_mode_sign, distance=..1, limit=1] data.front_text.messages[3] set value '{"translate": "fetchr.lobby.settings.blind_mode.sign.off", "color": "gray"}'
execute if score $blind_mode fetchr.settings matches 1 run data modify entity @e[type=minecraft:marker, tag=fetchr.blind_mode_sign, distance=..1, limit=1] data.front_text.messages[3] set value '{"translate": "fetchr.lobby.settings.blind_mode.sign.on", "color": "green"}'