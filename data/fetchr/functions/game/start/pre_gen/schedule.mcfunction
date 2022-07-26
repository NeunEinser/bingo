#> fetchr:game/start/pre_gen/schedule
#
# This function is scheduled to spread the chunk generation over multiple ticks
# to avoid player timeouts and server crashes due to lag
#
# @within
# 	function fetchr:game/start/pre_gen/*

#>
# The current step
#
# @within
# 	function fetchr:game/start/pre_gen/*
#declare score_holder $game_start/pre_gen.i

#>
# The timestamp in miliseconds this iteration started
#
# @within
# 	function fetchr:game/start/pre_gen/*
#declare score_holder $game_start/pre_gen.start

execute in fetchr:lobby run function neun_einser.timer:read
scoreboard players operation $game_start/pre_gen.start fetchr.tmp = $raw 91.timer.time

execute if score $pregen_status fetchr.state matches 1 as @e[type=minecraft:marker, tag=fetchr.pre_gen_last_chunk, limit=1] at @s run function fetchr:game/start/pre_gen/set_position_and_generate_next

execute store result bossbar fetchr:start/pre_gen/progress value run scoreboard players get $game_start/pre_gen.i fetchr.schedule