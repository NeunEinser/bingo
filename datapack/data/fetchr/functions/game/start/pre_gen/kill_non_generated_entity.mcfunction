#> fetchr:game/start/pre_gen/kill_non_generated_entity
#
# This removes all non-generated entities from the game.
#
# @within function fetchr:game/start/pre_gen/check_entities

#execute if entity @s[type=!minecraft:zombie, type=!minecraft:spider, type=!minecraft:skeleton, type=!minecraft:enderman, type=!minecraft:witch] run say @s

teleport @s ~151 -128 ~151 
kill @s