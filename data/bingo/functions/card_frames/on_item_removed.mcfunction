
#>
# @private
#declare tag bingo.unmark

data modify storage bingo:tmp slots set from storage bingo:card slots
scoreboard players operation $i bingo.tmp = @s bingo.frame_id
function bingo:card_frames/find_item

data modify storage bingo:tmp item.Count set value 1b
data modify entity @s Item set from storage bingo:tmp item

execute if block ~ ~ ~-1 minecraft:red_concrete run tag @s add bingo.unmark
execute if entity @s[tag=bingo.unmark] run setblock ~ ~ ~-1 minecraft:barrier
execute unless entity @s[tag=bingo.unmark] run setblock ~ ~ ~-1 minecraft:red_concrete

tag @s remove bingo.unmark