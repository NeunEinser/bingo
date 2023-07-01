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
function fetchr:card_frames/spawn

teleport @s ~7 ~ ~7
execute unless score $is_multiplayer fetchr.tmp matches 1 positioned ~7 ~ ~7 as @a[tag=!fetchr.resourcepack_check] run function fetchr:game/start/create_skybox/spawn_player