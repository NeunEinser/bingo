#> fetchr:game/start/create_skybox/place_dirt
#
# Places dirt if spawn is above water, or if spawn is below sea level
#
# @within function fetchr:game/start/create_skybox/internal
# @context
# 	entity Spawn marker
# 	position the lowest non-air block with sky access at spawn

teleport @s ~ ~ ~
#>
# @private
#declare score_holder $game/start/place_dirt.y
execute store result score $game/start/place_dirt.y fetchr.tmp run data get entity @s Pos[1]

execute if block ~ ~-1 ~ #fetchr:liquids run setblock ~ ~-1 ~ minecraft:dirt
execute if score $game/start/place_dirt.y fetchr.tmp matches ..62 run fill ~ ~ ~ ~ 61 ~ minecraft:dirt
execute if score $game/start/place_dirt.y fetchr.tmp matches ..62 run setblock ~ 62 ~ minecraft:coarse_dirt
execute if score $game/start/place_dirt.y fetchr.tmp matches ..62 run fill ~-7 62 ~-7 ~8 62 ~8 minecraft:dirt replace #fetchr:air