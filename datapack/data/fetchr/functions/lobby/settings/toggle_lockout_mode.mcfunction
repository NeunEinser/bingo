#> fetchr:lobby/settings/toggle_lockout_mode
#
# This function changes the blind mode setting.
#
# @within fetchr:lobby/settings/lockout_mode_strict_mode_check
# @context entity Player changing the setting

scoreboard players add $lockout_mode fetchr.settings 1
execute if score $lockout_mode fetchr.settings matches 2 run scoreboard players set $lockout_mode fetchr.settings 0
execute if score $game_state fetchr.state matches ..2 run scoreboard players operation $lockout_mode fetchr.state = $lockout_mode fetchr.settings

execute if score $lockout_mode fetchr.settings matches 0 run tellraw @s {"translate": "fetchr.lobby.settings.lockout_mode.toggle.off", "color": "red"}
execute if score $lockout_mode fetchr.settings matches 1 run tellraw @s {"translate": "fetchr.lobby.settings.lockout_mode.toggle.on", "color": "green"}
execute if score $game_state fetchr.state matches 3 run tellraw @s {"translate": "fetchr.lobby.settings.lockout_mode.toggle.ongoing_game.info", "color": "gray", "italic": true}

execute if score $lockout_mode fetchr.settings matches 0 run data modify entity @e[type=minecraft:marker, tag=fetchr.lockout_mode_sign, distance=..1, limit=1] data.front_text.messages[3] set value '{"translate": "fetchr.lobby.settings.lockout_mode.sign.off", "color": "gray"}'
execute if score $lockout_mode fetchr.settings matches 1 run data modify entity @e[type=minecraft:marker, tag=fetchr.lockout_mode_sign, distance=..1, limit=1] data.front_text.messages[3] set value '{"translate": "fetchr.lobby.settings.lockout_mode.sign.on", "color": "green"}'