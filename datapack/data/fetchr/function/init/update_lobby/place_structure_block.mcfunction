#> fetchr:init/update_lobby/place_structure_block
#
# Places the structure block at -30,000,000 -30,000,000
#
# @within fetchr:init/update_lobby/place_structure_block_schedule
# @context dimension fetchr:lobby

forceload add -30000000 -30000000
setblock -30000000 3 -30000000 minecraft:structure_block[mode=load]{\
	mode: "LOAD",\
	posY: 0,\
	ignoreEntities: true,\
	integrity: 0.0f,\
	strict: true\
}

execute \
	if loaded -30000000 3 -30000000 \
	run function fetchr:init/update_lobby/setup_structure_update
execute \
	unless loaded -30000000 3 -30000000 \
	run schedule function fetchr:init/update_lobby/place_structure_block_schedule 1t