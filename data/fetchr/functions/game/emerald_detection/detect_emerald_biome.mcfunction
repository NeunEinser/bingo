#> fetchr:game/emerald_detection/detect_emerald_biome
#
# Detects if @s is in a biome that can generate emerald ore and adds the tag
# fetchr.emerald
#
# @context
# 	entity Player
# 	position Position to check for a biome elligable for emerald ore generation
# @internal
# @output tag @s fetchr.emerald

tag @s remove fetchr.emerald
execute if predicate fetchr:can_generate_emerald run tag @s add fetchr.emerald