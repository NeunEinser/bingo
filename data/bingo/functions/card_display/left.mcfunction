#next to hotbar
execute if score @s[predicate=!bingo:has_item_in_offhand] bingo_card_pos matches 8 run data merge storage bingo:tmp {cardOffset:'{"translate":"space.-195"}',cardNegOffset:'{"translate":"space.195"}'}
execute if score @s[predicate=bingo:has_item_in_offhand] bingo_card_pos matches 8 run data merge storage bingo:tmp {cardOffset:'{"translate":"space.-224"}',cardNegOffset:'{"translate":"space.224"}'}
#right edge (gui 1)
execute if score @s bingo_card_pos matches 10 run data merge storage bingo:tmp {cardOffset:'{"translate":"space.-960"}',cardNegOffset:'{"translate":"space.960"}'}
#right edge (gui 2)
execute if score @s bingo_card_pos matches 11 run data merge storage bingo:tmp {cardOffset:'{"translate":"space.-480"}',cardNegOffset:'{"translate":"space.480"}'}
#right edge (gui 3)
execute if score @s bingo_card_pos matches 12 run data merge storage bingo:tmp {cardOffset:'{"translate":"space.-320"}',cardNegOffset:'{"translate":"space.320"}'}
#right edge (gui 4)
execute if score @s bingo_card_pos matches 13 run data merge storage bingo:tmp {cardOffset:'{"translate":"space.-240"}',cardNegOffset:'{"translate":"space.240"}'}