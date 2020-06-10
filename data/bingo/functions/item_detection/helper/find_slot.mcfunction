data modify storage bingo:tmp slots append from storage bingo:tmp team.slots[0]
data remove storage bingo:tmp team.slots[0]

scoreboard players remove $i bingo_tmp 1
execute if score $i bingo_tmp matches 0.. run function bingo:item_detection/helper/find_slot