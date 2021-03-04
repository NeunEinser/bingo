#> bingo:command_queue/claculate_next_position_and_set_command_block/run
#
# This function calculates the position for the next command block and stores it
# in $command_queue.x/y/z.
#
# The position of the marker aec is also changed in here.
#
# @within function bingo:command_queue/iter
# @writes
# 	score_holder $command_queue.x
# 	score_holder $command_queue.y
# 	score_holder $command_queue.z

#>
# Contains the result of z % 2
#
# @within bingo:command_queue/claculate_next_position_and_set_command_block/**
#declare score_holder $command_queue/next_pos.modz
#>
# Contains the result of y % 2
#
# @within bingo:command_queue/claculate_next_position_and_set_command_block/**
#declare score_holder $command_queue/next_pos.mody

scoreboard players operation $command_queue/next_pos.modz bingo.tmp = $command_queue.z bingo.tmp
scoreboard players operation $command_queue/next_pos.modz bingo.tmp %= 2 bingo.const
scoreboard players operation $command_queue/next_pos.mody bingo.tmp = $command_queue.y bingo.tmp
scoreboard players operation $command_queue/next_pos.mody bingo.tmp %= 2 bingo.const

# Check for hitting the limit on the x axis. If (z % 2) == (y % 2), we move towards positive x, otherwise towards negative x. 
execute if score $command_queue/next_pos.modz bingo.tmp = $command_queue/next_pos.mody bingo.tmp if score $command_queue.x bingo.tmp matches 15 run function bingo:command_queue/claculate_next_position_and_set_command_block/check_z_limit
execute unless score $command_queue/next_pos.modz bingo.tmp = $command_queue/next_pos.mody bingo.tmp if score $command_queue.x bingo.tmp matches 0 run function bingo:command_queue/claculate_next_position_and_set_command_block/check_z_limit

execute if score $command_queue/next_pos.modz bingo.tmp = $command_queue/next_pos.mody bingo.tmp unless score $command_queue.x bingo.tmp matches 15 run function bingo:command_queue/claculate_next_position_and_set_command_block/next_positive_x
execute unless score $command_queue/next_pos.modz bingo.tmp = $command_queue/next_pos.mody bingo.tmp unless score $command_queue.x bingo.tmp matches 0 run function bingo:command_queue/claculate_next_position_and_set_command_block/next_negative_x

execute store result entity @s Pos[0] double 1 run scoreboard players get $command_queue.x bingo.tmp
execute store result entity @s Pos[1] double 1 run scoreboard players get $command_queue.y bingo.tmp
execute store result entity @s Pos[2] double 1 run scoreboard players get $command_queue.z bingo.tmp