#> fetchr:lobby/settings/toggle_operator_only
#
# This function checks whether strict mode is active and the player clicking is
# a confirmed operator, and the either asks the player to confirm their op
# status or toggles the operator only setting
#
# @user
# @context entity Player changing the setting

execute unless score @s fetchr.operator matches 1 run function fetchr:util/show_confirm_operator_status_prompt
execute unless score @s fetchr.operator matches 1 run return 0

scoreboard players add $operator_only fetchr.settings 1
execute if score $operator_only fetchr.settings matches 2 run scoreboard players set $operator_only fetchr.settings 0

execute if score $operator_only fetchr.settings matches 0 run tellraw @s {"translate": "fetchr.lobby.settings.operator_only.toggle.on", "color": "red"}
execute if score $operator_only fetchr.settings matches 1 run tellraw @s {"translate": "fetchr.lobby.settings.operator_only.toggle.off", "color": "green"}

execute if score $operator_only fetchr.settings matches 0 run data modify entity @e[type=minecraft:marker, tag=fetchr.operator_only_sign, distance=..1, limit=1] data.front_text.messages[3] set value '{"translate": "fetchr.lobby.settings.operator_only.sign.off", "color": "gray"}'
execute if score $operator_only fetchr.settings matches 1 run data modify entity @e[type=minecraft:marker, tag=fetchr.operator_only_sign, distance=..1, limit=1] data.front_text.messages[3] set value '{"translate": "fetchr.lobby.settings.operator_only.sign.on", "color": "green"}'