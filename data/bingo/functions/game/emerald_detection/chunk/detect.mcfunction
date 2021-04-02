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
# @within function bingo:game/emerald_detection/**
#declare score_holder $emerald_detection.chunkx
execute store result score $emerald_detection.chunkx bingo.tmp run data get entity @s Pos[0]
#>
# @within function bingo:game/emerald_detection/**
#declare score_holder $emerald_detection.chunkz
execute store result score $emerald_detection.chunkz bingo.tmp run data get entity @s Pos[2]

#>
# @private
#declare tag bingo.emerald_cloud

scoreboard players operation $emerald_detection.chunkx bingo.tmp %= 16 bingo.const
scoreboard players operation $emerald_detection.chunkz bingo.tmp %= 16 bingo.const

function bingo:game/emerald_detection/chunk/move_x/0