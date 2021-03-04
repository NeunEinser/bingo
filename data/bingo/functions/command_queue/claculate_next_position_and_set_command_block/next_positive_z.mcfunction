#> bingo:command_queue/claculate_next_position_and_set_command_block/next_positive_z
#
# This function sets a command block facing south and moves to the positive z
#
# @within function bingo:command_queue/claculate_next_position_and_set_command_block/check_z_limit

setblock ~ ~ ~ minecraft:chain_command_block[facing=south]{auto: true}
scoreboard players add $command_queue.z bingo.tmp 1