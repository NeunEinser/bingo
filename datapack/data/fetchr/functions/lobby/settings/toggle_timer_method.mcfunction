#> fetchr:lobby/settings/toggle_timer_method
#
# This function checks whether strict mode is active and the player clicking is
# a confirmed operator, and the either asks the player to confirm their op
# status or toggles the timer method setting
#
# @user
# @context entity Player changing the setting

execute if score $operator_only fetchr.settings matches 1 unless score @s fetchr.operator matches 1 run function fetchr:util/show_confirm_operator_status_prompt
execute if score $operator_only fetchr.settings matches 1 unless score @s fetchr.operator matches 1 run return 0

scoreboard players add $use_in_game_time fetchr.settings 1
execute if score $use_in_game_time fetchr.settings matches 2 run scoreboard players set $use_in_game_time fetchr.settings 0

execute if score $use_in_game_time fetchr.settings matches 0 run tellraw @s {"translate": "fetchr.lobby.settings.timer_method.toggle.real_time", "color": "green"}
execute if score $use_in_game_time fetchr.settings matches 1 run tellraw @s {"translate": "fetchr.lobby.settings.timer_method.toggle.in_game_time", "color": "green"}

execute if score $use_in_game_time fetchr.settings matches 0 as @e[type=minecraft:marker, tag=fetchr.timer_method_sign, distance=0.., limit=2] run data modify entity @s data.front_text.messages[3] set value '{"translate": "fetchr.lobby.settings.timer_method.sign.real_time", "color": "green"}'
execute if score $use_in_game_time fetchr.settings matches 1 as @e[type=minecraft:marker, tag=fetchr.timer_method_sign, distance=0.., limit=2] run data modify entity @s data.front_text.messages[3] set value '{"translate": "fetchr.lobby.settings.timer_method.sign.in_game_time", "color": "green"}'