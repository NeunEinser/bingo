data modify storage bingo:tmp icon set value '"\\uFFFF"'
execute store success score $success bingo_tmp run data modify storage bingo:tmp icon set from storage bingo:tmp slots[2]
execute if score $success bingo_tmp matches 1 run function bingo:item_detection/helper/goals/bingo/col/2/2