#> fetchr:game/emerald_detection/chunk/detect
#
# Detects if @s is in a chunk that can generate emerald ore
#
# @context
# 	entity Player
# 	position @s
# @internal
# @output tag @s fetchr.emerald

#>
# @within function fetchr:game/emerald_detection/**
#declare score_holder $emerald_detection.chunkx
execute store result score $emerald_detection.chunkx fetchr.tmp run data get entity @s Pos[0]
#>
# @within function fetchr:game/emerald_detection/**
#declare score_holder $emerald_detection.chunkz
execute store result score $emerald_detection.chunkz fetchr.tmp run data get entity @s Pos[2]

#>
# @private
#declare tag fetchr.emerald_cloud

scoreboard players operation $emerald_detection.chunkx fetchr.tmp %= 16 fetchr.const
scoreboard players operation $emerald_detection.chunkz fetchr.tmp %= 16 fetchr.const

function fetchr:game/emerald_detection/chunk/move_x/0