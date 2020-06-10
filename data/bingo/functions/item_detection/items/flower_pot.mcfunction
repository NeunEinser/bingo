function bingo:find_player_team
execute store success score $success bingo_tmp run data modify storage bingo:tmp slot set from storage bingo:card slots[{item:{id:"minecraft:flower_pot"}}]
execute if score $success bingo_tmp matches 1 run function bingo:item_detection/helper/set_border
execute store success score $success bingo_tmp run data modify storage bingo:tmp slots[-1] set from storage bingo:tmp team.completedBorder
execute if score $success bingo_tmp matches 1 run function bingo:item_detection/helper/announce_item_gotten