data modify storage bingo:tmp icon set value '"\\uFFFF"'
execute store success score $success bingo.tmp run data modify storage bingo:tmp icon set from storage bingo:tmp slots[5]
execute if score $success bingo.tmp matches 1 run function bingo:item_detection/helper/goals/bingo/row/2/2