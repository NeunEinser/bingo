#> fetchr:lobby/settings/toggle_gamemode
#
# This function checks whether strict mode is active and the player clicking is
# a confirmed operator, and the either asks the player to confirm their op
# status or toggles the lobby gamemode setting
#
# @user
# @context entity Player changing the setting

scoreboard players set @s fetchr.operator_check_callback_action 11
execute \
	unless score @s fetchr.operator matches 1 \
	run function fetchr:util/show_confirm_operator_status_prompt
execute \
	unless score @s fetchr.operator matches 1 \
	run return 0

scoreboard players add $lobby_gamemode fetchr.setting_values 1
execute \
	if score $lobby_gamemode fetchr.setting_values matches 2 \
	run scoreboard players set $lobby_gamemode fetchr.setting_values 0

execute \
	if score $lobby_gamemode fetchr.setting_values matches 0 \
	run tellraw @s { "translate": "fetchr.settings.gamemode.confirmation.toggle_adventure", "color": "green" }
execute \
	if score $lobby_gamemode fetchr.setting_values matches 1 \
	run tellraw @s { "translate": "fetchr.settings.gamemode.confirmation.toggle_survival", "color": "red" }

function fetchr:lobby/settings/update_gamemode_sign_string
function fetchr:lobby/place_indestructible_blocks