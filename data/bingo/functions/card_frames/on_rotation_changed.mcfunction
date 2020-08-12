data modify entity @s ItemRotation set value 0b

execute if block ~ ~ ~-1 minecraft:green_concrete run tag @s add bingo_unmark
execute if entity @s[tag=bingo_unmark] run setblock ~ ~ ~-1 minecraft:barrier
execute unless entity @s[tag=bingo_unmark] run setblock ~ ~ ~-1 minecraft:green_concrete

tag @s remove bingo_unmark