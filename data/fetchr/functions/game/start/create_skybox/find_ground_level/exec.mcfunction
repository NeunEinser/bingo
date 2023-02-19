#> fetchr:game/start/create_skybox/find_ground_level/exec
#
# This function spawns the skybox after all chunks are generated
#
# @within
# 	function fetchr:game/start/pre_gen/goto_current_chunk
# 	function fetchr:game/start/initialize_game_start
# @context
# 	entity Spawn marker
# 	position Spawn location

scoreboard players set $game_state fetchr.state 2
forceload remove all
forceload add ~-1 ~-1 ~ ~
forceload add 0 0

bossbar set fetchr:start/pre_gen/progress visible false
function neun_einser.timer:stop

#>
# @within function fetchr:game/start/create_skybox/**
#declare score_holder $game/start/find_ground.y
scoreboard players set $game/start/find_ground.y fetchr.tmp 128
#>
# @within function fetchr:game/start/create_skybox/find_ground_level/*
#declare score_holder $game/start/find_ground.blocks
scoreboard players set $game/start/find_ground.blocks fetchr.tmp 256

execute positioned ~ 128 ~ run function fetchr:game/start/create_skybox/find_ground_level/iter