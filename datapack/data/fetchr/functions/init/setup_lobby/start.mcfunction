#> fetchr:init/setup_lobby/start
#
# This function places relevant structures in the lobby.
#
# @within function fetchr:init/setup_lobby/root
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
# 	function fetchr:game/skybox/**
#declare tag fetchr.card_frame_start

setblock -1 3 -17 minecraft:structure_block[mode=load]{mode: "LOAD", ignoreEntities: true, integrity: 0f, posX: 1, posZ: 1}
summon minecraft:marker -2 1 7 {Tags: ["fetchr.structure_spawner"]}

kill @e[type=minecraft:marker, tag=fetchr.lobby_sign]
kill @e[type=minecraft:marker, tag=fetchr.card_frame_start]

forceload add -3 -17 -50 30
schedule function fetchr:init/setup_lobby/spawn_structures_schedule 1t