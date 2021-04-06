#> bingo:game/start/initilize_spawnpoint
#
# Spawns all players at the current position
# @within function bingo:game/start/move_z/f

#>
# The marker cloud used to mark the current last pre-generated line of chunks.
#
# @within function bingo:game/start/*
#declare tag bingo.pre_gen_cloud

scoreboard players set $game_start/pre_gen.i bingo.tmp 1
tellraw @a {"translate": "Pre-generating Spawnpoint (Step %s/41)", "with":[{"score":{"name": "$game_start/pre_gen.i", "objective": "bingo.tmp"}}]}
forceload add ~-320 ~-320 ~-320 ~320
summon minecraft:area_effect_cloud ~-320 ~ ~ {Duration: 41, Tags: ["bingo.pre_gen_cloud"]}

schedule function bingo:game/start/pre_generate_spawn 1t