#> fetchr:init/setup_lobby/end
#
# This function is called at the end, after all structures were placed
# successfully.
#
# @within function fetchr:init/setup_lobby/spawn_structures
# @context
#  	entity structure spawner
# 	positon @s
# 	dimension fetchr:lobby

setblock 15 3 -17 minecraft:air
kill @s

setblock ~-1 3 ~-1 minecraft:structure_block[mode=load]{mode: "LOAD", name: "fetchr:lobby_end"}
setblock ~-1 4 ~-1 minecraft:redstone_block

#>
# @private
#declare tag fetchr.detect_mp_aec
kill @e[type=minecraft:marker, tag=fetchr.detect_mp_aec]
summon minecraft:marker 0 0 0 {CustomName:'{"translate": "fetchr.technical.detect_multiplayer"}', Tags: ["fetchr.detect_mp_aec"]}

kill @e[type=minecraft:marker, tag=fetchr.string_tester]
summon minecraft:marker 0 0 0 {Tags: ["fetchr.string_tester"]}

kill @e[type=minecraft:marker, tag=fetchr.pos_reader]
summon minecraft:marker 0 0 0 {Tags: ["fetchr.pos_reader"]}
execute in fetchr:default run summon minecraft:marker 0 0 0 {Tags: ["fetchr.pos_reader"]}

setblock 6 0 7 minecraft:barrel
setblock 7 0 7 minecraft:oak_sign

execute if score $is_multiplayer fetchr.state matches 1 at @e[tag=fetchr.multiplayer_mangrove_button_north] run setblock ~ ~ ~ minecraft:mangrove_button[facing=north]

execute in fetchr:lobby as @e[x=0.5,y=0,z=0.5,type=minecraft:marker, tag=fetchr.string_tester, distance=..0.1, limit=1] run function fetchr:init/items/lobby_loaded
#NEUN_SCRIPT if realms
#tag @e remove fetchr.multiplayer_only
#tag @e remove fetchr.singleplayer_only
#execute at @e[tag=fetchr.no_realms,tag=!fetchr.multiplayer_door] run setblock ~ ~ ~ minecraft:air
#execute at @e[tag=fetchr.multiplayer_only_brown] run setblock ~ ~ ~ minecraft:brown_carpet
#execute at @e[tag=fetchr.singleplayer_only_brown] run setblock ~ ~ ~ minecraft:brown_carpet
#tag @e remove fetchr.multiplayer_only_brown
#tag @e remove fetchr.singleplayer_only_brown
#tag @e remove fetchr.multiplayer_mangrove_button_north
#kill @e[tag=fetchr.no_realms]
#NEUN_SCRIPT end

forceload remove all
forceload add 0 0
execute at @e[type=minecraft:marker, tag=fetchr.chest_generation_marker] run forceload add ~ ~

function fetchr:custom_hud/components/timer/update