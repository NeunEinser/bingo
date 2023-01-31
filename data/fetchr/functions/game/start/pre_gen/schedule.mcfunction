#> fetchr:game/start/pre_gen/schedule
#
# This function is scheduled to spread the chunk generation over multiple ticks
# to avoid player timeouts and server crashes due to lag
#
# @within
# 	function fetchr:game/start/pre_gen/*

# Aim for 60 ms per tick. 50 ms is lag-free, but we need some buffer to be able
# to measure how close we are to our goal in both directions.
function neun_einser.timer:read
# -9 because 3x3 chunks are loaded before the timer starts
scoreboard players set $game_start/pre_gen.chunks_per_tick fetchr.tmp -9
scoreboard players operation $game_start/pre_gen.chunks_per_tick fetchr.tmp = $game_start/pre_gen.i fetchr.tmp
scoreboard players operation $game_start/pre_gen.chunks_per_tick fetchr.tmp *= 60 fetchr.const
scoreboard players operation $game_start/pre_gen.chunks_per_tick fetchr.tmp /= $raw 91.timer.time
scoreboard players operation $game_start/pre_gen.chunks_per_tick fetchr.tmp > 1 fetchr.const

scoreboard players operation $millis fetchr.tmp = $raw 91.timer.time
scoreboard players operation $millis fetchr.tmp -= $game_start/pre_gen.last_tick_time fetchr.tmp
#tellraw @a ["raw: ", {"score":{"name": "$millis", "objective": "fetchr.tmp"}}, ", total chunks: ", {"score":{"name": "$game_start/pre_gen.i", "objective": "fetchr.tmp"}}, ", cpt: ", {"score":{"name": "$game_start/pre_gen.chunks_per_tick", "objective": "fetchr.tmp"}}]
scoreboard players operation $game_start/pre_gen.last_tick_time fetchr.tmp = $raw 91.timer.time

execute in fetchr:default as @e[type=minecraft:marker, tag=fetchr.spawn, distance=0.., limit=1] at @s run function fetchr:game/start/pre_gen/goto_current_chunk

execute store result bossbar fetchr:start/pre_gen/progress value run scoreboard players get $game_start/pre_gen.i fetchr.tmp