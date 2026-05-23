#> fetchr:game/skybox/setup_team_display/lime
#
# This function sets the appropiate display for all display objectives for the
# lime score holder
#
# @within function fetchr:skybox/tick

data modify storage tmp.fetchr:skybox team_name set value { "translate": "fetchr.team.lime", "color": "green" }
execute \
	store result score $game/start/skybox/team_name.player_count fetchr.tmp \
	if entity @a[team=fetchr.lime]

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
#data modify storage tmp.fetchr:skybox team_color set value "lime"
#function fetchr:game/skybox/setup_team_display/set_team_name with storage tmp.fetchr:skybox
#NEUN_SCRIPT end

#NEUN_SCRIPT since 69
execute \
	if score $game/start/skybox/team_name.player_count fetchr.tmp matches 1 \
	run data modify storage tmp.fetchr:skybox team_name set value { "selector": "@s", "color": "green" }

scoreboard players display name $lime fetchr.neutral_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $lime fetchr.black_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $lime fetchr.blue_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $lime fetchr.cyan_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $lime fetchr.dark_blue_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $lime fetchr.dark_gray_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $lime fetchr.dark_red_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $lime fetchr.gray_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $lime fetchr.green_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $lime fetchr.light_blue_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $lime fetchr.lime_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true, "bold": true }
scoreboard players display name $lime fetchr.magenta_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $lime fetchr.orange_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $lime fetchr.purple_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $lime fetchr.red_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $lime fetchr.white_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
scoreboard players display name $lime fetchr.yellow_display { "storage": "tmp.fetchr:skybox", "nbt": "team_name", "interpret": true }
#NEUN_SCRIPT end