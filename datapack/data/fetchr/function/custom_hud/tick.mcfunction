#> fetchr:custom_hud/tick
#
# Displays the fetchr card for @s
#
# @within fetchr:tick/player_tick
# @context entity Player for displaying the card
# @reads score @s fetchr.card_pos

#>
# @within
# 	function fetchr:custom_hud/**
# 	function fetchr:tick/tick
#declare storage tmp.fetchr:custom_hud

function fetchr:custom_hud/display_card

scoreboard players add @s fetchr.last_hud_update 1

execute \
	unless score @s fetchr.last_hud_update matches 40.. \
	if score $update_card fetchr.state matches 1 \
	run function fetchr:custom_hud/update_actionbar
execute \
	if score @s fetchr.last_hud_update matches 40.. \
	run function fetchr:custom_hud/update_actionbar

scoreboard players reset @s fetchr.update_hud