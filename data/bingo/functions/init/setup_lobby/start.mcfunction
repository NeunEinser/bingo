#> bingo:init/setup_lobby/start
#
# This function places relevant structures in the lobby.
#
# @within function bingo:init/setup_lobby/root
# @context
# 	dimension bingo:lobby

#>
# @within
# 	function bingo:init/setup_lobby/*
#declare tag bingo.structure_spawner
#>
# @within
# 	function bingo:init/setup_lobby/start
# 	function bingo:init/setup_lobby/end
# 	function bingo:lobby/place_indestructible_blocks
#declare tag bingo.lobby_sign
#>
# @within
# 	function bingo:init/setup_lobby/start
# 	function bingo:card_frames/**
#declare tag bingo.card_generation_frame_start

setblock -1 3 -17 minecraft:structure_block[mode=load]{mode: "LOAD", ignoreEntities: true, integrity: 0f, posX: 1, posZ: 1}
summon minecraft:marker -2 1 7 {Tags: ["bingo.structure_spawner"]}

kill @e[type=minecraft:area_effect_cloud, tag=bingo.lobby_sign]
kill @e[type=minecraft:area_effect_cloud, tag=bingo.card_generation_frame_start]

forceload add -3 -17 -50 30
schedule function bingo:init/setup_lobby/spawn_structures_schedule 1t