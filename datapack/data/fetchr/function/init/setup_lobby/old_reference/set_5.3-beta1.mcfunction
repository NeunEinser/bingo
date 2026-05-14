#> fetchr:init/setup_lobby/setup_lobby/old_reference/5.3-beta1
#
# Overrides legacy structure ids with ones for 5.3-beta1
#
# @within function fetchr:init/setup_lobby/old_reference/set_old_structures

data \
	modify storage io.fetchr:structures structures[{id: "fetchr:credits"}].legacy_id \
	set value "fetchr:old/5.3-beta1-credits"

execute \
	unless entity @e[type=minecraft:marker, tag=fetchr.join_game_sign, limit=1] \
	run function fetchr:init/setup_lobby/old_reference/set_5.2-pre4