#> fetchr:game/start/pre_gen/initialize
#
# Initializes scoreboards at the beginning of chunk pregen. Is executed after
# the spawn itself is loaded
#
# @within function fetchr:game/start/pre_gen/start
# @context
# 	position Fetchr Spawnpoint
# 	entity Spawn marker

say hi
scoreboard players set $pregen_status fetchr.state 1

#>
# The current step
#
# @within
# 	function fetchr:game/start/pre_gen/*
#declare score_holder $game_start/pre_gen.i
scoreboard players set $game_start/pre_gen.i fetchr.tmp 9

#>
# The timestamp in miliseconds this iteration started
#
# @within
# 	function fetchr:game/start/pre_gen/*
#declare score_holder $game_start/pre_gen.start

#>
# The current chunk x offset
#
# @within
# 	function fetchr:game/start/pre_gen/*
#declare score_holder $game_start/pre_gen.x
scoreboard players set $game_start/pre_gen.x fetchr.tmp 2

#>
# The current chunk z offset
#
# @within
# 	function fetchr:game/start/pre_gen/*
#declare score_holder $game_start/pre_gen.z
scoreboard players set $game_start/pre_gen.z fetchr.tmp -1

#>
# Remaining chunks in current direction
#
# @within
# 	function fetchr:game/start/pre_gen/*
#declare score_holder $game_start/pre_gen.remaining_in_dir
scoreboard players set $game_start/pre_gen.remaining_in_dir fetchr.tmp 3

#>
# Remaining chunks in current direction
#
# @within
# 	function fetchr:game/start/pre_gen/*
#declare score_holder $game_start/pre_gen.chunks_per_tick
scoreboard players set $game_start/pre_gen.chunks_per_tick fetchr.tmp 5

#>
# The current direction.
#
# 0: pos z
# 1: neg x
# 2: neg z
# 3: pos x
#
# @within
# 	function fetchr:game/start/pre_gen/*
#declare score_holder $game_start/pre_gen.direction
scoreboard players set $game_start/pre_gen.direction fetchr.tmp 0

#>
# Time last tick
#
# @within
# 	function fetchr:game/start/pre_gen/*
#declare score_holder $game_start/pre_gen.last_tick_time
scoreboard players set $game_start/pre_gen.last_tick_time fetchr.tmp 0
function neun_einser.timer:start/millis
#todo configurable max
bossbar set fetchr:start/pre_gen/progress max 1681
bossbar set fetchr:start/pre_gen/progress value 9


# Make sure marker is on chunk coords 0 0
#>
# @private
#declare score_holder $game_start/pre_gen.spawn_x
execute store result score $game_start/pre_gen.spawn_x fetchr.tmp run data get entity @s Pos[0]
#>
# @private
#declare score_holder $game_start/pre_gen.spawn_z
execute store result score $game_start/pre_gen.spawn_z fetchr.tmp run data get entity @s Pos[2]
#>
# @private
#declare score_holder $game_start/pre_gen.spawn_mod_x
scoreboard players operation $game_start/pre_gen.spawn_mod_x fetchr.tmp = $game_start/pre_gen.spawn_x fetchr.tmp
scoreboard players operation $game_start/pre_gen.spawn_mod_x fetchr.tmp %= 16 fetchr.const
#>
# @private
#declare score_holder $game_start/pre_gen.spawn_mod_z
scoreboard players operation $game_start/pre_gen.spawn_mod_z fetchr.tmp = $game_start/pre_gen.spawn_z fetchr.tmp
scoreboard players operation $game_start/pre_gen.spawn_mod_z fetchr.tmp %= 16 fetchr.const

scoreboard players operation $game_start/pre_gen.spawn_x fetchr.tmp -= $game_start/pre_gen.spawn_mod_x fetchr.tmp
scoreboard players operation $game_start/pre_gen.spawn_z fetchr.tmp -= $game_start/pre_gen.spawn_mod_z fetchr.tmp

execute store result entity @s Pos[0] double 1 run scoreboard players get $game_start/pre_gen.spawn_x fetchr.tmp
execute store result entity @s Pos[2] double 1 run scoreboard players get $game_start/pre_gen.spawn_z fetchr.tmp

execute at @s run function fetchr:game/start/pre_gen/goto_current_chunk