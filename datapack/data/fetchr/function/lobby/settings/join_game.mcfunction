#> fetchr:lobby/settings/join_game
#
# This function prints the prompt for changing pregen behavior.
#
# @user
# @context entity Player changing the setting

execute \
	unless score $seed fetchr.state matches -2147483648.. \
	run tellraw @s { "translate": "fetchr.lobby.card_generation.join_game.error.no_card", "color": "red" }
execute \
	if score $seed fetchr.state matches -2147483648.. \
	if score $game_state fetchr.state matches ..1 \
	run tellraw @s { "translate": "fetchr.lobby.card_generation.join_game.not_ready", "color": "green" }
execute \
	if score $seed fetchr.state matches -2147483648.. \
	if score $game_state fetchr.state matches ..1 \
	run tag @s add fetchr.automatically_join_game
execute \
	if score $allow_spectating fetchr.settings matches 0 \
	if score $game_state fetchr.state matches 3.. \
	run tellraw @s { "translate": "fetchr.lobby.card_generation.join_game.error.in_progress", "color": "red" }
execute \
	if score $allow_spectating fetchr.settings matches 1 \
	if score $game_state fetchr.state matches 3.. \
	run function fetchr:game/join_as_spectator

execute \
	if score $game_state fetchr.state matches 2 \
	at @e[tag=fetchr.spawn] \
	run function fetchr:game/skybox/join_game
