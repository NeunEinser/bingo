#> fetchr:init/setup_lobby/setup_lobby/old_reference/5.0-pre3
#
# Overrides legacy structure ids with ones for 5.0-pre3
#
# @within function fetchr:init/setup_lobby/old_reference/set_5.0-rc3

data \
	modify storage tmp.fetchr:init/structures structures[{id: "fetchr:credits"}].legacy_id \
	set value "fetchr:old/5.0-pre3-credits"

execute \
	unless entity @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_community_and_support, limit=1] \
	run function fetchr:init/setup_lobby/old_reference/set_5.0-pre1