#> fetchr:game/start/create_skybox/get_random_team_index
#
# Generates a random team number between 0 and 9.
#
# @within
# 	function fetchr:game/start/create_skybox/spawn_player
# 	function fetchr:game/start/create_skybox/get_random_team_index

scoreboard players set $game/start/skybox/player.team fetchr.tmp 0
execute if predicate neun_einser.math:rand run scoreboard players add $game/start/skybox/player.team fetchr.tmp 8
execute if predicate neun_einser.math:rand run scoreboard players add $game/start/skybox/player.team fetchr.tmp 4
execute if predicate neun_einser.math:rand run scoreboard players add $game/start/skybox/player.team fetchr.tmp 2
execute if predicate neun_einser.math:rand run scoreboard players set $game/start/skybox/player.team fetchr.tmp 1

execute if score $game/start/skybox/player.team fetchr.tmp matches 10.. run function fetchr:game/start/create_skybox/get_random_team_index