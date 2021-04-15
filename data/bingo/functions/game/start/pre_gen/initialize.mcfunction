#> bingo:game/start/pre_gen/initialize
#
# Initializes the pre-generation of chunks
#
# @within function bingo:game/start/move_z/f

#>
# The marker cloud used to mark the current last pre-generated line of chunks.
#
# @within function bingo:game/start/pre_gen/*
# @within function bingo:game/start/spawn_skybox
#declare tag bingo.pre_gen_cloud

scoreboard players set $game_start/pre_gen.i bingo.schedule 1
execute in bingo:lobby run function neun_einser.timer:start/millis
bossbar set bingo:start/pre_gen/progress players @a
bossbar set bingo:start/pre_gen/progress visible true
bossbar set bingo:start/pre_gen/progress max 1681
bossbar set bingo:start/pre_gen/progress value 0

forceload add ~-320 ~-320
summon minecraft:area_effect_cloud ~-320 ~ ~-320 {Duration: -1, Tags: ["bingo.pre_gen_cloud"]}
bossbar set bingo:start/pre_gen/progress value 1

schedule function bingo:game/start/pre_gen/schedule 1t