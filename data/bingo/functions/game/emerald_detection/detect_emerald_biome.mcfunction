#> bingo:game/emerald_detection/detect_emerald_biome
#
# Detects if @s is in a biome that can generate emerald ore and adds the tag
# bingo.emerald
#
# @context
# 	entity Player
# 	position Position to check for a biome elligable for emerald ore generation
# @internal
# @output tag @s bingo.emerald

tag @s remove bingo.emerald
execute if predicate bingo:can_generate_emerald run tag @s add bingo.emerald