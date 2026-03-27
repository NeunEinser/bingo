#> fetchr:game/start/test_structure
#
# Checks whether the given structure exists
#
# @params
# 	biome: string The biome (without namespace) which is a pre-requisit (used to skip expensive check for performance)
# 	structure: string The structure (without namespace) to check
# @writes storage fetchr:items effects
# @within function fetchr:game/start/test_biome

$execute \
	unless score $start/biome_test.$(biome) fetchr.tmp = $level_number fetchr.state \
	run return 0
scoreboard players set $start.structure_test fetchr.tmp 0
$execute \
	store result score $start.structure_test fetchr.tmp \
	run locate structure $(structure)
$execute \
	if score $start.structure_test fetchr.tmp matches 0 \
	store success score $start/structure_test.success fetchr.tmp \
	run locate structure $(structure)
execute \
	if score $start.structure_test fetchr.tmp matches 0 \
	if score $start/structure_test.success fetchr.tmp matches 0 \
	run return 0
$execute \
	if score $start.structure_test fetchr.tmp matches ..800 \
	run data modify storage fetchr:items effects append value "fetchr:$(structure)"