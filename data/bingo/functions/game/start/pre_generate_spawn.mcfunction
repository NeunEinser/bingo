#> bingo:game/start/pre_generate_spawn
#
# Pre-Generates a 64*64 area around spawnn
#
# @within
# 	function bingo:game/start/initilize_spawnpoint
# 	function bingo:game/start/pre_generate_spawn

#>
# The current step
#
# @within
# 	function bingo:game/start/initilize_spawnpoint
# 	function bingo:game/start/pre_generate_spawn
#declare score_holder $game_start/pre_gen.i
scoreboard players add $game_start/pre_gen.i bingo.tmp 1

tellraw @a {"translate": "Pre-generating Spawnpoint (Step %s/40)", "with":[{"score":{"name": "$game_start/pre_gen.i", "objective": "bingo.tmp"}}]}
forceload add ~ ~-320 ~ ~320

execute if score $game_start/pre_gen.i bingo.tmp matches ..39 positioned ~16 ~ ~ run function bingo:game/start/pre_generate_spawn