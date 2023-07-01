#> fetchr:game/start/create_skybox/exec
#
# Create a skybox for the game.
#
# @within
# 	function fetchr:game/start/pre_gen/**

function neun_einser.timer:pause

bossbar set fetchr:start/pre_gen/progress visible true
scoreboard players set $game_state fetchr.state 2
forceload add 0 0
execute positioned over motion_blocking summon minecraft:marker run function fetchr:game/start/create_skybox/internal

function neun_einser.timer:resume