#> fetchr:init/setup_lobby/setup_lobby/old_reference/5.1-beta5
#
# Overrides legacy structure ids with ones for 5.1-beta5
#
# @within function fetchr:init/setup_lobby/old_reference/set_5.1-beta6

data \
	modify storage tmp.fetchr:init/structures structures[{id: "fetchr:card_generation"}].legacy_id \
	set value "fetchr:old/5.1-beta5-card_generation"

execute \
	if entity @e[tag=fetchr.lobby_sign, nbt={data:{Text2:'{"translate":"fetchr.lobby.credits.neun_einser.sign.line2","color":"#8eedeb"}'}}, limit=1] \
	run function fetchr:init/setup_lobby/old_reference/set_5.1-beta3