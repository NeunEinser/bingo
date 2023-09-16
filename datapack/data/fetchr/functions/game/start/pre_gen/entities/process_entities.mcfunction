#> fetchr:game/start/pre_gen/entities/process_entities
#
# @within
# 	function fetchr:game/start/pre_gen/go_to_chunk_end
# 	function fetchr:game/start/pre_gen/entities/process_entities

execute unless loaded ~ ~ ~ run scoreboard players set $game_start/pre_gen.end_for_tick fetchr.tmp 1
execute if score $game_start/pre_gen/entities.i fetchr.tmp >= $game_start/pre_gen/generate.i fetchr.tmp run scoreboard players set $game_start/pre_gen.end_for_tick fetchr.tmp 1
execute if score $game_start/pre_gen.end_for_tick fetchr.tmp matches 1 run return 0

scoreboard players add $game_start/pre_gen/entities.i fetchr.tmp 1

execute if score $game_start/pre_gen/entities.remaining_in_dir fetchr.tmp matches 0 run function fetchr:game/start/pre_gen/entities/change_dir
execute if score $game_start/pre_gen/entities.direction fetchr.tmp matches 0 run scoreboard players add $game_start/pre_gen/entities.z fetchr.tmp 1
execute if score $game_start/pre_gen/entities.direction fetchr.tmp matches 1 run scoreboard players remove $game_start/pre_gen/entities.x fetchr.tmp 1
execute if score $game_start/pre_gen/entities.direction fetchr.tmp matches 2 run scoreboard players remove $game_start/pre_gen/entities.z fetchr.tmp 1
execute if score $game_start/pre_gen/entities.direction fetchr.tmp matches 3 run scoreboard players add $game_start/pre_gen/entities.x fetchr.tmp 1

scoreboard players remove $game_start/pre_gen/entities.remaining_in_dir fetchr.tmp 1

execute as @e[y=-64, dx=16, dz=16, dy=384] run function fetchr:game/start/pre_gen/freeze_entity

execute if score $game_start/pre_gen/entities.i fetchr.tmp matches 9 positioned ~-16 ~ ~16 run function fetchr:game/skybox/create_skybox/exec
execute if score $game_start/pre_gen/entities.i fetchr.tmp matches 361 run function fetchr:game/start/pre_gen/schedule_entity_check

execute if score $game_start/pre_gen/entities.direction fetchr.tmp matches 0 positioned ~ ~ ~16 run function fetchr:game/start/pre_gen/entities/process_entities
execute if score $game_start/pre_gen/entities.direction fetchr.tmp matches 1 positioned ~-16 ~ ~ run function fetchr:game/start/pre_gen/entities/process_entities
execute if score $game_start/pre_gen/entities.direction fetchr.tmp matches 2 positioned ~ ~ ~-16 run function fetchr:game/start/pre_gen/entities/process_entities
execute if score $game_start/pre_gen/entities.direction fetchr.tmp matches 3 positioned ~16 ~ ~ run function fetchr:game/start/pre_gen/entities/process_entities