#> fetchr:game/start/test_biome
#
# Checks whether the biome is a biome that exists
#
# @params
# 	level_number: int The numeric ID of the level
# 	biome: string The biome (without namespace) to check against
# @writes storage fetchr:items effects
# @within function fetchr:game/start/check_dimension_and_start

# This check works because the macro will simply fail to parse if the biome

$execute if biome ~ ~ ~ minecraft:level$(level_number)/$(biome)

$data modify storage fetchr:items effects append value "fetchr:$(biome)"

$scoreboard players set $start/biome_test.$(biome) fetchr.tmp $(level_number)