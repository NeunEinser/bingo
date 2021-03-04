#> bingo:command_queue/claculate_next_position_and_set_command_block/next_negative_z
#
# This function sets a command block facing west and moves to the negative z
#
# @within function bingo:command_queue/claculate_next_position_and_set_command_block/check_z_limit

setblock ~ ~ ~ minecraft:chain_command_block[facing=north]{auto: true}
scoreboard players remove $command_queue.z bingo.tmp 1