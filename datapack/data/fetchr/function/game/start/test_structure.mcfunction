#> fetchr:game/start/test_structure
#
# Checks whether the given structure exists
#
# @params
# 	biome: string The biome (without namespace) which is a pre-requisit (used to skip expensive check for performance)
# 	structure: string The structure (without namespace) to check
# @writes storage fetchr:items effects
# @within function fetchr:game/start/test_biome

scoreboard players set $start.structure_test fetchr.tmp -1
$execute \
	if score $start/biome_test.$(biome) fetchr.tmp = $level_number fetchr.state \
	store success score $start.structure_test fetchr.tmp \
	run locate structure $(structure)
$execute \
	if score $start.structure_test fetchr.tmp matches 1.. \
	run data modify storage fetchr:items effects append value "fetchr:$(structure)"