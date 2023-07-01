#> fetchr:game/start/pre_gen/go_to_chunk_end
#
# @within function fetchr:game/start/pre_gen/move_z/21

execute if score $game_start/pre_gen/goto.type fetchr.tmp matches 1 run function fetchr:game/start/pre_gen/generate/generate_chunk
# tp @a ~ 200 ~
# scoreboard players operation $x fetchr.tmp = $game_start/pre_gen/entities.x fetchr.tmp
# scoreboard players operation $x fetchr.tmp *= 16 fetchr.const
# scoreboard players operation $z fetchr.tmp = $game_start/pre_gen/entities.z fetchr.tmp
# scoreboard players operation $z fetchr.tmp *= 16 fetchr.const
#execute if score $game_start/pre_gen/goto.type fetchr.tmp matches 2 run tellraw @a [{"score": {"name": "$game_start/pre_gen/entities.x", "objective": "fetchr.tmp"}}, ", ", {"score": {"name": "$game_start/pre_gen/entities.z", "objective": "fetchr.tmp"}}]
# execute if score $game_start/pre_gen/goto.type fetchr.tmp matches 2 run tp @a ~ 200 ~

execute if score $game_start/pre_gen/goto.type fetchr.tmp matches 2 if loaded ~ ~ ~ run function fetchr:game/start/pre_gen/entities/process_entities
