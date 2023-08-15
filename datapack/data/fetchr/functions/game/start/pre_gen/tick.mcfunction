#> fetchr:game/start/pre_gen/tick
#
# Handles all pre-genertion logic.
#
# @within function fetchr:tick/tick

execute unless score $pregen_status fetchr.state matches 2 run function fetchr:game/start/pre_gen/generate_and_process
execute if score $game_start/pre_gen/unload.i fetchr.tmp < $game_start/pre_gen/entities.i fetchr.tmp run function fetchr:game/start/pre_gen/unload_chunks