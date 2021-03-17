#> bingo:game/emerald_detection/chunk/detect
#
# Detects if @s is in a chunk that can generate emerald ore
#
# @context
# 	entity Player
# 	position @s
# @internal
# @output tag @s bingo.emerald

#>
# @within bingo:game/emerald_detection/chunk/*
#declare score_holder $detect_emerald/chunk.x
execute store result score $detect_emerald/chunk.x bingo.tmp run data get entity @s Pos[0]
#>
# @private
#declare score_holder $detect_emerald/chunk.chunkx
scoreboard players operation $detect_emerald/chunk.chunkx bingo.tmp = $detect_emerald/chunk.x bingo.tmp
#>
# @within bingo:game/emerald_detection/chunk/*
#declare score_holder $detect_emerald/chunk.z
execute store result score $detect_emerald/chunk.z bingo.tmp run data get entity @s Pos[2]
#>
# @private
#declare score_holder $detect_emerald/chunk.chunkz
scoreboard players operation $detect_emerald/chunk.chunkz bingo.tmp = $detect_emerald/chunk.z bingo.tmp
#>
# @within bingo:game/emerald_detection/chunk/*
#declare score_holder $detect_emerald/chunk.y
scoreboard players set $detect_emerald/chunk.y bingo.tmp 2

#>
# @private
#declare tag bingo.emerald_cloud

scoreboard players operation $detect_emerald/chunk.chunkx bingo.tmp %= 16 bingo.const
scoreboard players operation $detect_emerald/chunk.chunkz bingo.tmp %= 16 bingo.const

scoreboard players remove $detect_emerald/chunk.chunkx bingo.tmp 8
scoreboard players remove $detect_emerald/chunk.chunkz bingo.tmp 8

scoreboard players operation $detect_emerald/chunk.x bingo.tmp -= $detect_emerald/chunk.chunkx bingo.tmp
scoreboard players operation $detect_emerald/chunk.z bingo.tmp -= $detect_emerald/chunk.chunkz bingo.tmp

summon minecraft:area_effect_cloud ~ ~ ~ {Tags: ["bingo.emerald_cloud"]}

execute store result entity @e[type=minecraft:area_effect_cloud, tag=bingo.emerald_cloud, limit=1] Pos[0] double 1 run scoreboard players get $detect_emerald/chunk.x bingo.tmp
data modify entity @e[type=minecraft:area_effect_cloud, tag=bingo.emerald_cloud, limit=1] Pos[1] set value 2.0d
execute store result entity @e[type=minecraft:area_effect_cloud, tag=bingo.emerald_cloud, limit=1] Pos[2] double 1 run scoreboard players get $detect_emerald/chunk.z bingo.tmp

execute if entity @e[type=minecraft:area_effect_cloud, tag=bingo.emerald_cloud, limit=1, predicate=bingo:can_generate_emerald] run say hi

kill @e[type=minecraft:area_effect_cloud, tag=bingo.emerald_cloud, limit=1] 