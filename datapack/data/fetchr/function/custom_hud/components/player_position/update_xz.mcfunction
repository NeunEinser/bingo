#> fetchr:custom_hud/components/player_position/update_xz
#
# Updates the component for the player position
#
# @within function fetchr:custom_hud/components/player_position/*
# @context entity Player whose hud is currently being updated
scoreboard players set $custom_hud/width.padding fetchr.io 73
data \
	modify storage io.fetchr:custom_hud component \
	set from storage fetchr:custom_hud currentPlayer.components[{ id: "fetchr:player_position" }]

#NEUN_SCRIPT until 65
#data \
	modify storage io.fetchr:custom_hud component \
	merge value {\
		textComponent: '[\
			{ "score": { "name": "$custom_hud/player_pos.x", "objective": "fetchr.tmp" }},\
			" ",\
			{ "score": { "name": "$custom_hud/player_pos.z", "objective": "fetchr.tmp" }}\
		]',\
		changed: true\
	}
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
data \
	modify storage io.fetchr:custom_hud component \
	merge value {\
		textComponent: [\
			{ score: { name: "$custom_hud/player_pos.x", objective: "fetchr.tmp" }},\
			" ",\
			{ score: { name: "$custom_hud/player_pos.z", objective: "fetchr.tmp" }}\
		],\
		changed: true\
	}
#NEUN_SCRIPT end

execute \
	if \
		data storage fetchr:custom_hud \
		currentPlayer.components[{ id: "fetchr:player_position" }].custom.fetchr{ iconType: "compass" } \
		run function fetchr:custom_hud/components/player_position/update_xz/set_compass_icon
execute \
	unless \
		data storage fetchr:custom_hud \
		currentPlayer.components[{ id: "fetchr:player_position" }].custom.fetchr{ iconType: "compass" } \
		run function fetchr:custom_hud/components/player_position/update_xz/set_compass_text


execute \
	if \
		data storage fetchr:custom_hud \
		currentPlayer\
		.components[{ id: "fetchr:player_position" }]\
		.custom\
		.fetchr{ chunkCoordinatesOnTreasureMap: true } \
	if entity @s[predicate=fetchr:holding_treasure_map] \
	run function fetchr:custom_hud/components/player_position/update_xz/adjust_for_treasure_map

scoreboard players operation $custom_hud/width.number fetchr.io = $custom_hud/player_pos.x fetchr.tmp
function fetchr:custom_hud/subtract_width

scoreboard players operation $custom_hud/width.number fetchr.io = $custom_hud/player_pos.z fetchr.tmp
function fetchr:custom_hud/subtract_width

execute \
	if score $custom_hud/width.padding fetchr.io matches ..-1 \
	run function fetchr:custom_hud/components/player_position/update_xz/shorten

function fetchr:custom_hud/component_eval

data modify storage fetchr:custom_hud currentPlayer.components[{ id: "fetchr:player_position" }] merge from storage io.fetchr:custom_hud component