#> fetchr:game/start/pre_gen/schedule
#
# This function is scheduled to spread the chunk generation over multiple ticks
# to avoid player timeouts and server crashes due to lag
#
# @within
# 	function fetchr:game/start/pre_gen/*

# Aim for 60 ms per tick. 50 ms is lag-free, but we need some buffer to be able
# to measure how close we are to our goal in both directions.
execute if score $game_state fetchr.state matches 0 run return 0

function neun_einser.timer:read
scoreboard players operation $game_start/pre_gen.chunks_per_tick fetchr.tmp = $game_start/pre_gen/generate.i fetchr.tmp
scoreboard players operation $game_start/pre_gen.chunks_per_tick fetchr.tmp *= 60 fetchr.const
scoreboard players operation $game_start/pre_gen.chunks_per_tick fetchr.tmp /= $raw 91.timer.time
scoreboard players add $game_start/pre_gen.chunks_per_tick fetchr.tmp 1

scoreboard players operation $millis fetchr.tmp = $raw 91.timer.time
scoreboard players operation $millis fetchr.tmp -= $game_start/pre_gen.last_tick_time fetchr.tmp
scoreboard players operation $game_start/pre_gen.last_tick_time fetchr.tmp = $raw 91.timer.time

execute in fetchr:default run function fetchr:game/start/pre_gen/goto_current_chunk

execute store result bossbar fetchr:start/pre_gen/progress value run scoreboard players get $game_start/pre_gen/generate.i fetchr.tmp