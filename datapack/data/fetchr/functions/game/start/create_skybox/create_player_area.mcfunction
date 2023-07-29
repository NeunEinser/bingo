#> fetchr:game/start/create_skybox/create_player_area
#
# Creates the spawn preview room
#
# @within function fetchr:game/start/create_skybox/internal
# @context
# 	entity Spawn marker
# 	position the lowest non-air block with sky access at spawn

setblock ~-1 ~-1 ~-1 minecraft:structure_block[mode=load]{mode:"LOAD", name:"fetchr:skybox"}
setblock ~-1 ~ ~-1 minecraft:redstone_block
execute if block ~-1 ~-1 ~-1 minecraft:structure_block run setblock ~-1 ~-1 ~-1 minecraft:air
execute if block ~-1 ~ ~-1 minecraft:redstone_block run setblock ~-1 ~ ~-1 minecraft:air

teleport @s ~7 ~1 ~7
execute as @a[predicate=fetchr:is_in_game] run forceload add ~-1 ~-1 ~1 ~1 
execute as @a[predicate=fetchr:is_in_game] positioned ~7 ~1 ~7 run function fetchr:game/start/create_skybox/spawn_player
execute at @e[type=minecraft:item_frame, tag=fetchr.card_frame, scores={fetchr.lobby_card_frame_id=0}, distance=100.., limit=1] run clone ~ ~-4 ~-1 ~4 ~ ~-1 0 315 0
execute at @e[type=minecraft:marker, tag=fetchr.card_frame_start, distance=..8, limit=1] run clone 0 315 0 4 319 0 ~ ~-4 ~-1
execute unless score $is_multiplayer fetchr.tmp matches 1 positioned ~7 ~1 ~7 as @a[predicate=fetchr:is_in_lobby] run function fetchr:game/start/create_skybox/spawn_player
fill 0 315 0 4 319 0 minecraft:air

function fetchr:card_frames/spawn