#> fetchr:init/setup_lobby/end
#
# This function is called at the end, after all structures were placed
# successfully.
#
# @within function fetchr:init/setup_lobby/spawn_structure
# @context
#  	entity structure spawner
# 	positon @s
# 	dimension fetchr:lobby

execute \
	at @e[type=minecraft:marker, x=0, tag=fetchr.structure_test, limit=1] \
	run setblock ~ ~ ~ minecraft:air
kill @s
kill @e[type=minecraft:marker, x=0, tag=fetchr.structure_test, limit=1]

setblock ~-1 3 ~-1 minecraft:structure_block[mode=load]{\
	name: "fetchr:lobby_end",\
	mode: "LOAD",\
	ignoreEntities: false,\
	posY: 0,\
}
execute \
	if score $init/lobby.is_reference fetchr.tmp matches 1 \
	run data modify block ~-1 3 ~-1 ignoreEntities set value true
setblock ~-1 4 ~-1 minecraft:redstone_block

forceload remove all
forceload add 0 0
execute \
	at @e[type=minecraft:marker, tag=fetchr.chest_generation_marker] \
	run forceload add ~ ~

execute \
	if score $init/lobby.is_reference fetchr.tmp matches 0 \
	run schedule function fetchr:init/setup_lobby/schedule_reference 1t
execute \
	if score $init/lobby.is_reference fetchr.tmp matches 1 \
	run return 0

#>
# @private
#declare tag fetchr.detect_mp_aec
kill @e[type=minecraft:marker, tag=fetchr.detect_mp_aec]
#NEUN_SCRIPT until 69
#summon minecraft:marker 0 0 0 {\
	CustomName: '{ "translate": "fetchr.technical.detect_multiplayer" }',\
	Tags: ["fetchr.detect_mp_aec"]\
}
#NEUN_SCRIPT end
#NEUN_SCRIPT since 69
summon minecraft:marker 0 0 0 {\
	CustomName: { translate: "fetchr.technical.detect_multiplayer" },\
	Tags: ["fetchr.detect_mp_aec"]\
}
#NEUN_SCRIPT end

kill @e[type=minecraft:marker, tag=fetchr.string_tester]
summon minecraft:marker 0 0 0 { Tags: ["fetchr.string_tester"]}

kill @e[type=minecraft:marker, tag=fetchr.pos_reader]
summon minecraft:marker 0 0 0 { Tags: ["fetchr.pos_reader"]}
execute \
	in fetchr:default \
	run summon minecraft:marker 0 0 0 { Tags: ["fetchr.pos_reader"]}

setblock 6 0 7 minecraft:barrel
setblock 7 0 7 minecraft:oak_sign{ front_text: { messages: ["", "", "", ""]}}

execute \
	in fetchr:lobby as @e[x=0.5, y=0, z=0.5, type=minecraft:marker, tag=fetchr.string_tester, distance=..0.1, limit=1] \
	run function fetchr:init/items/lobby_loaded
#NEUN_SCRIPT if {NEUN_SCRIPT:realms}
#tag @e remove fetchr.multiplayer_only
#tag @e remove fetchr.singleplayer_only
#execute \
	at @e[tag=fetchr.no_realms, tag=!fetchr.multiplayer_door] \
	run setblock ~ ~ ~ minecraft:air
#execute \
	at @e[tag=fetchr.multiplayer_only_brown] \
	run setblock ~ ~ ~ minecraft:brown_carpet
#execute \
	at @e[tag=fetchr.singleplayer_only_brown] \
	run setblock ~ ~ ~ minecraft:brown_carpet
#tag @e remove fetchr.multiplayer_only_brown
#tag @e remove fetchr.singleplayer_only_brown
#tag @e remove fetchr.multiplayer_mangrove_button_north
#kill @e[tag=fetchr.no_realms]
#NEUN_SCRIPT end

function fetchr:custom_hud/components/timer/update