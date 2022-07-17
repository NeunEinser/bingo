#> fetchr:custom_hud/left
# Adds spaces for displaying the card on the left side, depending on preferences
#
# @within function fetchr:custom_hud/display_card

#TODO consider different screen sizes. Currently only a width of 1920 px is supported

#next to hotbar
execute if score @s[predicate=!fetchr:has_item_in_offhand] fetchr.card_position matches 0 run data merge storage fetchr:tmp {cardOffset:'{"translate":"space.-195"}',cardNegOffset:'{"translate":"space.195","font":"space:default"}'}
execute if score @s[predicate=fetchr:has_item_in_offhand] fetchr.card_position matches 0 run data merge storage fetchr:tmp {cardOffset:'{"translate":"space.-224"}',cardNegOffset:'{"translate":"space.224","font":"space:default"}'}
#left edge (gui 1)
execute if score @s fetchr.card_position matches 1 run data merge storage fetchr:tmp {cardOffset:'{"translate":"space.-960"}',cardNegOffset:'{"translate":"space.960","font":"space:default"}'}
#left edge (gui 2)
execute if score @s fetchr.card_position matches 2 run data merge storage fetchr:tmp {cardOffset:'{"translate":"space.-480"}',cardNegOffset:'{"translate":"space.480","font":"space:default"}'}
#left edge (gui 3)
execute if score @s fetchr.card_position matches 3 run data merge storage fetchr:tmp {cardOffset:'{"translate":"space.-320"}',cardNegOffset:'{"translate":"space.320","font":"space:default"}'}
#left edge (gui 4)
execute if score @s fetchr.card_position matches 4 run data merge storage fetchr:tmp {cardOffset:'{"translate":"space.-240"}',cardNegOffset:'{"translate":"space.240","font":"space:default"}'}