#> fetchr:game/start/pre_gen/generate_and_process
#
# @within
# 	function fetchr:game/start/pre_gen/start
# 	function fetchr:game/start/pre_gen/tick

function neun_einser.timer:read
scoreboard players operation $game_start/pre_gen.chunks_per_tick fetchr.tmp = $game_start/pre_gen/generate.i fetchr.tmp
scoreboard players operation $game_start/pre_gen.chunks_per_tick fetchr.tmp *= 60 fetchr.const
scoreboard players operation $game_start/pre_gen.chunks_per_tick fetchr.tmp /= $raw 91.timer.time
scoreboard players add $game_start/pre_gen.chunks_per_tick fetchr.tmp 1

scoreboard players operation $millis fetchr.tmp = $raw 91.timer.time
scoreboard players operation $millis fetchr.tmp -= $game_start/pre_gen.last_tick_time fetchr.tmp
scoreboard players operation $game_start/pre_gen.last_tick_time fetchr.tmp = $raw 91.timer.time

#>
# @within
# 	function fetchr:game/start/pre_gen/**
#declare score_holder $game_start/pre_gen/goto.x
scoreboard players operation $game_start/pre_gen/goto.x fetchr.tmp = $game_start/pre_gen/generate.x fetchr.tmp
#>
# @within
# 	function fetchr:game/start/pre_gen/**
#declare score_holder $game_start/pre_gen/goto.z
scoreboard players operation $game_start/pre_gen/goto.z fetchr.tmp = $game_start/pre_gen/generate.z fetchr.tmp
scoreboard players set $game_start/pre_gen/goto.type fetchr.tmp 1

#>
# @private
#declare score_holder $game_start/pre_gen.chunks_left
#TODO configurable max
scoreboard players set $game_start/pre_gen.chunks_left fetchr.tmp 361
scoreboard players operation $game_start/pre_gen.chunks_left fetchr.tmp -= $game_start/pre_gen/generate.i fetchr.tmp

#>
# Remaining chunks in current direction
#
# @within
# 	function fetchr:game/start/pre_gen/generate_and_process
# 	function fetchr:game/start/pre_gen/generate/*
#declare score_holder $game_start/pre_gen.chunks_left_in_tick
scoreboard players operation $game_start/pre_gen.chunks_left_in_tick fetchr.tmp = $game_start/pre_gen.chunks_per_tick fetchr.tmp
scoreboard players operation $game_start/pre_gen.chunks_left_in_tick fetchr.tmp < $game_start/pre_gen.chunks_left fetchr.tmp

execute if score $game_start/pre_gen.chunks_left fetchr.tmp matches 1.. run function fetchr:game/start/pre_gen/move_x/0

scoreboard players operation $game_start/pre_gen/goto.x fetchr.tmp = $game_start/pre_gen/entities.x fetchr.tmp
scoreboard players operation $game_start/pre_gen/goto.z fetchr.tmp = $game_start/pre_gen/entities.z fetchr.tmp
scoreboard players set $game_start/pre_gen/goto.type fetchr.tmp 2
function fetchr:game/start/pre_gen/move_x/0

execute if score $game_start/pre_gen.chunks_left fetchr.tmp matches 0 if score $game_start/pre_gen/entities.i fetchr.tmp >= $game_start/pre_gen/generate.i fetchr.tmp run function fetchr:game/start/pre_gen/end

execute store result bossbar fetchr:start/pre_gen/progress value run scoreboard players get $game_start/pre_gen/entities.i fetchr.tmp