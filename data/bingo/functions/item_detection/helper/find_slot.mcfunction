data modify storage bingo:tmp slots append from storage bingo:tmp previousSlots[0]
data remove storage bingo:tmp previousSlots[0]

scoreboard players remove $i bingo.tmp 1
execute if score $i bingo.tmp matches 0.. run function bingo:item_detection/helper/find_slot