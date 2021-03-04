#> bingo:command_queue/claculate_next_position_and_set_command_block/next_negative_x
#
# This function sets a command block facing west and moves to the negative x
#
# @within function bingo:command_queue/claculate_next_position_and_set_command_block/run

setblock ~ ~ ~ minecraft:chain_command_block[facing=west]{auto: true}
scoreboard players remove $command_queue.x bingo.tmp 1