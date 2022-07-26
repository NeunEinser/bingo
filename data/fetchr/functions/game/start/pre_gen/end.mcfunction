#> fetchr:game/start/pre_gen/end
# This function is called at the end of the pregeneration process and depending
# on whether the game was started already, initializes the spawn sequence, or
# summons a marker area effect cloud.
#
# @within function fetchr:game/start/pre_gen/generate_chunks_without_lag
# @context position Spawn location.

kill @e[type=minecraft:marker, tag=fetchr.pre_gen_last_chunk, limit=1]

scoreboard players set $pregen_status fetchr.state 2
execute if score $game_state fetchr.state matches 1 run function fetchr:game/start/spawn_skybox
execute if score $game_state fetchr.state matches 0 run summon minecraft:marker ~ ~ ~ {Tags: ["fetchr.skybox"]}