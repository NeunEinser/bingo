#> fetchr:game/skybox/setup_team_display/dark_red
#
# This function sets the appropiate display for all display objectives for the
# dark_red score holder
#
# @within function fetchr:skybox/tick

data modify storage tmp.fetchr:skybox team_name set value { "translate": "fetchr.team.dark_red", "color": "dark_red" }
execute \
	store result score $game/start/skybox/team_name.player_count fetchr.tmp \
	if entity @a[team=fetchr.dark_red]

#NEUN_SCRIPT until 69
#execute \
	if score $game/start/skybox/team_name.player_count fetchr.tmp matches 1 \
	run function fetchr:game/skybox/setup_team_display/set_player_name
#execute \
	in fetchr:lobby \
	run data \
		modify block 7 0 7 front_text.messages[0] \
		set value '{ "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }'
#execute \
	in fetchr:lobby \
	run data \
		modify storage tmp.fetchr:skybox team_name \
		set from block 7 0 7 front_text.messages[0]
#data modify storage tmp.fetchr:skybox team_color set value "dark_red"
#function fetchr:game/skybox/setup_team_display/set_team_name with storage tmp.fetchr:skybox
#NEUN_SCRIPT end

#NEUN_SCRIPT since 69
execute \
	if score $game/start/skybox/team_name.player_count fetchr.tmp matches 1 \
	run data modify storage tmp.fetchr:skybox team_name set value { "selector": "@s", "color": "dark_red" }

scoreboard players display name $dark_red fetchr.neutral_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $dark_red fetchr.black_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $dark_red fetchr.blue_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $dark_red fetchr.cyan_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $dark_red fetchr.dark_blue_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $dark_red fetchr.dark_gray_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $dark_red fetchr.dark_red_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true, "bold": true }
scoreboard players display name $dark_red fetchr.gray_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $dark_red fetchr.green_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $dark_red fetchr.light_blue_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $dark_red fetchr.lime_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $dark_red fetchr.magenta_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $dark_red fetchr.orange_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $dark_red fetchr.purple_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $dark_red fetchr.red_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $dark_red fetchr.white_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $dark_red fetchr.yellow_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
#NEUN_SCRIPT end