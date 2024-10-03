#> fetchr:lobby/settings/set_pre_gen_radius_internal
#
# Sets the pre-generation to the value in the trigger objective of the current
# player
#
# @context
# 	entity The player who wants to set the pre-generation radius.
# @input
# 	score @s fetchr.pre_gen_radius The radius to set the pre-generation to.

execute if score @s fetchr.pre_gen_radius matches ..143 run tellraw @s {"translate": "fetchr.lobby.settings.pre_gen.menu.error.too_low", "color": "red", "with": [{"score": {"name": "@s", "objective": "fetchr.pre_gen_radius"}}, "144"]}
execute if score @s fetchr.pre_gen_radius matches ..143 run return 0

scoreboard players operation $pregeneration_chunks fetchr.settings = @s fetchr.pre_gen_radius
data modify block 7 0 7 front_text.messages[0] set value '{"translate": "fetchr.lobby.settings.pre_gen.sign.radius", "color": "green", "with": [{"score": {"name": "$pregeneration_chunks", "objective": "fetchr.settings"}}]}'
scoreboard players operation $pregeneration_chunks fetchr.settings /= 16 fetchr.const
scoreboard players operation $pregeneration_chunks fetchr.settings += $pregeneration_chunks fetchr.settings
scoreboard players add $pregeneration_chunks fetchr.settings 1
scoreboard players operation $pregeneration_chunks fetchr.settings *= $pregeneration_chunks fetchr.settings

execute if score @s fetchr.pre_gen_radius matches 144 run tellraw @s {"translate": "fetchr.lobby.settings.pre_gen.menu.set.minimal", "color": "green"}
execute if score @s fetchr.pre_gen_radius matches 145.. run tellraw @s {"translate": "fetchr.lobby.settings.pre_gen.menu.set.radius", "color": "green", "with": [{"score": {"name": "@s", "objective": "fetchr.pre_gen_radius"}}]}

execute if score @s fetchr.pre_gen_radius matches 144 run data modify entity @e[type=minecraft:marker, tag=fetchr.pre_gen_sign, distance=0.., limit=1] data.front_text.messages[3] set value '{"translate": "fetchr.lobby.settings.pre_gen.sign.minimal", "color": "gray"}'
execute if score @s fetchr.pre_gen_radius matches 145.. run data modify entity @e[type=minecraft:marker, tag=fetchr.pre_gen_sign, distance=0.., limit=1] data.front_text.messages[3] set from block 7 0 7 front_text.messages[0]

scoreboard players reset @s fetchr.pre_gen_radius
scoreboard players enable @s fetchr.pre_gen_radius