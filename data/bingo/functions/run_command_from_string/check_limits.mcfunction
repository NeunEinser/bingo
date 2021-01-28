scoreboard players operation $modz bingo.commands = $z bingo.commands
scoreboard players operation $modz bingo.commands %= 2 bingo.const
scoreboard players operation $mody bingo.commands = $y bingo.commands
scoreboard players operation $mody bingo.commands %= 2 bingo.const

execute if score $modz bingo.commands = $mody bingo.commands if score $x bingo.commands matches 15 run function bingo:run_command_from_string/check_z_limit
execute unless score $modz bingo.commands = $mody bingo.commands if score $x bingo.commands matches 0 run function bingo:run_command_from_string/check_z_limit

execute if score $modz bingo.commands = $mody bingo.commands unless score $x bingo.commands matches 15 run function bingo:run_command_from_string/next_x
execute unless score $modz bingo.commands = $mody bingo.commands unless score $x bingo.commands matches 0 run function bingo:run_command_from_string/next_x