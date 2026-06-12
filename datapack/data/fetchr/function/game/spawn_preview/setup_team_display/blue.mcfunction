#> fetchr:game/spawn_preview/setup_team_display/blue
#
# This function sets the appropiate display for all display objectives for the
# blue score holder
#
# @within function fetchr:spawn_preview/tick

data modify storage tmp.fetchr:spawn_preview team_name set value { "translate": "fetchr.team.blue", "color": "blue" }
execute \
	store result score $spawn_preview/team_name.player_count fetchr.tmp \
	if entity @a[team=fetchr.blue]

#NEUN_SCRIPT until 69
#execute \
	if score $spawn_preview/team_name.player_count fetchr.tmp matches 1 \
	run function fetchr:game/spawn_preview/setup_team_display/set_player_name
#execute \
	in fetchr:lobby \
	run data \
		modify block 7 0 7 front_text.messages[0] \
		set value '{ "storage": "tmp.fetchr:spawn_preview", "nbt": "team_name", "interpret": true }'
#execute \
	in fetchr:lobby \
	run data \
		modify storage tmp.fetchr:spawn_preview team_name \
		set from block 7 0 7 front_text.messages[0]
#data modify storage tmp.fetchr:spawn_preview team_color set value "blue"
#function fetchr:game/spawn_preview/setup_team_display/set_team_name with storage tmp.fetchr:spawn_preview
#NEUN_SCRIPT end

#NEUN_SCRIPT since 69
execute \
	if score $spawn_preview/team_name.player_count fetchr.tmp matches 1 \
	run data modify storage tmp.fetchr:spawn_preview team_name set value { "selector": "@s", "color": "blue" }

scoreboard players display name $blue fetchr.neutral_display { "storage": "tmp.fetchr:spawn_preview", "nbt": "team_name", "interpret": true }
scoreboard players display name $blue fetchr.black_display { "storage": "tmp.fetchr:spawn_preview", "nbt": "team_name", "interpret": true }
scoreboard players display name $blue fetchr.blue_display { "storage": "tmp.fetchr:spawn_preview", "nbt": "team_name", "interpret": true, "bold": true }
scoreboard players display name $blue fetchr.cyan_display { "storage": "tmp.fetchr:spawn_preview", "nbt": "team_name", "interpret": true }
scoreboard players display name $blue fetchr.dark_blue_display { "storage": "tmp.fetchr:spawn_preview", "nbt": "team_name", "interpret": true }
scoreboard players display name $blue fetchr.dark_gray_display { "storage": "tmp.fetchr:spawn_preview", "nbt": "team_name", "interpret": true }
scoreboard players display name $blue fetchr.dark_red_display { "storage": "tmp.fetchr:spawn_preview", "nbt": "team_name", "interpret": true }
scoreboard players display name $blue fetchr.gray_display { "storage": "tmp.fetchr:spawn_preview", "nbt": "team_name", "interpret": true }
scoreboard players display name $blue fetchr.green_display { "storage": "tmp.fetchr:spawn_preview", "nbt": "team_name", "interpret": true }
scoreboard players display name $blue fetchr.light_blue_display { "storage": "tmp.fetchr:spawn_preview", "nbt": "team_name", "interpret": true }
scoreboard players display name $blue fetchr.lime_display { "storage": "tmp.fetchr:spawn_preview", "nbt": "team_name", "interpret": true }
scoreboard players display name $blue fetchr.magenta_display { "storage": "tmp.fetchr:spawn_preview", "nbt": "team_name", "interpret": true }
scoreboard players display name $blue fetchr.orange_display { "storage": "tmp.fetchr:spawn_preview", "nbt": "team_name", "interpret": true }
scoreboard players display name $blue fetchr.purple_display { "storage": "tmp.fetchr:spawn_preview", "nbt": "team_name", "interpret": true }
scoreboard players display name $blue fetchr.red_display { "storage": "tmp.fetchr:spawn_preview", "nbt": "team_name", "interpret": true }
scoreboard players display name $blue fetchr.white_display { "storage": "tmp.fetchr:spawn_preview", "nbt": "team_name", "interpret": true }
scoreboard players display name $blue fetchr.yellow_display { "storage": "tmp.fetchr:spawn_preview", "nbt": "team_name", "interpret": true }
#NEUN_SCRIPT end