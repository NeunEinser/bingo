#> fetchr:init/setup_lobby/setup_lobby/old_reference/5.1-pre1
#
# Overrides legacy structure ids with ones for 5.1-pre1
#
# @within function fetchr:init/setup_lobby/old_reference/set_5.1.3

data \
	modify storage tmp.fetchr:init/structures structures[{id: "fetchr:credits"}].legacy_id \
	set value "fetchr:old/5.1-pre1-credits"

execute \
	unless entity @e[type=minecraft:marker, tag=fetchr.timer_method_sign, limit=1] \
	run function fetchr:init/setup_lobby/old_reference/set_5.1-beta6