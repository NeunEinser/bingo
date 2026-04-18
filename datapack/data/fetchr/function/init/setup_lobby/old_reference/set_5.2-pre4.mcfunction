#> fetchr:init/setup_lobby/setup_lobby/old_reference/5.2-pre4
#
# Overrides legacy structure ids with ones for 5.2-pre4
#
# @within function fetchr:init/setup_lobby/old_reference/5.3-beta1

data \
	modify storage tmp.fetchr:init/structures structures[{id: "fetchr:tutorial"}].legacy_id \
	set value "fetchr:old/5.2-pre4-tutorial"

execute \
	unless entity @e[type=minecraft:area_effect_cloud, tag=fetchr.standing_sign_south] \
	run function fetchr:init/setup_lobby/old_reference/set_5.2-pre1