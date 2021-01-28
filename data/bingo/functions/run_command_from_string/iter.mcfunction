execute store result entity @s Pos[0] double 1 run scoreboard players get $x bingo.commands
execute store result entity @s Pos[1] double 1 run scoreboard players get $y bingo.commands
execute store result entity @s Pos[2] double 1 run scoreboard players get $z bingo.commands

execute store result score $size bingo.commands run data get storage bingo:commands queue
execute at @s run function bingo:run_command_from_string/set_command_block

data remove storage bingo:commands queue[0]
execute if score $size bingo.commands matches 1.. run function bingo:run_command_from_string/iter