#> fetchr:lobby/settings/update_gamemode_sign_string
#
# Updates the lobby gamemode sign 
#
# @internal

#NEUN_SCRIPT until 69
#execute \
	if score $lobby_gamemode fetchr.setting_values matches 0 \
	run data \
		modify storage fetchr:settings lobby_gamemode \
		set value '{ "translate": "fetchr.settings.gamemode.value.adventure", "color": "gray" }'
#execute \
	if score $lobby_gamemode fetchr.setting_values matches 1 \
	run data \
		modify storage fetchr:settings lobby_gamemode \
		set value '{ "translate": "fetchr.settings.gamemode.value.survival", "color": "red" }'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 69
execute \
	if score $lobby_gamemode fetchr.setting_values matches 0 \
	run data \
		modify storage fetchr:settings lobby_gamemode \
		set value { translate: "fetchr.settings.gamemode.value.adventure", color: "gray" }
execute \
	if score $lobby_gamemode fetchr.setting_values matches 1 \
	run data \
		modify storage fetchr:settings lobby_gamemode \
		set value { translate: "fetchr.settings.gamemode.value.survival", color: "red" }
#NEUN_SCRIPT end