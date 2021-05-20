#> bingo:card_display/left
# Adds spaces for displaying the card on the left side, depending on preferences
#
# @within function bingo:card_display/display_if_seed_is_set

#TODO consider different screen sizes. Currently only a width of 1920 px is supported

#next to hotbar
execute if score @s[predicate=!bingo:has_item_in_offhand] bingo.card_pos matches 0 run data merge storage bingo:tmp {cardOffset:'{"translate":"space.-195"}',cardNegOffset:'{"translate":"space.195","font":"space:default"}'}
execute if score @s[predicate=bingo:has_item_in_offhand] bingo.card_pos matches 0 run data merge storage bingo:tmp {cardOffset:'{"translate":"space.-224"}',cardNegOffset:'{"translate":"space.224","font":"space:default"}'}
#left edge (gui 1)
execute if score @s bingo.card_pos matches 1 run data merge storage bingo:tmp {cardOffset:'{"translate":"space.-960"}',cardNegOffset:'{"translate":"space.960","font":"space:default"}'}
#left edge (gui 2)
execute if score @s bingo.card_pos matches 2 run data merge storage bingo:tmp {cardOffset:'{"translate":"space.-480"}',cardNegOffset:'{"translate":"space.480","font":"space:default"}'}
#left edge (gui 3)
execute if score @s bingo.card_pos matches 3 run data merge storage bingo:tmp {cardOffset:'{"translate":"space.-320"}',cardNegOffset:'{"translate":"space.320","font":"space:default"}'}
#left edge (gui 4)
execute if score @s bingo.card_pos matches 4 run data merge storage bingo:tmp {cardOffset:'{"translate":"space.-240"}',cardNegOffset:'{"translate":"space.240","font":"space:default"}'}