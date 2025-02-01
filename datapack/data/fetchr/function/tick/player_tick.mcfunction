#> fetchr:tick/player_tick
#
# This function is called for every player
#
# @within function fetchr:tick/tick
# @context entity Player

#>
# @within function fetchr:tick/*
#declare storage tmp.fetchr:tick
execute \
	in minecraft:overworld \
	run teleport @s[tag=fetchr.resourcepack_check, predicate=!fetchr:is_in_overworld] 1 1 1 0 0

#region check player position change
execute \
	as @e[type=minecraft:marker, x=0.5, y=0, z=0.5, distance=..0.1, tag=fetchr.pos_reader, limit=1] \
	run function fetchr:tick/tp_pos_marker
#>
# The x coordinate of the current player
#
# @internal
#declare score_holder $tick/player.x
execute \
	store result score $tick/player.x fetchr.tmp \
	run data get storage tmp.fetchr:tick posReader.Pos[0]

#>
# The x coordinate of the current player
#
# @internal
#declare score_holder $tick/player.y
execute \
	store result score $tick/player.y fetchr.tmp \
	run data get storage tmp.fetchr:tick posReader.Pos[1]

#>
# The z coordinate of the current player
#
# @internal
#declare score_holder $tick/player.z
execute \
	store result score $tick/player.z fetchr.tmp \
	run data get storage tmp.fetchr:tick posReader.Pos[2]

#>
# The rotation of the player for the compass icon in a resolution of 32 possible
# values
#
# @internal
#declare score_holder $tick/player.rot
# Rotation / 5.625 (divides the 360 possible values into 192)
execute \
	store result score $tick/player.rot fetchr.tmp \
	run data get storage tmp.fetchr:tick posReader.Rotation[0] 0.53333333333333333333333333333333
# Divide by 2 and ceil to next integer
scoreboard players add $tick/player.rot fetchr.tmp 1
scoreboard players operation $tick/player.rot fetchr.tmp /= 2 fetchr.const
scoreboard players operation $tick/player.rot fetchr.tmp %= 96 fetchr.const

tag @s add fetchr.position_changed
execute \
	if score @s fetchr.prev_x_pos = $tick/player.x fetchr.tmp \
	if score @s fetchr.prev_y_pos = $tick/player.y fetchr.tmp \
	if score @s fetchr.prev_z_pos = $tick/player.z fetchr.tmp \
	if score @s fetchr.prev_rot = $tick/player.rot fetchr.tmp \
	run tag @s remove fetchr.position_changed
#endregion

#region resourcepack check
# Auto-validate if Singleplayer
#NEUN_SCRIPT unless realms
#execute \
	if score $is_multiplayer fetchr.state matches 0 \
	run scoreboard players \
		set @s[tag=fetchr.resourcepack_check] fetchr.resource_pack_check \
		{NEUN_SCRIPT:rp_version * 91}
execute \
	if score $is_multiplayer fetchr.state matches 0 \
	run tellraw @s[tag=fetchr.resourcepack_check] "\
		\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\
		\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\
		\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\
	"
#NEUN_SCRIPT end
#NEUN_SCRIPT remove 1
execute \
	if score $is_multiplayer fetchr.state matches 0 \
	run scoreboard players set @s[tag=fetchr.resourcepack_check] fetchr.resource_pack_check 91

# Send Resource pack check chat message
# Uses fallback messages to check for the resource pack

#NEUN_SCRIPT unless realms
#tellraw @s[scores={fetchr.resource_pack_check=1}] [\
	"\n\n\n\n\n",\
	{\
		"translate": "fetchr.technical.resourcepack_version_{NEUN_SCRIPT:rp_version}",\
		"fallback": "%2$s",\
		"with": [\
			[\
				"",\
				{ "translate": "fetchr.resourcepack_check.go_to_lobby.part1", "color": "green" },\
				"\n",\
				{\
					"translate": "fetchr.resourcepack_check.go_to_lobby.part2",\
					"with": [\
						{\
							"translate": "fetchr.resourcepack_check.go_to_lobby.click",\
							"color": "#00c3ff",\
							"clickEvent": {\
								"action": "run_command",\
								"value": "/trigger fetchr.resource_pack_check set {NEUN_SCRIPT:rp_version * 91}"\
							},\
							"click_event": {\
								"action": "run_command",\
								"command": "trigger fetchr.resource_pack_check set {NEUN_SCRIPT:rp_version * 91}"\
							}\
						}\
					]\
				}\
			],\
			[\
				"",\
				{\
					"translate": "fetchr.resourcepack_check.wrong_version.title",\
					"fallback": "%s",\
					"with": [\
						{\
							"translate": "bingo.resourcepack_check.wrong_version.title",\
							"fallback": "The resourcepack is currently not enabled."\
						}\
					],\
					"color": "red"\
				},\
				"\n",\
				{\
					"translate": "fetchr.resourcepack_check.wrong_version.description",\
					"fallback": "%2$s",\
					"with": [\
						{\
							"translate": "fetchr.resourcepack_check.wrong_version.link",\
							"color": "#00c3ff",\
							"clickEvent": {\
								"action": "open_url",\
								"value": "\
									https://github.com/NeunEinser/bingo/releases/download/\
									{NEUN_SCRIPT:version}/Fetchr-{NEUN_SCRIPT:version}-resourcepack.zip\
								"\
							},\
							"click_event": {\
								"action": "open_url",\
								"url": "\
									https://github.com/NeunEinser/bingo/releases/download/\
									{NEUN_SCRIPT:version}/Fetchr-{NEUN_SCRIPT:version}-resourcepack.zip\
								"\
							}\
						},\
						{\
							"translate": "bingo.resourcepack_check.wrong_version.description",\
							"fallback": "\
								If there is a server resource pack in place, enable it and wait\
								until the Mojang loading screen is done.\n\nOtherwise, please download\
								the Resourcepack %s and enable it.\
							",\
							"with": [\
								{\
									"translate": "bingo.resourcepack_check.wrong_version.link",\
									"fallback": "here",\
									"color": "#00c3ff",\
									"clickEvent": {\
										"action": "open_url",\
										"value": "\
											https://github.com/NeunEinser/bingo/releases/download/\
											{NEUN_SCRIPT:version}/Fetchr-{NEUN_SCRIPT:version}-resourcepack.zip\
										"\
									},\
									"click_event": {\
										"action": "open_url",\
										"url": "\
											https://github.com/NeunEinser/bingo/releases/download/\
											{NEUN_SCRIPT:version}/Fetchr-{NEUN_SCRIPT:version}-resourcepack.zip\
										"\
									}\
								}\
							]\
						}\
					]\
				},\
				"\n\n",\
				{\
					"translate": "fetchr.resourcepack_check.wrong_version.server",\
					"fallback": "%s",\
					"with": [\
						{\
							"translate": "bingo.resourcepack_check.wrong_version.server",\
							"fallback": "Then click “re-check” down below."\
						}\
					]\
				},\
				"\n\n[ ",\
				{\
					"translate": "fetchr.resourcepack_check.wrong_version.recheck",\
					"fallback": "Re-check",\
					"color": "#00c3ff",\
					"clickEvent": { "action": "run_command", "value": "/trigger fetchr.resource_pack_check" },\
					"click_event": { "action": "run_command", "command": "trigger fetchr.resource_pack_check" }\
				},\
				" ]"\
			]\
		]\
	}\
]
#NEUN_SCRIPT end

#NEUN_SCRIPT remove 1
tellraw @s[scores={fetchr.resource_pack_check=1}] [\
	"\n\n\n\n\n",\
	{\
		"translate": "fetchr.resourcepack_check.go_to_lobby.part1",\
		"color": "green",\
		"fallback": "%s",\
		"with": [\
			[\
				{ "text": "", "color": "white" },\
				{ "text": "The resourcepack is currently not enabled.", "color": "red" },\
				"\
					\nThis is not a release version, thus no resource pack download can be \
					provided. You can get the resource pack from the branch as well, just \
					like you did with the data pack.\n\nIf you want to play the release version, \
					please follow the instructions on \
				",\
				{\
					"text": "this page",\
					"color": "#00c3ff",\
					"clickEvent": { "action": "open_url", "value": "https://github.com/NeunEinser/bingo/releases" },\
					"click_event": { "action": "open_url", "url": "https://github.com/NeunEinser/bingo/releases" }\
				},\
				"."\
			]\
		]\
	},\
	"\n",\
	{\
		"translate": "fetchr.resourcepack_check.go_to_lobby.part2",\
		"fallback": "",\
		"with": [\
			{\
				"translate": "fetchr.resourcepack_check.go_to_lobby.click",\
				"color": "#00c3ff",\
				"clickEvent": { "action": "run_command", "value": "/trigger fetchr.resource_pack_check set 91" },\
				"click_event": { "action": "run_command", "command": "trigger fetchr.resource_pack_check set 91" }\
			}\
		]\
	}\
]

# Validate checked players, reenable trigger
#NEUN_SCRIPT unless realms
#tag @s[scores={fetchr.resource_pack_check={ NEUN_SCRIPT:rp_version * 91}}] remove fetchr.resourcepack_check
#execute \
	if score @s fetchr.resource_pack_check matches {NEUN_SCRIPT:rp_version * 91} \
	run function fetchr:util/go_to_lobby
scoreboard players enable @a[tag=fetchr.resourcepack_check] fetchr.resource_pack_check
scoreboard players set @s[scores={fetchr.resource_pack_check=1}] fetchr.resource_pack_check 0
#NEUN_SCRIPT end
#NEUN_SCRIPT remove 2
tag @s[scores={fetchr.resource_pack_check=91}] remove fetchr.resourcepack_check
execute \
	if score @s fetchr.resource_pack_check matches 91 \
	run function fetchr:util/go_to_lobby
#endregion

# Assign each player a unique ID
execute \
	if score @s fetchr.reconnect matches 1.. \
	run function #fetchr:player_reconnect
execute \
	unless score @s fetchr.player_id matches -2147483648.. \
	run function #fetchr:new_player

# custom hud
execute \
	if entity @s[predicate=!fetchr:is_in_overworld] \
	in fetchr:lobby \
	run function fetchr:custom_hud/tick
execute \
	if entity @s[scores={fetchr.reveal_card=1}] \
	in fetchr:lobby \
	run function fetchr:game/reveal_card_operator_check

# End
execute \
	if entity @s[scores={fetchr.lobby=1}] \
	run function fetchr:util/go_to_lobby

scoreboard players operation @s fetchr.prev_x_pos = $tick/player.x fetchr.tmp
scoreboard players operation @s fetchr.prev_y_pos = $tick/player.y fetchr.tmp
scoreboard players operation @s fetchr.prev_z_pos = $tick/player.z fetchr.tmp
scoreboard players operation @s fetchr.prev_rot = $tick/player.rot fetchr.tmp
