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
# 	function bingo:game/start/pre_generate_next_chunk
#declare score_holder $game_start/pre_gen.i
scoreboard players add $game_start/pre_gen.i bingo.tmp 1

tellraw @a {"translate": "Pre-generating Spawnpoint (Step %s/41)", "with":[{"score":{"name": "$game_start/pre_gen.i", "objective": "bingo.tmp"}}]}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo.pre_gen_cloud, limit=1] at @s run function bingo:game/start/pre_generate_next_chunk

execute if score $game_start/pre_gen.i bingo.tmp matches ..40 run schedule function bingo:game/start/pre_generate_spawn 1t