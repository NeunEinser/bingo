#> fetchr:init/setup_lobby/setup_lobby/old_reference/5.1-beta6
#
# Overrides legacy structure ids with ones for 5.1-beta6
#
# @within function fetchr:init/setup_lobby/old_reference/set_5.1-pre1

data \
	modify storage tmp.fetchr:init/structures structures[{id: "fetchr:card_generation"}].legacy_id \
	set value "fetchr:old/5.1-beta6-machinery"
data \
	modify storage tmp.fetchr:init/structures structures[{id: "fetchr:card_generation"}].legacy_id \
	set value "fetchr:old/5.1-beta6-card_generation"

data \
	modify storage tmp.fetchr:init/structures structures[{id: "fetchr:tutorial"}] \
	merge value {\
		entrance_position: [I; 0, 2, 7],\
		legacy_id: "fetchr:old/5.1-beta6-tutorial"\
	}

execute \
	if entity @e[type=minecraft:marker, tag=fetchr.lobby_button, limit=1] \
	run function fetchr:init/setup_lobby/old_reference/set_5.1-beta5