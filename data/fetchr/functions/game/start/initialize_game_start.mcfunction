#> fetchr:game/start/initialize_game_start
#
# This function is called when a player starts the game and either starts pre-
# generating or spawns the skybox.
#
# @within function fetchr:game/start/check_and_start

scoreboard players set $game_state fetchr.state 1
bossbar set fetchr:start/pre_gen/progress visible true
execute if score $pregen_status fetchr.state matches 0 run function fetchr:game/start/locate_spawnpoint
execute if score $pregen_status fetchr.state matches 2 at @e[type=minecraft:area_effect_cloud, tag=fetchr.skybox_cloud, limit=1] run function fetchr:game/start/spawn_skybox