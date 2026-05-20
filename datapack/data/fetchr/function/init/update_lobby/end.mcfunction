#> fetchr:init/update_lobby/end
#
# Called after the lobby is fully updated to clean things up
#
# @within
#	function fetchr:init/update_lobby/move_clone

execute \
	in fetchr:lobby \
	as @e[type=minecraft:marker,tag=fetchr.lobby_sign] \
	at @s \
	store result score @s fetchr.tmp \
	if entity @e[type=minecraft:marker,tag=fetchr.lobby_sign,distance=...1]
execute \
	in fetchr:lobby \
	as @e[type=minecraft:marker,tag=fetchr.card_frame_start] \
	at @s \
	store result score @s fetchr.tmp \
	if entity @e[type=minecraft:marker,tag=fetchr.card_frame_start,distance=...1]

execute \
	in fetchr:lobby \
	if entity @e[type=minecraft:marker,x=0,scores={fetchr.tmp=2..}] \
	run tellraw @a {\
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

data \
	modify storage fetchr:structure structures \
	set from storage tmp.fetchr:init/update_lobby new_structures

# This will place all required entities and spawn a new reference
execute \
	positioned 7 3 7 \
	run function fetchr:init/setup_lobby/end

execute \
	as @a[predicate=fetchr:is_in_game] \
	run function fetchr:util/go_to_lobby