#> fetchr:lobby/settings/toggle_blind_mode
#
# This function changes the blind mode setting.
#
# @within fetchr:lobby/settings/blind_mode_strict_mode_check
# @context entity Player changing the setting

scoreboard players add $blind_mode fetchr.settings 1
execute if score $blind_mode fetchr.settings matches 2 run scoreboard players set $blind_mode fetchr.settings 0

execute if score $blind_mode fetchr.settings matches 0 run tellraw @s ["", {"translate": "fetchr.lobby.settings.blind_mode.toggle.off", "color": "red"}, "\n", {"translate": "fetchr.lobby.settings.blind_mode.toggle.info", "color": "gray", "italic": true}]
execute if score $blind_mode fetchr.settings matches 1 run tellraw @s ["", {"translate": "fetchr.lobby.settings.blind_mode.toggle.on", "color": "green"}, "\n", {"translate": "fetchr.lobby.settings.blind_mode.toggle.info", "color": "gray", "italic": true}]

execute if score $blind_mode fetchr.settings matches 0 run data modify entity @e[type=minecraft:marker, tag=fetchr.blind_mode_sign, distance=..1, limit=1] data.front_text.messages[3] set value '{"translate": "fetchr.lobby.settings.blind_mode.sign.off", "color": "gray"}'
execute if score $blind_mode fetchr.settings matches 1 run data modify entity @e[type=minecraft:marker, tag=fetchr.blind_mode_sign, distance=..1, limit=1] data.front_text.messages[3] set value '{"translate": "fetchr.lobby.settings.blind_mode.sign.on", "color": "green"}'