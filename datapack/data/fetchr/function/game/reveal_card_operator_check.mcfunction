#> fetchr:game/reveal_card_operator_check
#
#
# This function checks whether strict mode is active and the player clicking is
# a confirmed operator, and the either asks the player to confirm their op
# status or reveals the bingo card
#
# @within function fetchr:tick/player_tick
# @context entity Player changing the setting

scoreboard players set @s fetchr.operator_check_callback_action 14
scoreboard players reset @s fetchr.reveal_card
scoreboard players enable @s fetchr.reveal_card
execute \
	if score $operator_only fetchr.setting_values matches 1 \
	unless score @s fetchr.operator matches 1 \
	run function fetchr:util/show_confirm_operator_status_prompt
execute \
	if score $operator_only fetchr.setting_values matches 1 \
	unless score @s fetchr.operator matches 1 \
	run return 0
#NEUN_SCRIPT since 77
dialog clear @s
#NEUN_SCRIPT end
function fetchr:game/reveal_card

tellraw @a { "translate": "fetchr.game.menu.options.reveal_card.activated", "with": [{ "selector": "@s" }]}