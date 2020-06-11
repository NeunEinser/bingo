execute store result score $player bingo_tmp run data get storage bingo:card slots[{selected: true}].players[0]
execute as @a if score @s bingo_id = $player bingo_tmp run tag @s add bingo_clear
data remove storage bingo:card slots[{selected: true}].players[0]

execute if data storage bingo:card slots[{selected: true}].players[0] run function bingo:item_detection/helper/tag_players_for_item_clear