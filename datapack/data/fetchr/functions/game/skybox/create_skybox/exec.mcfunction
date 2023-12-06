#> fetchr:game/skybox/create_skybox/exec
#
# Create a skybox for the game.
#
# @within
# 	function fetchr:game/start/pre_gen/**

function neun_einser.timer:pause

bossbar set fetchr:start/pre_gen/progress visible true
scoreboard players set $game_state fetchr.state 2
execute in fetchr:default if loaded 0 0 0 unless entity @e[type=minecraft:marker, x=0.5, y=0, z=0.5, distance=..0.1, tag=fetchr.pos_reader, limit=1] run summon minecraft:marker 0 0 0 {Tags: ["fetchr.pos_reader"]}
execute positioned over motion_blocking summon minecraft:marker run function fetchr:game/skybox/create_skybox/internal

function neun_einser.timer:resume