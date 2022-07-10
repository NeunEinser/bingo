#> bingo:game/start/pre_gen/generate_chunks_without_lag
#
# Pregenerates chunks while trying to prevent server lag
#
# @context
# 	entity The marker area effect cloud which marks the row of chunks which was
# 		generated last
# 	position The location of the next chunk to generate
# @within function bingo:game/start/pre_gen/set_position_and_generate_next

scoreboard players reset $game_start/pre_gen.column bingo.tmp
forceload add ~ ~
execute as @e[y=0, dx=16, dz=16, dy=256] run function bingo:game/start/pre_gen/handle_entities
teleport @s ~ ~ ~

scoreboard players add $game_start/pre_gen.i bingo.schedule 1

execute in bingo:lobby run function neun_einser.timer:read
scoreboard players operation $raw 91.timer.time -= $game_start/pre_gen.start bingo.tmp

execute unless score $game_start/pre_gen.i bingo.schedule matches ..1680 positioned ~-319.5 ~ ~-319.5 run function bingo:game/start/pre_gen/end

execute if score $game_start/pre_gen.i bingo.schedule matches ..1680 unless score $raw 91.timer.time matches ..40 run schedule function bingo:game/start/pre_gen/schedule 1t
execute if score $game_start/pre_gen.i bingo.schedule matches ..1680 if score $raw 91.timer.time matches ..40 run function bingo:game/start/pre_gen/set_position_and_generate_next