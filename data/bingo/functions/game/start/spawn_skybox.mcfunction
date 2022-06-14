#> bingo:game/start/spawn_skybox
#
# This function spawns the skybox after all chunks are generated
#
# @within
# 	function bingo:game/start/pre_gen/end
# 	function bingo:game/start/initialize_game_start
# @context position Spawn location

scoreboard players set $game_state bingo.state 2
execute as @e[distance=0..] run function bingo:game/start/unfreeze_entities
forceload remove all

kill @e[type=minecraft:area_effect_cloud, tag=bingo.skybox_cloud, limit=1]
bossbar set bingo:start/pre_gen/progress visible false
function neun_einser.timer:stop

fill ~-1 0 ~-1 ~1 130 ~1 minecraft:barrier replace #bingo:sky_box_chute_replaceables
fill ~ 0 ~ ~ 129 ~ minecraft:air replace minecraft:barrier
setblock ~ 127 ~ minecraft:barrier
execute if block ~ 62 ~ minecraft:water run setblock ~ 62 ~ minecraft:dirt
execute if block ~ 62 ~ minecraft:lava run setblock ~ 62 ~ minecraft:dirt

scoreboard players add $current_game_id bingo.game_id 1

execute as @a[tag=!bingo.resourcepack_check] run function bingo:game/start/spawn_players
execute in bingo:lobby positioned 0 0 0 run function bingo:game/start/init_teams

execute store result score $spawn_x bingo.state run data get entity @a[tag=!bingo.resourcepack_check, limit=1] Pos[0]
execute store result score $spawn_z bingo.state run data get entity @a[tag=!bingo.resourcepack_check, limit=1] Pos[2]

schedule function bingo:game/start/end_of_skybox 30s