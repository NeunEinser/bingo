#> fetchr:init/setup_lobby/setup_lobby/old_reference/set_old_structures
#
# Sets up the structure list replacing the bingo: namespace with fetchr:, using
# the legacy_bingo_list
#
# @within function fetchr:init/setup_lobby/old_reference/set_old_structures

data \
	modify storage tmp.fetchr:init/structures namespace \
	set string storage tmp.fetchr:init/structures legacy_bingo_structures[0] 0 6

scoreboard players set $init/lobby/old_references.is_not_bingo_namespace fetchr.tmp 0
execute \
	store success score $init/lobby/old_references.is_not_bingo_namespace fetchr.tmp \
	run data modify storage tmp.fetchr:init/structures namespace set value "bingo:"

execute \
	unless score $init/lobby/old_references.is_not_bingo_namespace fetchr.tmp matches 1 \
	run function fetchr:init/setup_lobby/old_reference/convert_bingo_to_fetchr

execute \
	if score $init/lobby/old_references.is_not_bingo_namespace fetchr.tmp matches 1 \
	run data \
		modify storage tmp.fetchr:init/structures legacy_structures \
		append from storage tmp.fetchr:init/structures legacy_bingo_structures[0]

data remove storage tmp.fetchr:init/structures legacy_bingo_structures[0]

execute \
	if data storage tmp.fetchr:init/structures legacy_bingo_structures[0] \
	run function fetchr:init/setup_lobby/old_reference/set_from_bingo_namespace
