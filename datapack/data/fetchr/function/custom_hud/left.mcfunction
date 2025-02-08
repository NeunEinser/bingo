#> fetchr:custom_hud/left
# Adds spaces for displaying the card on the left side, depending on preferences
#
# @within function fetchr:custom_hud/display_card

#TODO consider different screen sizes. Currently only a width of 1920 px is supported

#NEUN_SCRIPT until 65
# next to hotbar
#execute \
	if score @s[predicate=!fetchr:has_item_in_offhand] fetchr.card_position \
	matches 0 \
	run data merge storage fetchr:tmp { cardOffset: '"\\uff3d"', cardNegOffset: '"\\u00c3"' }
#execute \
	if score @s[predicate=fetchr:has_item_in_offhand] fetchr.card_position matches 0 \
	run data merge storage fetchr:tmp { cardOffset: '"\\uff20"', cardNegOffset: '"\\u00e0"' }
# left edge (gui 1)
#execute \
	if score @s fetchr.card_position matches 1 \
	run data merge storage fetchr:tmp { cardOffset: '"\\ufc40"', cardNegOffset: '"\\u03c0"' }
# left edge (gui 2)
#execute \
	if score @s fetchr.card_position matches 2 \
	run data merge storage fetchr:tmp { cardOffset: '"\\ufe20"', cardNegOffset: '"\\u01e0"' }
# left edge (gui 3)
#execute \
	if score @s fetchr.card_position matches 3 \
	run data merge storage fetchr:tmp { cardOffset: '"\\ufec0"', cardNegOffset: '"\\u0140"' }
# left edge (gui 4)
#execute \
	if score @s fetchr.card_position matches 4 \
	run data merge storage fetchr:tmp { cardOffset: '"\\uff10"', cardNegOffset: '"\\u00f0"' }
#NEUN_SCRIPT end

#NEUN_SCRIPT since 65
# next to hotbar
execute \
	if score @s[predicate=!fetchr:has_item_in_offhand] fetchr.card_position \
	matches 0 \
	run data merge storage fetchr:tmp { cardOffset: "\uff3d", cardNegOffset: "\u00c3" }
execute \
	if score @s[predicate=fetchr:has_item_in_offhand] fetchr.card_position matches 0 \
	run data merge storage fetchr:tmp { cardOffset: "\uff20", cardNegOffset: "\u00e0" }
# left edge (gui 1)
execute \
	if score @s fetchr.card_position matches 1 \
	run data merge storage fetchr:tmp { cardOffset: "\ufc40", cardNegOffset: "\u03c0" }
# left edge (gui 2)
execute \
	if score @s fetchr.card_position matches 2 \
	run data merge storage fetchr:tmp { cardOffset: "\ufe20", cardNegOffset: "\u01e0" }
# left edge (gui 3)
execute \
	if score @s fetchr.card_position matches 3 \
	run data merge storage fetchr:tmp { cardOffset: "\ufec0", cardNegOffset: "\u0140" }
# left edge (gui 4)
execute \
	if score @s fetchr.card_position matches 4 \
	run data merge storage fetchr:tmp { cardOffset: "\uff10", cardNegOffset: "\u00f0" }
#NEUN_SCRIPT end