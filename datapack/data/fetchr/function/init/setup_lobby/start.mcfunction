#> fetchr:init/setup_lobby/start
#
# This function places relevant structures in the lobby.
#
# @within function fetchr:init/setup_lobby/schedule
# @context
# 	dimension fetchr:lobby

#>
# @within
# 	function fetchr:init/setup_lobby/*
#declare tag fetchr.structure_spawner
#>
# @within
# 	function fetchr:init/setup_lobby/start
# 	function fetchr:card_frames/**
# 	function fetchr:game/**
#declare tag fetchr.card_frame_start

forceload add ~-34 ~-24 ~14 ~23
summon minecraft:marker ~14 3 ~ { Tags: ["fetchr.structure_spawner"]}
summon minecraft:marker ~15 0 ~-24 { Tags: ["fetchr.structure_test"]}
setblock ~15 0 ~-24 minecraft:structure_block[mode=load]{\
	mode: "LOAD",\
	ignoreEntities: true,\
	integrity: 0f,\
	posX: 1,\
	posZ: 1,\
	posY: 0\
}

schedule function fetchr:init/setup_lobby/spawn_structure_schedule 1t