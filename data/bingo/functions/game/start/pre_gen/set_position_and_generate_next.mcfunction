#> bingo:game/start/pre_gen/set_position_and_generate_next
#
# Sets the position for the next chunk and generates the next bunch of chunks
# while avoiding server lag
#
# @within function bingo:game/start/pre_gen/*
# @context position The last generated chunk

#>
# The current column that is being pregenerated. Used to check if a shift to the
# next row is required
#
# This score is reset when calling generate_chunks_without_lag, in order to
# avoid accidental function calls during recursion tail
#
# @within
# 	function bingo:game/start/pre_gen/generate_chunks_without_lag
# 	function bingo:game/start/pre_gen/set_position_and_generate_next
#declare score_holder $game_start/pre_gen.column
scoreboard players operation $game_start/pre_gen.column bingo.tmp = $game_start/pre_gen.i bingo.tmp
scoreboard players operation $game_start/pre_gen.column bingo.tmp %= 41 bingo.const

execute if score $game_start/pre_gen.column bingo.tmp matches 0 positioned ~-640 ~ ~16 run function bingo:game/start/pre_gen/generate_chunks_without_lag
execute if score $game_start/pre_gen.column bingo.tmp matches 1.. positioned ~16 ~ ~ run function bingo:game/start/pre_gen/generate_chunks_without_lag