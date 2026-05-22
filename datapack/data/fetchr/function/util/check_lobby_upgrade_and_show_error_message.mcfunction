#> fetchr:util/check_lobby_upgrade_and_show_error_message
#
# Checks if there are duplicate entities in the lobby, and shows an error
# message if so.
#
# @context
# 	dimension Lobby
# 	entity The player to display the error message to.

execute \
	as @e[type=minecraft:marker,tag=fetchr.lobby_sign] \
	at @s \
	store result score @s fetchr.tmp \
	if entity @e[type=minecraft:marker,tag=fetchr.lobby_sign,distance=...1]
execute \
	as @e[type=minecraft:marker,tag=fetchr.card_frame_start] \
	at @s \
	store result score @s fetchr.tmp \
	if entity @e[type=minecraft:marker,tag=fetchr.card_frame_start,distance=...1]

execute \
	if entity @e[type=minecraft:marker,x=0,scores={fetchr.tmp=2..}] \
	run tellraw @s {\
		"translate": "fetchr.error.lobby_update.duplicated_entities",\
		"color": "red",\
		"fallback": "Something went wrong during your lobby upgrade. If you have a \
			backup of your world from before the upgrade, please send it to \
			NeunEinser over on %s or %s.",\
		"with": [\
			{\
				"text": "Discord",\
				"color": "#00c3ff",\
				"click_event": { "action": "open_url", "url": "https://discord.gg/9f6E3AxGA8" },\
				"clickEvent": { "action": "open_url", "value": "https://discord.gg/9f6E3AxGA8" }\
			},\
			{\
				"text": "Github",\
				"color": "#00c3ff",\
				"click_event": { "action": "open_url", "url": "https://github.com/NeunEinser/bingo/issues/304" },\
				"clickEvent": { "action": "open_url", "value": "https://github.com/NeunEinser/bingo/issues/304" }\
			}\
		]\
	}
scoreboard players reset @e[type=minecraft:marker,x=0] fetchr.tmp