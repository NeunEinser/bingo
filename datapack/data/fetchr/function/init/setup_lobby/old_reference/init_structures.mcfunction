#> fetchr:init/setup_lobby/setup_lobby/old_reference/init_structures
#
# Sets the default structures in the correct order
#
# @within
# 	function fetchr:init/setup_lobby/old_reference/set_old_structures
# 	function fetchr:init/setup_lobby/old_reference/set_old_structures_iter

data modify storage io.fetchr:structures structure set value {}
data \
	modify storage io.fetchr:structures structure.id \
	set from storage tmp.fetchr:init/structures legacy_structures[0]

execute \
	if data storage io.fetchr:structures structure{id: "fetchr:credits"} \
	run data modify storage io.fetchr:structures structure merge value {\
		entrance_position: [I; 6, 2, 19],\
		legacy_id: "fetchr:old/5.3-beta5-credits"\
	}
execute \
	if data storage io.fetchr:structures structure{id: "fetchr:card_generation"} \
	run data modify storage io.fetchr:structures structure merge value {\
		entrance_position: [I; 0, 2, 10],\
		legacy_id: "fetchr:old/5.3-beta5-card_generation"\
	}
execute \
	if data storage io.fetchr:structures structure{id: "fetchr:tutorial"} \
	run data modify storage io.fetchr:structures structure merge value {\
		entrance_position: [I; 0, 2, 19],\
		legacy_id: "fetchr:old/5.3-beta5-tutorial"\
	}
execute \
	if data storage io.fetchr:structures structure{id: "fetchr:lobby_end"} \
	run data modify storage io.fetchr:structures structure merge value {\
		entrance_position: [I; 1, 0, 1],\
		legacy_id: "fetchr:old/5.3-beta5-lobby_end"\
	}

execute \
	unless data storage io.fetchr:structures structure.legacy_id \
	run function #fetchr:init_legacy_structure
execute \
	if data storage tmp.fetchr:init/structures structures[0] \
	unless data storage io.fetchr:structures structure{id: "fetchr:lobby_end", legacy_id: "fetchr:old/5.3-beta5-lobby_end"} \
	run data modify storage io.fetchr:structures structure.entrance_position[0] set value 0

data \
	modify storage tmp.fetchr:init/structures structures \
	append from storage io.fetchr:structures structure

data \
	modify storage tmp.fetchr:init/structures structures[-1].version \
	set value 0

data remove storage tmp.fetchr:init/structures legacy_structures[0]
execute \
	if data storage tmp.fetchr:init/structures legacy_structures[0] \
	run function fetchr:init/setup_lobby/old_reference/init_structures