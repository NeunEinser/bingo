#> fetchr:init/setup_lobby/setup_lobby/old_reference/5.0-pre1
#
# Overrides legacy structure ids with ones for 5.0-pre1
#
# @within function fetchr:init/setup_lobby/old_reference/set_5.0-pre3

data \
	modify storage tmp.fetchr:init/structures structures[{id: "fetchr:card_generation"}].legacy_id \
	set value "fetchr:old/5.0-pre1-card_generation"
data \
	modify storage tmp.fetchr:init/structures structures[{id: "fetchr:credits"}].legacy_id \
	set value "fetchr:old/5.0-pre1-credits"
data \
	modify storage tmp.fetchr:init/structures structures[{id: "fetchr:tutorial"}].legacy_id \
	set value "fetchr:old/5.0-pre1-tutorial"

execute \
	unless block 7 10 7 minecraft:chain_command_block \
	run function fetchr:init/setup_lobby/old_reference/set_5.0-beta1