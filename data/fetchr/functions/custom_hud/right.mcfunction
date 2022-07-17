#> fetchr:custom_hud/right
# Adds spaces for displaying the card on the right side, depending on
# preferences
#
# @within function fetchr:custom_hud/display_card

#TODO consider different screen sizes. Currently only a width of 1920 px is supported

#next to hotbar
execute if score @s fetchr.card_position matches 8 run data merge storage fetchr:tmp {cardOffset:'{"translate":"space.91","font":"space:default"}',cardNegOffset:'{"translate":"space.-91"}'}
#next to attack indicator
execute if score @s fetchr.card_position matches 9 run data merge storage fetchr:tmp {cardOffset:'{"translate":"space.121","font":"space:default"}',cardNegOffset:'{"translate":"space.-121"}'}
#right edge (gui 1)
execute if score @s fetchr.card_position matches 10 run data merge storage fetchr:tmp {cardOffset:'{"translate":"space.856","font":"space:default"}',cardNegOffset:'{"translate":"space.-856"}'}
#right edge (gui 2)
execute if score @s fetchr.card_position matches 11 run data merge storage fetchr:tmp {cardOffset:'{"translate":"space.376","font":"space:default"}',cardNegOffset:'{"translate":"space.-376"}'}
#right edge (gui 3)
execute if score @s fetchr.card_position matches 12 run data merge storage fetchr:tmp {cardOffset:'{"translate":"space.216","font":"space:default"}',cardNegOffset:'{"translate":"space.-216"}'}
#right edge (gui 4)
execute if score @s fetchr.card_position matches 13 run data merge storage fetchr:tmp {cardOffset:'{"translate":"space.136","font":"space:default"}',cardNegOffset:'{"translate":"space.-136"}'}