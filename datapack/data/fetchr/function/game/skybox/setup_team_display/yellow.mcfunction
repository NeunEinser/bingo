#> fetchr:game/skybox/setup_team_display/yellow
#
# This function sets the appropiate display for all display objectives for the
# yellow score holder
#
# @within function fetchr:skybox/tick

data modify storage tmp.fetchr:skybox team_name set value { "translate": "fetchr.team.yellow", "color": "yellow" }
execute \
	store result score $game/start/skybox/team_name.player_count fetchr.tmp \
	if entity @a[team=fetchr.yellow]

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
#data modify storage tmp.fetchr:skybox team_color set value "yellow"
#function fetchr:game/skybox/setup_team_display/set_team_name with storage tmp.fetchr:skybox
#NEUN_SCRIPT end

#NEUN_SCRIPT since 69
execute \
	if score $game/start/skybox/team_name.player_count fetchr.tmp matches 1 \
	run data modify storage tmp.fetchr:skybox team_name set value { "selector": "@s", "color": "yellow" }

scoreboard players display name $yellow fetchr.neutral_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $yellow fetchr.black_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $yellow fetchr.blue_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $yellow fetchr.cyan_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $yellow fetchr.dark_blue_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $yellow fetchr.dark_gray_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $yellow fetchr.dark_red_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $yellow fetchr.gray_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $yellow fetchr.green_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $yellow fetchr.light_blue_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $yellow fetchr.lime_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $yellow fetchr.magenta_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $yellow fetchr.orange_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $yellow fetchr.purple_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $yellow fetchr.red_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $yellow fetchr.white_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $yellow fetchr.yellow_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true, "bold": true }
#NEUN_SCRIPT end