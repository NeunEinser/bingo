
#>
# @private
#declare tag bingo.unmark

data modify entity @s ItemRotation set value 0b

execute if block ~ ~ ~-1 minecraft:green_concrete run tag @s add bingo.unmark
execute if entity @s[tag=bingo.unmark] run setblock ~ ~ ~-1 minecraft:barrier
execute unless entity @s[tag=bingo.unmark] run setblock ~ ~ ~-1 minecraft:green_concrete

tag @s remove bingo.unmark