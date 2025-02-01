#> fetchr:custom_hud/components/player_position/update_xz/adjust_for_treasure_map
#
# This function switches the display to chunk coordinates when hodling a
# treasure map if that setting is active.
#
# @within function fetchr:custom_hud/components/player_position/update_xz
# @context entity Player whose hud is currently being updated

scoreboard players operation $custom_hud/player_pos.x fetchr.tmp %= 16 fetchr.const
scoreboard players operation $custom_hud/player_pos.z fetchr.tmp %= 16 fetchr.const

#NEUN_SCRIPT until 65
#data \
	modify storage io.fetchr:custom_hud component.textComponent set value '[\
	{\
		"score": { "name": "$custom_hud/player_pos.x", "objective": "fetchr.tmp" },\
		"color": "yellow"\
	},\
	" ",\
	{ "score": { "name": "$custom_hud/player_pos.z", "objective": "fetchr.tmp" }}\
]'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
data \
	modify storage io.fetchr:custom_hud component.textComponent set value [\
	{\
		score: { name: "$custom_hud/player_pos.x", objective: "fetchr.tmp" },\
		color: "yellow"\
	},\
	" ",\
	{ score: { name: "$custom_hud/player_pos.z", objective: "fetchr.tmp" }}\
]
#NEUN_SCRIPT end
