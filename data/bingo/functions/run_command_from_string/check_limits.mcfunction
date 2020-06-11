scoreboard players operation $modz bingo_commands = $z bingo_commands
scoreboard players operation $modz bingo_commands %= 2 bingo_const
scoreboard players operation $mody bingo_commands = $y bingo_commands
scoreboard players operation $mody bingo_commands %= 2 bingo_const

execute if score $modz bingo_commands = $mody bingo_commands if score $x bingo_commands matches 15 run function bingo:run_command_from_string/check_z_limit
execute unless score $modz bingo_commands = $mody bingo_commands if score $x bingo_commands matches 0 run function bingo:run_command_from_string/check_z_limit

execute if score $modz bingo_commands = $mody bingo_commands unless score $x bingo_commands matches 15 run function bingo:run_command_from_string/next_x
execute unless score $modz bingo_commands = $mody bingo_commands unless score $x bingo_commands matches 0 run function bingo:run_command_from_string/next_x