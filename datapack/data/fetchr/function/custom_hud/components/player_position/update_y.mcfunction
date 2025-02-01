#> fetchr:custom_hud/components/player_position/update_y
#
# Updates the component for the y position
#
# @within function fetchr:custom_hud/components/player_position/*
# @context entity Player whose hud is currently being updated

data \
	modify storage io.fetchr:custom_hud component \
	set from storage fetchr:custom_hud currentPlayer.components[{ id: "fetchr:y_position" }]
#NEUN_SCRIPT until 65
#data \
	modify storage io.fetchr:custom_hud component \
	merge value {\
		textComponent: '[\
			"Y: ",\
			{ "score": { "name": "$custom_hud/player_pos.y", "objective": "fetchr.tmp" }}\
		]',\
		changed: true\
	}
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
data \
	modify storage io.fetchr:custom_hud component \
	merge value {\
		textComponent: [\
			"Y: ",\
			{ score: { name: "$custom_hud/player_pos.y", objective: "fetchr.tmp" }}\
		],\
		changed: true\
	}
#NEUN_SCRIPT end

scoreboard players set $custom_hud/width.padding fetchr.io 79
scoreboard players operation $custom_hud/width.number fetchr.io = $custom_hud/player_pos.y fetchr.tmp
function fetchr:custom_hud/subtract_width
function fetchr:custom_hud/component_eval
data \
	modify storage fetchr:custom_hud currentPlayer.components[{ id: "fetchr:y_position" }] \
	set from storage io.fetchr:custom_hud component