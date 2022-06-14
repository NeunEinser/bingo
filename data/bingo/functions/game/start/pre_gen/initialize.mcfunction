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

scoreboard players set $pregen_status bingo.state 1
scoreboard players set $game_start/pre_gen.i bingo.schedule 1
execute in bingo:lobby run function neun_einser.timer:start/millis
bossbar set bingo:start/pre_gen/progress players @a
execute if score $game_state bingo.settings matches 1 run bossbar set bingo:start/pre_gen/progress visible true
bossbar set bingo:start/pre_gen/progress max 1681
bossbar set bingo:start/pre_gen/progress value 0

forceload add ~-320 ~-320
summon minecraft:area_effect_cloud ~-320 ~ ~-320 {Duration: -1, Tags: ["bingo.pre_gen_cloud"]}

# Make sure marker cloud is on chunk coords 0 0
#>
# @private
#declare score_holder $pre_gen.x
execute store result score $pre_gen.x bingo.tmp run data get entity @e[type=minecraft:area_effect_cloud, tag=bingo.pre_gen_cloud, limit=1] Pos[0]
#>
# @private
#declare score_holder $pre_gen.z
execute store result score $pre_gen.z bingo.tmp run data get entity @e[type=minecraft:area_effect_cloud, tag=bingo.pre_gen_cloud, limit=1] Pos[2]
#>
# @private
#declare score_holder $pre_gen.mod_x
scoreboard players operation $pre_gen.mod_x bingo.tmp = $pre_gen.x bingo.tmp
scoreboard players operation $pre_gen.mod_x bingo.tmp %= 16 bingo.const
#>
# @private
#declare score_holder $pre_gen.mod_z
scoreboard players operation $pre_gen.mod_z bingo.tmp = $pre_gen.z bingo.tmp
scoreboard players operation $pre_gen.mod_z bingo.tmp %= 16 bingo.const

scoreboard players operation $pre_gen.x bingo.tmp -= $pre_gen.mod_x bingo.tmp
scoreboard players operation $pre_gen.z bingo.tmp -= $pre_gen.mod_z bingo.tmp

execute store result entity @e[type=minecraft:area_effect_cloud, tag=bingo.pre_gen_cloud, limit=1] Pos[0] double 1 run scoreboard players get $pre_gen.x bingo.tmp
execute store result entity @e[type=minecraft:area_effect_cloud, tag=bingo.pre_gen_cloud, limit=1] Pos[2] double 1 run scoreboard players get $pre_gen.z bingo.tmp

bossbar set bingo:start/pre_gen/progress value 1

schedule function bingo:game/start/pre_gen/schedule 1t