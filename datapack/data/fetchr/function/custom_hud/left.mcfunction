#> fetchr:custom_hud/left
# Adds spaces for displaying the card on the left side, depending on preferences
#
# @within function fetchr:custom_hud/display_card

#TODO consider different screen sizes. Currently only a width of 1920 px is supported

# next to hotbar
# left edge (gui 1)
# left edge (gui 2)
# left edge (gui 3)
# left edge (gui 4)

# next to hotbar
execute \
	if score @s[predicate=!fetchr:has_item_in_offhand] fetchr.card_position \
	matches 0 \
	run data merge storage fetchr:tmp { cardOffset: "\uff67", cardNegOffset: "\u0099" }
execute \
	if score @s[predicate=fetchr:has_item_in_offhand] fetchr.card_position matches 0 \
	run data merge storage fetchr:tmp { cardOffset: "\uff4a", cardNegOffset: "\u00b6" }