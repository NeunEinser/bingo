#> bingo:command_queue/claculate_next_position_and_set_command_block/next_positive_x
#
# This function sets a command block facing east and moves to the positive x
#
# @within function bingo:command_queue/claculate_next_position_and_set_command_block/run

setblock ~ ~ ~ minecraft:chain_command_block[facing=east]{auto: true}
scoreboard players add $command_queue.x bingo.tmp 1