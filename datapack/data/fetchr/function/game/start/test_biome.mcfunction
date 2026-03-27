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

execute \
	in fetchr:resourcepack_check positioned 0 0 0 \
	as @e[type=minecraft:marker, tag=fetchr.string_tester, distance=..0.1, limit=1] \
	run function fetchr:game/start/check_excluded_biomes
$execute unless score $start/check_dimension.should_skip fetchr.tmp matches 0 run say skipping $(biome)
execute unless score $start/check_dimension.should_skip fetchr.tmp matches 0 run return 0

scoreboard players set $start/biome_test.distance fetchr.tmp 0
scoreboard players set $start/biome_test.success fetchr.tmp 0
$execute \
	store result score $start/biome_test.distance fetchr.tmp \
	run locate biome minecraft:level$(level_number)/$(biome)
$execute \
	if score $start/biome_test.distance fetchr.tmp matches 0 \
	store success score $start/biome_test.success fetchr.tmp \
	run locate biome minecraft:level$(level_number)/$(biome)
execute \
	if score $start/biome_test.distance fetchr.tmp matches 0 \
	if score $start/biome_test.success fetchr.tmp matches 0 \
	run return 0

$execute \
	if score $start/biome_test.distance fetchr.tmp matches ..800 \
	run data modify storage fetchr:items effects append value "fetchr:$(biome)"

$execute \
	if score $start/biome_test.distance fetchr.tmp matches ..800 \
	run scoreboard players set $start/biome_test.$(biome) fetchr.tmp $(level_number)