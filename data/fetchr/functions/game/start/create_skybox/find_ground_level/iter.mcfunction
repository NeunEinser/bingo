#> fetchr:game/start/create_skybox/find_ground_level/iter
#
# This function spawns the skybox after all chunks are generated
#
# @within
# 	function fetchr:game/start/create_skybox/find_ground_level/exec
# 	function fetchr:game/start/create_skybox/find_ground_level/move_8
# @context
# 	entity Spawn marker
# 	position current y coordinate at spawn


tellraw @a {"score":{"name": "$game/start/find_ground.y", "objective": "fetchr.tmp"}}

#>
# @private
#declare score_holder $game/start/find_ground.found_non_air
execute store success score $game/start/find_ground.found_non_air fetchr.tmp run clone ~ ~ ~ ~ 319 ~ ~ ~ ~ masked force

scoreboard players operation $game/start/find_ground.blocks fetchr.tmp /= 2 fetchr.const

#>
# @within
# 	function fetchr:game/start/find_ground_level
# 	function fetchr:game/start/create_skybox/find_ground_level/*
#declare score_holder $game/start/find_ground.offset
scoreboard players operation $game/start/find_ground.offset fetchr.tmp = $game/start/find_ground.blocks fetchr.tmp
execute if score $game/start/find_ground.found_non_air fetchr.tmp matches 0 run scoreboard players operation $game/start/find_ground.offset fetchr.tmp *= -1 fetchr.const

scoreboard players operation $game/start/find_ground.y fetchr.tmp += $game/start/find_ground.offset fetchr.tmp

# if there is a two-high thing below, make sure drop chute starts below so you
# can't escape. 1-high plants don't matter
execute if score $game/start/find_ground.offset fetchr.tmp matches 0 unless block ~ ~-1 ~ #fetchr:tall_plants positioned ~.5 ~ ~.5 run function fetchr:game/start/create_skybox/place_dirt
execute if score $game/start/find_ground.offset fetchr.tmp matches 0 if block ~ ~-1 ~ #fetchr:tall_plants positioned ~.5 ~-2 ~.5 run function fetchr:game/start/create_skybox/place_dirt

execute if score $game/start/find_ground.offset fetchr.tmp matches 1.. run function fetchr:game/start/create_skybox/find_ground_level/move_1
execute if score $game/start/find_ground.offset fetchr.tmp matches ..-1 positioned ~ ~-256 ~ run function fetchr:game/start/create_skybox/find_ground_level/move_1