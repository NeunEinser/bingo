#> fetchr:game/start/pre_gen/unload/unload_chunk
#
# Preunloads chunks while trying to prevent server lag
#
# @context
# 	position The location of the next chunk to unload
# @within
# 	function fetchr:game/start/pre_gen/go_to_chunk_end
# 	function fetchr:game/start/pre_gen/unload/unload_chunk

#>
# @private
#declare score_holder $game_start/pre_gen/unload.max
scoreboard players operation $game_start/pre_gen/unload.max fetchr.tmp = $game_start/pre_gen/entities.i fetchr.tmp
execute unless score $pregen_status fetchr.state matches 2 run scoreboard players remove $game_start/pre_gen/unload.max fetchr.tmp 289

execute if score $game_start/pre_gen/unload.i fetchr.tmp >= $game_start/pre_gen/unload.max fetchr.tmp run scoreboard players set $game_start/pre_gen.end_for_tick fetchr.tmp 1
execute if score $game_start/pre_gen.end_for_tick fetchr.tmp matches 1 run return 0

execute as @e[y=-64, dx=16, dz=16, dy=384] run function fetchr:game/start/unfreeze_entity
forceload remove ~ ~
scoreboard players add $game_start/pre_gen/unload.i fetchr.tmp 1

execute if score $game_start/pre_gen/unload.remaining_in_dir fetchr.tmp matches 0 run function fetchr:game/start/pre_gen/unload/change_dir
execute if score $game_start/pre_gen/unload.direction fetchr.tmp matches 0 run scoreboard players add $game_start/pre_gen/unload.z fetchr.tmp 1
execute if score $game_start/pre_gen/unload.direction fetchr.tmp matches 1 run scoreboard players remove $game_start/pre_gen/unload.x fetchr.tmp 1
execute if score $game_start/pre_gen/unload.direction fetchr.tmp matches 2 run scoreboard players remove $game_start/pre_gen/unload.z fetchr.tmp 1
execute if score $game_start/pre_gen/unload.direction fetchr.tmp matches 3 run scoreboard players add $game_start/pre_gen/unload.x fetchr.tmp 1

scoreboard players remove $game_start/pre_gen/unload.remaining_in_dir fetchr.tmp 1

execute if score $game_start/pre_gen/unload.direction fetchr.tmp matches 0 positioned ~ ~ ~16 run function fetchr:game/start/pre_gen/unload/unload_chunk
execute if score $game_start/pre_gen/unload.direction fetchr.tmp matches 1 positioned ~-16 ~ ~ run function fetchr:game/start/pre_gen/unload/unload_chunk
execute if score $game_start/pre_gen/unload.direction fetchr.tmp matches 2 positioned ~ ~ ~-16 run function fetchr:game/start/pre_gen/unload/unload_chunk
execute if score $game_start/pre_gen/unload.direction fetchr.tmp matches 3 positioned ~16 ~ ~ run function fetchr:game/start/pre_gen/unload/unload_chunk