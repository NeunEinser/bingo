#next to hotbar
execute if score @s[predicate=!bingo:has_item_in_offhand] bingo.card_pos matches 0 run data merge storage bingo:tmp {cardOffset:'{"translate":"space.-195"}',cardNegOffset:'{"translate":"space.195"}'}
execute if score @s[predicate=bingo:has_item_in_offhand] bingo.card_pos matches 0 run data merge storage bingo:tmp {cardOffset:'{"translate":"space.-224"}',cardNegOffset:'{"translate":"space.224"}'}
#left edge (gui 1)
execute if score @s bingo.card_pos matches 1 run data merge storage bingo:tmp {cardOffset:'{"translate":"space.-960"}',cardNegOffset:'{"translate":"space.960"}'}
#left edge (gui 2)
execute if score @s bingo.card_pos matches 2 run data merge storage bingo:tmp {cardOffset:'{"translate":"space.-480"}',cardNegOffset:'{"translate":"space.480"}'}
#left edge (gui 3)
execute if score @s bingo.card_pos matches 3 run data merge storage bingo:tmp {cardOffset:'{"translate":"space.-320"}',cardNegOffset:'{"translate":"space.320"}'}
#left edge (gui 4)
execute if score @s bingo.card_pos matches 4 run data merge storage bingo:tmp {cardOffset:'{"translate":"space.-240"}',cardNegOffset:'{"translate":"space.240"}'}