#> fetchr:game/start/pre_gen/initialize
#
# Initializes the pre-generation of chunks
#
# @within function fetchr:game/start/move_z/f

#>
# The marker cloud used to mark the current last pre-generated line of chunks.
#
# @within function fetchr:game/start/pre_gen/*
# @within function fetchr:game/start/spawn_skybox
#declare tag fetchr.pre_gen_last_chunk

scoreboard players set $pregen_status fetchr.state 1
scoreboard players set $game_start/pre_gen.i fetchr.schedule 1
function neun_einser.timer:start/millis
bossbar set fetchr:start/pre_gen/progress players @a
execute if score $game_state fetchr.settings matches 1 run bossbar set fetchr:start/pre_gen/progress visible true
bossbar set fetchr:start/pre_gen/progress max 1681
bossbar set fetchr:start/pre_gen/progress value 0

forceload add ~-320 ~-320
summon minecraft:marker ~-320 ~ ~-320 {Tags: ["fetchr.pre_gen_last_chunk"]}

# Make sure marker cloud is on chunk coords 0 0
#>
# @private
#declare score_holder $pre_gen.x
execute store result score $pre_gen.x fetchr.tmp run data get entity @e[type=minecraft:marker, tag=fetchr.pre_gen_last_chunk, limit=1] Pos[0]
#>
# @private
#declare score_holder $pre_gen.z
execute store result score $pre_gen.z fetchr.tmp run data get entity @e[type=minecraft:marker, tag=fetchr.pre_gen_last_chunk, limit=1] Pos[2]
#>
# @private
#declare score_holder $pre_gen.mod_x
scoreboard players operation $pre_gen.mod_x fetchr.tmp = $pre_gen.x fetchr.tmp
scoreboard players operation $pre_gen.mod_x fetchr.tmp %= 16 fetchr.const
#>
# @private
#declare score_holder $pre_gen.mod_z
scoreboard players operation $pre_gen.mod_z fetchr.tmp = $pre_gen.z fetchr.tmp
scoreboard players operation $pre_gen.mod_z fetchr.tmp %= 16 fetchr.const

scoreboard players operation $pre_gen.x fetchr.tmp -= $pre_gen.mod_x fetchr.tmp
scoreboard players operation $pre_gen.z fetchr.tmp -= $pre_gen.mod_z fetchr.tmp

execute store result entity @e[type=minecraft:marker, tag=fetchr.pre_gen_last_chunk, limit=1] Pos[0] double 1 run scoreboard players get $pre_gen.x fetchr.tmp
execute store result entity @e[type=minecraft:marker, tag=fetchr.pre_gen_last_chunk, limit=1] Pos[2] double 1 run scoreboard players get $pre_gen.z fetchr.tmp

bossbar set fetchr:start/pre_gen/progress value 1

schedule function fetchr:game/start/pre_gen/schedule 1t