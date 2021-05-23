#> bingo:actionbar_display/right
# Adds spaces for displaying the card on the right side, depending on
# preferences
#
# @within function bingo:actionbar_display/display_if_seed_is_set

#TODO consider different screen sizes. Currently only a width of 1920 px is supported

#next to hotbar
execute if score @s bingo.card_pos matches 8 run data merge storage bingo:tmp {cardOffset:'{"translate":"space.91","font":"space:default"}',cardNegOffset:'{"translate":"space.-91"}'}
#next to attack indicator
execute if score @s bingo.card_pos matches 9 run data merge storage bingo:tmp {cardOffset:'{"translate":"space.121","font":"space:default"}',cardNegOffset:'{"translate":"space.-121"}'}
#right edge (gui 1)
execute if score @s bingo.card_pos matches 10 run data merge storage bingo:tmp {cardOffset:'{"translate":"space.856","font":"space:default"}',cardNegOffset:'{"translate":"space.-856"}'}
#right edge (gui 2)
execute if score @s bingo.card_pos matches 11 run data merge storage bingo:tmp {cardOffset:'{"translate":"space.376","font":"space:default"}',cardNegOffset:'{"translate":"space.-376"}'}
#right edge (gui 3)
execute if score @s bingo.card_pos matches 12 run data merge storage bingo:tmp {cardOffset:'{"translate":"space.216","font":"space:default"}',cardNegOffset:'{"translate":"space.-216"}'}
#right edge (gui 4)
execute if score @s bingo.card_pos matches 13 run data merge storage bingo:tmp {cardOffset:'{"translate":"space.136","font":"space:default"}',cardNegOffset:'{"translate":"space.-136"}'}