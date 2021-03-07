#> bingo:game/detect_emerald
#
# Detects if @s is in a biome that can generate emerald ore
#
# @context
# 	entity Player
# 	position @s
# @internal

#>
# @private
#declare score_holder $emerald_detection.x
execute store result score $emerald_detection.x bingo.tmp run data get entity @s Pos[0]
#>
# @private
#declare score_holder $emerald_detection.modx
scoreboard players operation $emerald_detection.modx bingo.tmp = $emerald_detection.x bingo.tmp 
#>
# @private
#declare score_holder $emerald_detection.z
execute store result score $emerald_detection.z bingo.tmp run data get entity @s Pos[2]
#>
# @private
#declare score_holder $emerald_detection.modz
scoreboard players operation $emerald_detection.modz bingo.tmp = $emerald_detection.z bingo.tmp 

#>
# @private
#declare tag bingo.emerald_cloud

scoreboard players operation $emerald_detection.modx bingo.tmp %= 16 bingo.const
scoreboard players operation $emerald_detection.modz bingo.tmp %= 16 bingo.const

scoreboard players remove $emerald_detection.modx bingo.tmp 15
scoreboard players remove $emerald_detection.modz bingo.tmp 15

scoreboard players operation $emerald_detection.x bingo.tmp -= $emerald_detection.modx bingo.tmp
scoreboard players operation $emerald_detection.z bingo.tmp -= $emerald_detection.modz bingo.tmp

summon minecraft:area_effect_cloud ~ ~ ~ {Tags: ["bingo.emerald_cloud"]}

execute store result entity @e[type=minecraft:area_effect_cloud, tag=bingo.emerald_cloud, limit=1] Pos[0] double 1 run scoreboard players get $emerald_detection.x bingo.tmp
execute store result entity @e[type=minecraft:area_effect_cloud, tag=bingo.emerald_cloud, limit=1] Pos[2] double 1 run scoreboard players get $emerald_detection.z bingo.tmp

#tellraw @a ["x: ", {"score":{"name": "$emerald_detection.x", "objective": "bingo.tmp"}}, ", z: ", {"score":{"name": "$emerald_detection.z", "objective": "bingo.tmp"}}, ", modx: ", {"score":{"name": "$emerald_detection.modx", "objective": "bingo.tmp"}}, ", modz: ", {"score":{"name": "$emerald_detection.modz", "objective": "bingo.tmp"}}]

execute if entity @e[type=minecraft:area_effect_cloud, tag=bingo.emerald_cloud, limit=1, predicate=bingo:can_generate_emerald] run say hi

kill @e[type=minecraft:area_effect_cloud, tag=bingo.emerald_cloud, limit=1]