execute store result entity @s Pos[0] double 1 run scoreboard players get $x bingo_commands
execute store result entity @s Pos[1] double 1 run scoreboard players get $y bingo_commands
execute store result entity @s Pos[2] double 1 run scoreboard players get $z bingo_commands

execute store result score $size bingo_commands run data get storage bingo:commands queue
execute at @s run function bingo:run_command_from_string/set_command_block

data remove storage bingo:commands queue[0]
execute if score $size bingo_commands matches 1.. run function bingo:run_command_from_string/iter