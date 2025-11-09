#> fetchr:init/setup_lobby/setup_lobby/old_reference/5.0-alpha
#
# Overrides legacy structure ids with empty, since alpha did not have a lobby
# at the bottom of the world, so there is nothing to upgrade.
#
# @within function fetchr:init/setup_lobby/old_reference/set_5.0-beta1

data \
	modify storage tmp.fetchr:init/structures structures[] \
	merge value { id: "minecraft:empty", entrance_position: [I; 0, 0, 0] }