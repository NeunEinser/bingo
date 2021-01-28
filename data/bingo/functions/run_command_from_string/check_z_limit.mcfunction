execute if score $mody bingo.commands matches 0 if score $z bingo.commands matches 15 run function bingo:run_command_from_string/next_y
execute if score $mody bingo.commands matches 1 if score $z bingo.commands matches 0 run function bingo:run_command_from_string/next_y
execute if score $mody bingo.commands matches 0 unless score $z bingo.commands matches 15 run function bingo:run_command_from_string/next_z
execute if score $mody bingo.commands matches 1 unless score $z bingo.commands matches 0 run function bingo:run_command_from_string/next_z