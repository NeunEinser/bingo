execute if score $i bingo_tmp matches 0 run data modify storage bingo:tmp item set from storage bingo:tmp slots[0].item.item

data remove storage bingo:tmp slots[0]
scoreboard players remove $i bingo_tmp 1
execute if score $i bingo_tmp matches 0.. run function bingo:card_frames/find_item