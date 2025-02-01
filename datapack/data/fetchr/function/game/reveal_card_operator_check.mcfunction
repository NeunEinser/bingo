#> fetchr:game/reveal_card_operator_check
#
#
# This function checks whether strict mode is active and the player clicking is
# a confirmed operator, and the either asks the player to confirm their op
# status or reveals the bingo card
#
# @within function fetchr:tick/player_tick
# @context entity Player changing the setting

scoreboard players reset @s fetchr.reveal_card
scoreboard players enable @s fetchr.reveal_card
execute \
	if score $operator_only fetchr.settings matches 1 \
	unless score @s fetchr.operator matches 1 \
	run function fetchr:util/show_confirm_operator_status_prompt
execute \
	if score $operator_only fetchr.settings matches 1 \
	unless score @s fetchr.operator matches 1 \
	run return 0

function fetchr:game/reveal_card

tellraw @a { "translate": "fetchr.game.menu.options.reveal_card.activated", "with": [{ "selector": "@s" }]}