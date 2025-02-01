#> fetchr:custom_hud/right
# Adds spaces for displaying the card on the right side, depending on
# preferences
#
# @within function fetchr:custom_hud/display_card

#TODO consider different screen sizes. Currently only a width of 1920 px is supported

#NEUN_SCRIPT until 65
# next to hotbar
#execute \
	if score @s fetchr.card_position matches 8 run \
	data merge storage fetchr:tmp { cardOffset: '"\\u005b"', cardNegOffset: '"\\uffa5"' }
# next to attack indicator
#execute \
	if score @s fetchr.card_position matches 9 \
	run data merge storage fetchr:tmp { cardOffset: '"\\u0079"', cardNegOffset: '"\\uff87"' }
# right edge (gui 1)
#execute \
	if score @s fetchr.card_position matches 10 \
	run data merge storage fetchr:tmp { cardOffset: '"\\u0358"', cardNegOffset: '"\\ufca8"' }
# right edge (gui 2)
#execute \
	if score @s fetchr.card_position matches 11 \
	run data merge storage fetchr:tmp { cardOffset: '"\\u0178"', cardNegOffset: '"\\ufe88"' }
# right edge (gui 3)
#execute \
	if score @s fetchr.card_position matches 12 \
	run data merge storage fetchr:tmp { cardOffset: '"\\u00d8"', cardNegOffset: '"\\uff28"' }
# right edge (gui 4)
#execute \
	if score @s fetchr.card_position matches 13 \
	run data merge storage fetchr:tmp { cardOffset: '"\\u0088"', cardNegOffset: '"\\uff78"' }
#NEUN_SCRIPT end

#NEUN_SCRIPT since 65
# next to hotbar
execute \
	if score @s fetchr.card_position matches 8 run \
	data merge storage fetchr:tmp { cardOffset: "\u005b", cardNegOffset: "\uffa5" }
# next to attack indicator
execute \
	if score @s fetchr.card_position matches 9 \
	run data merge storage fetchr:tmp { cardOffset: "\u0079", cardNegOffset: "\uff87" }
# right edge (gui 1)
execute \
	if score @s fetchr.card_position matches 10 \
	run data merge storage fetchr:tmp { cardOffset: "\u0358", cardNegOffset: "\ufca8" }
# right edge (gui 2)
execute \
	if score @s fetchr.card_position matches 11 \
	run data merge storage fetchr:tmp { cardOffset: "\u0178", cardNegOffset: "\ufe88" }
# right edge (gui 3)
execute \
	if score @s fetchr.card_position matches 12 \
	run data merge storage fetchr:tmp { cardOffset: "\u00d8", cardNegOffset: "\uff28" }
# right edge (gui 4)
execute \
	if score @s fetchr.card_position matches 13 \
	run data merge storage fetchr:tmp { cardOffset: "\u0088", cardNegOffset: "\uff78" }
#NEUN_SCRIPT end