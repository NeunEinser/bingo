#> bingo:command_queue/claculate_next_position_and_set_command_block/check_z_limit
#
# This function checks z limits and moves to the next z or y position, depending
# on the result
#
# @within function bingo:command_queue/claculate_next_position_and_set_command_block/run

execute if score $command_queue/next_pos.mody bingo.tmp matches 0 if score $command_queue.z bingo.tmp matches 15 run function bingo:command_queue/claculate_next_position_and_set_command_block/next_positive_y
execute if score $command_queue/next_pos.mody bingo.tmp matches 1 if score $command_queue.z bingo.tmp matches 0 run function bingo:command_queue/claculate_next_position_and_set_command_block/next_positive_y
execute if score $command_queue/next_pos.mody bingo.tmp matches 0 unless score $command_queue.z bingo.tmp matches 15 run function bingo:command_queue/claculate_next_position_and_set_command_block/next_positive_z
execute if score $command_queue/next_pos.mody bingo.tmp matches 1 unless score $command_queue.z bingo.tmp matches 0 run function bingo:command_queue/claculate_next_position_and_set_command_block/next_negative_z