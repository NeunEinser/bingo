#> fetchr:game/start/pre_gen/start
#
# Starts the pre-generation of chunks
#
# @within
# 	function fetchr:game/start/locate_spawnpoint

#>
# The marker cloud used to mark the current last pre-generated line of chunks.
#
# @within function fetchr:game/start/pre_gen/*
# @within function fetchr:game/start/spawn_skybox

scoreboard players set $pregen_status fetchr.state 1

#NEUN_SCRIPT since 16
$random reset * $(seed) false
#NEUN_SCRIPT end

gamerule doFireTick false
gamerule doDaylightCycle false
time set 0

forceload remove all
forceload add 0 0

#>
# Spawnpoint x coordinate
# @within function fetchr:game/start/pre_gen/**
#declare score_holder $game_start/pre_gen.spawn_x
#>
# Spawnpoint z coordinate
# @within function fetchr:game/start/pre_gen/**
#declare score_holder $game_start/pre_gen.spawn_z
#>
# @within
# 	function fetchr:game/start/pre_gen/*
# 	function fetchr:game/start/pre_gen/generate/*
#declare score_holder $game_start/pre_gen/generate.x
#>
# @within
# 	function fetchr:game/start/pre_gen/*
# 	function fetchr:game/start/pre_gen/generate/*
#declare score_holder $game_start/pre_gen/generate.z
#>
# @within
# 	function fetchr:game/start/pre_gen/*
# 	function fetchr:game/start/pre_gen/entities/*
#declare score_holder $game_start/pre_gen/entities.x
#>
# @within
# 	function fetchr:game/start/pre_gen/*
# 	function fetchr:game/start/pre_gen/entities/*
#declare score_holder $game_start/pre_gen/entities.z
#>
# @within
# 	function fetchr:game/start/pre_gen/*
# 	function fetchr:game/start/pre_gen/unload/*
#declare score_holder $game_start/pre_gen/unload.x
#>
# @within
# 	function fetchr:game/start/pre_gen/*
# 	function fetchr:game/start/pre_gen/unload/*
#declare score_holder $game_start/pre_gen/unload.z

# Spawn x: $result & 0xFFFF (signed)
# In order to not interfere with the worldborder timer, the max coordinate
# is 25,000,000. 762 * 2^15 = 24,969,216 which brings us the closest.
# In order to center the area around spawn, we add 762/2=381
# The algorithm for going to the coordinate is chunk based, so devide by 16 to
# get chunk coordinates
execute store result score $game_start/pre_gen.spawn_x fetchr.tmp run data get storage fetchr:card spawnLocation
scoreboard players operation $game_start/pre_gen.spawn_x fetchr.tmp %= 65536 fetchr.const
execute if score $game_start/pre_gen.spawn_x fetchr.tmp matches 32768.. run scoreboard players remove $game_start/pre_gen.spawn_x fetchr.tmp 65536
scoreboard players operation $game_start/pre_gen.spawn_x fetchr.tmp *= 762 fetchr.const
scoreboard players add $game_start/pre_gen.spawn_x fetchr.tmp 381
scoreboard players operation $game_start/pre_gen.spawn_x fetchr.tmp /= 16 fetchr.const
scoreboard players operation $spawn_x fetchr.state = $game_start/pre_gen.spawn_x fetchr.tmp
scoreboard players operation $spawn_x fetchr.state *= 16 fetchr.const
scoreboard players operation $game_start/pre_gen/generate.x fetchr.tmp = $game_start/pre_gen.spawn_x fetchr.tmp
scoreboard players operation $game_start/pre_gen/entities.x fetchr.tmp = $game_start/pre_gen.spawn_x fetchr.tmp
scoreboard players operation $game_start/pre_gen/unload.x fetchr.tmp = $game_start/pre_gen.spawn_x fetchr.tmp
scoreboard players add $game_start/pre_gen/unload.x fetchr.tmp 10

#Spawn z: $result >> 16
execute store result score $game_start/pre_gen.spawn_z fetchr.tmp run data get storage fetchr:card spawnLocation
scoreboard players operation $game_start/pre_gen.spawn_z fetchr.tmp /= 65536 fetchr.const
scoreboard players operation $game_start/pre_gen.spawn_z fetchr.tmp *= 762 fetchr.const
scoreboard players add $game_start/pre_gen.spawn_z fetchr.tmp 381
scoreboard players operation $game_start/pre_gen.spawn_z fetchr.tmp /= 16 fetchr.const
scoreboard players operation $spawn_z fetchr.state = $game_start/pre_gen.spawn_z fetchr.tmp
scoreboard players operation $spawn_z fetchr.state *= 16 fetchr.const
scoreboard players operation $game_start/pre_gen/generate.z fetchr.tmp = $game_start/pre_gen.spawn_z fetchr.tmp
scoreboard players operation $game_start/pre_gen/entities.z fetchr.tmp = $game_start/pre_gen.spawn_z fetchr.tmp
scoreboard players operation $game_start/pre_gen/unload.z fetchr.tmp = $game_start/pre_gen.spawn_z fetchr.tmp
scoreboard players remove $game_start/pre_gen/unload.z fetchr.tmp 9


#>
# The current step
#
# @within
# 	function fetchr:game/start/pre_gen/**
#declare score_holder $game_start/pre_gen/generate.i
scoreboard players set $game_start/pre_gen/generate.i fetchr.tmp 0
#>
# The current step
#
# @within
# 	function fetchr:game/start/pre_gen/**
#declare score_holder $game_start/pre_gen/entities.i
scoreboard players set $game_start/pre_gen/entities.i fetchr.tmp 0
#>
# The current step
#
# @within
# 	function fetchr:game/start/pre_gen/**
#declare score_holder $game_start/pre_gen/unload.i
scoreboard players set $game_start/pre_gen/unload.i fetchr.tmp 361

#>
# The timestamp in miliseconds this iteration started
#
# @within
# 	function fetchr:game/start/pre_gen/*
#declare score_holder $game_start/pre_gen.start

#>
# Remaining chunks in current direction
#
# @within
# 	function fetchr:game/start/pre_gen/*
# 	function fetchr:game/start/pre_gen/generate/*
#declare score_holder $game_start/pre_gen/generate.remaining_in_dir
scoreboard players set $game_start/pre_gen/generate.remaining_in_dir fetchr.tmp 1

#>
# Remaining chunks in current direction
#
# @within
# 	function fetchr:game/start/pre_gen/*
# 	function fetchr:game/start/pre_gen/entities/*
#declare score_holder $game_start/pre_gen/entities.remaining_in_dir
scoreboard players set $game_start/pre_gen/entities.remaining_in_dir fetchr.tmp 1

#>
# Remaining chunks in current direction
#
# @within
# 	function fetchr:game/start/pre_gen/*
# 	function fetchr:game/start/pre_gen/unload/*
#declare score_holder $game_start/pre_gen/unload.remaining_in_dir
scoreboard players set $game_start/pre_gen/unload.remaining_in_dir fetchr.tmp 19

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
# 	function fetchr:game/start/pre_gen/generate/*
#declare score_holder $game_start/pre_gen/generate.direction
scoreboard players set $game_start/pre_gen/generate.direction fetchr.tmp 3

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
# 	function fetchr:game/start/pre_gen/entities/*
#declare score_holder $game_start/pre_gen/entities.direction
scoreboard players set $game_start/pre_gen/entities.direction fetchr.tmp 3

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
# 	function fetchr:game/start/pre_gen/unload/*
#declare score_holder $game_start/pre_gen/unload.direction
scoreboard players set $game_start/pre_gen/unload.direction fetchr.tmp 0

#>
# Time last tick
#
# @within
# 	function fetchr:game/start/pre_gen/*
# 	function fetchr:game/start/pre_gen/generate/*
#declare score_holder $game_start/pre_gen.last_tick_time
scoreboard players set $game_start/pre_gen.last_tick_time fetchr.tmp 0
function neun_einser.timer:start/millis
#todo configurable max
execute store result bossbar fetchr:start/pre_gen/progress max run scoreboard players get $pregeneration_chunks fetchr.settings
bossbar set fetchr:start/pre_gen/progress value 0

function fetchr:game/start/pre_gen/generate_and_process
