#> fetchr:game/start/spawn_skybox
#
# This function spawns the skybox after all chunks are generated
#
# @within
# 	function fetchr:game/start/pre_gen/end
# 	function fetchr:game/start/initialize_game_start
# @context position Spawn location

scoreboard players set $game_state fetchr.state 2
execute as @e[distance=0..] run function fetchr:game/start/unfreeze_entities
forceload remove all

kill @e[type=minecraft:marker, tag=fetchr.skybox, limit=1]
bossbar set fetchr:start/pre_gen/progress visible false
function neun_einser.timer:stop

# make drop chute and place dirt
fill ~-1 0 ~-1 ~1 130 ~1 minecraft:barrier replace #fetchr:sky_box_chute_replaceables
fill ~ 0 ~ ~ 129 ~ minecraft:air replace minecraft:barrier
setblock ~ 127 ~ minecraft:barrier
fill ~ 0 ~ ~ 62 ~ minecraft:dirt replace #fetchr:air
fill ~ 0 ~ ~ 127 ~ minecraft:dirt replace #fetchr:liquids

scoreboard players add $current_game_id fetchr.game_id 1

execute as @a[tag=!fetchr.resourcepack_check] run function fetchr:game/start/spawn_players
execute in fetchr:lobby positioned 0 0 0 run function fetchr:game/start/init_teams

execute store result score $spawn_x fetchr.state run data get entity @a[tag=!fetchr.resourcepack_check, limit=1] Pos[0]
execute store result score $spawn_z fetchr.state run data get entity @a[tag=!fetchr.resourcepack_check, limit=1] Pos[2]

schedule function fetchr:game/start/end_of_skybox 30s