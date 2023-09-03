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

setblock -1 3 -17 minecraft:air
kill @s

setblock ~-1 3 ~-1 minecraft:structure_block[mode=load]{mode: "LOAD", name: "fetchr:lobby_end"}
setblock ~-1 4 ~-1 minecraft:redstone_block

# Spawn machinery at hardcoded position
setblock -3 1 -3 minecraft:structure_block[mode=load]{mode: "LOAD", name: "fetchr:machinery", posX: 1, posZ: 1}
setblock -3 2 -3 minecraft:redstone_block
summon minecraft:marker -3 5 7 {Tags: ["fetchr.lobby_sign", "fetchr.sign_west"], data: {front_text: {messages: ['{"translate":"fetchr.lobby.machinery.sign.line1", "bold":true, "color":"#8eedeb"}', '{"translate": "fetchr.lobby.machinery.sign.line2", "color":"#8eedeb"}', '{"translate": "fetchr.lobby.machinery.sign.line3", "color":"#8eedeb"}', '{"translate": "fetchr.lobby.machinery.sign.line4", "color":"#8eedeb"}' ]}}}
data modify block -4 1 -3 ignoreEntities set value true

## Workaround for https://bugs.mojang.com/browse/MC-224771
setblock -3 2 -3 minecraft:barrier
setblock -3 2 -3 minecraft:redstone_block
setblock -3 2 -3 minecraft:barrier
setblock -3 2 -3 minecraft:redstone_block
setblock -3 2 -3 minecraft:barrier
setblock -3 2 -3 minecraft:redstone_block
setblock -3 2 -3 minecraft:barrier
setblock -3 2 -3 minecraft:redstone_block
setblock -3 2 -3 minecraft:barrier
setblock -3 2 -3 minecraft:redstone_block
setblock -3 2 -3 minecraft:barrier
setblock -3 2 -3 minecraft:redstone_block
setblock -3 2 -3 minecraft:barrier

setblock -3 1 -3 minecraft:barrier

#>
# @private
#declare tag fetchr.detect_mp_aec
kill @e[type=minecraft:marker, tag=fetchr.detect_mp_aec]
summon minecraft:marker 0 0 0 {CustomName:'{"translate": "fetchr.technical.detect_multiplayer"}', Tags: ["fetchr.detect_mp_aec"]}
execute in fetchr:default run summon minecraft:marker 0 0 0 {CustomName:'{"translate": "fetchr.technical.detect_multiplayer"}', Tags: ["fetchr.detect_mp_aec"]}

kill @e[type=minecraft:marker, tag=fetchr.string_tester]
summon minecraft:marker 0 0 0 {Tags: ["fetchr.string_tester"]}

kill @e[type=minecraft:marker, tag=fetchr.pos_reader]
summon minecraft:marker 0 0 0 {Tags: ["fetchr.pos_reader"]}
execute in fetchr:default run summon minecraft:marker 0 0 0 {Tags: ["fetchr.pos_reader"]}

setblock 7 0 7 minecraft:oak_sign

execute if score $is_multiplayer fetchr.state matches 1 at @e[tag=fetchr.multiplayer_mangrove_button_north] run setblock ~ ~ ~ minecraft:mangrove_button[facing=north]

execute in fetchr:lobby as @e[x=0.5,y=0,z=0.5,type=minecraft:marker, tag=fetchr.string_tester, distance=..0.1, limit=1] run function fetchr:init/items/lobby_loaded

forceload remove all
forceload add 0 0

function fetchr:custom_hud/components/timer/update