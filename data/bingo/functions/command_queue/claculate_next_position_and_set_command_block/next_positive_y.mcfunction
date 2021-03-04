#> bingo:command_queue/claculate_next_position_and_set_command_block/next_positive_y
#
# This function sets a command block facing up and moves to the positive y
#
# @within function bingo:command_queue/claculate_next_position_and_set_command_block/check_z_limit

setblock ~ ~ ~ minecraft:chain_command_block[facing=up]{auto: true}
scoreboard players add $command_queue.y bingo.tmp 1