#> fetchr:preferences/logic
#
# Adapts menu items based on context
#
# @within tag/function fetchr:preferences/main
# @handles #fetchr:preferences/main
# @context entity Player who triggered fetchr.pref
# @reads
# 	storage fetchr:custom_hud components
# 	storage fetchr:custom_hud current_player.components

#NEUN_SCRIPT until 69
#execute \
	if entity @s[tag=!fetchr.enable_manual_gamemode_switch] \
	run data \
		modify \
			storage io.fetchr:preferences \
			menu_options[{ id: "fetchr:spectator_mode" }].title \
		set value '[\
			{ "translate": "fetchr.preferences.spectator_mode.title" },\
			": ",\
			{ "translate": "fetchr.preferences.spectator_mode.enabled" }\
		]'
#execute \
	if entity @s[tag=fetchr.enable_manual_gamemode_switch] \
	run data \
		modify \
			storage io.fetchr:preferences \
			menu_options[{ id: "fetchr:spectator_mode" }].title \
		set value '[\
			{ "translate": "fetchr.preferences.spectator_mode.title" },\
			": ",\
			{ "translate": "fetchr.preferences.spectator_mode.disabled" }\
		]'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 69
execute \
	if entity @s[tag=!fetchr.enable_manual_gamemode_switch] \
	run data \
		modify \
			storage io.fetchr:preferences \
			menu_options[{ id: "fetchr:spectator_mode" }].title \
		set value [\
			{ translate: "fetchr.preferences.spectator_mode.title" },\
			": ",\
			{ translate: "fetchr.preferences.spectator_mode.enabled" }\
		]
execute \
	if entity @s[tag=fetchr.enable_manual_gamemode_switch] \
	run data \
		modify \
			storage io.fetchr:preferences \
			menu_options[{ id: "fetchr:spectator_mode" }].title \
		set value [\
			{ translate: "fetchr.preferences.spectator_mode.title" },\
			": ",\
			{ translate: "fetchr.preferences.spectator_mode.disabled" }\
		]
#NEUN_SCRIPT end