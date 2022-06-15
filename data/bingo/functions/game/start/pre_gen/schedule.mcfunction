#> bingo:game/start/pre_gen/schedule
#
# This function is scheduled to spread the chunk generation over multiple ticks
# to avoid player timeouts and server crashes due to lag
#
# @within
# 	function bingo:game/start/pre_gen/*

#>
# The current step
#
# @within
# 	function bingo:game/start/pre_gen/*
#declare score_holder $game_start/pre_gen.i

#>
# The timestamp in miliseconds this iteration started
#
# @within
# 	function bingo:game/start/pre_gen/*
#declare score_holder $game_start/pre_gen.start

execute in bingo:lobby run function neun_einser.timer:read
scoreboard players operation $game_start/pre_gen.start bingo.tmp = $raw 91.timer.time

execute if score $pregen_status bingo.state matches 1 as @e[type=minecraft:area_effect_cloud, tag=bingo.pre_gen_cloud, limit=1] at @s run function bingo:game/start/pre_gen/set_position_and_generate_next

execute store result bossbar bingo:start/pre_gen/progress value run scoreboard players get $game_start/pre_gen.i bingo.schedule