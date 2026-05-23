#> fetchr:game/skybox/setup_team_display/set_team_name
#
# Sets the team name
#
# @within function fetchr:game/skybox/setup_team_display/*
# @params
# 	team_name: #[text_component] string
# 	team_color: #[team_color] string

#NEUN_SCRIPT until 69
#$scoreboard players display name $$(team_color) fetchr.neutral_display $(team_name)
#$scoreboard players display name $$(team_color) fetchr.black_display $(team_name)
#$scoreboard players display name $$(team_color) fetchr.blue_display $(team_name)
#$scoreboard players display name $$(team_color) fetchr.cyan_display $(team_name)
#$scoreboard players display name $$(team_color) fetchr.dark_blue_display $(team_name)
#$scoreboard players display name $$(team_color) fetchr.dark_gray_display $(team_name)
#$scoreboard players display name $$(team_color) fetchr.dark_red_display $(team_name)
#$scoreboard players display name $$(team_color) fetchr.gray_display $(team_name)
#$scoreboard players display name $$(team_color) fetchr.green_display $(team_name)
#$scoreboard players display name $$(team_color) fetchr.light_blue_display $(team_name)
#$scoreboard players display name $$(team_color) fetchr.lime_display $(team_name)
#$scoreboard players display name $$(team_color) fetchr.magenta_display $(team_name)
#$scoreboard players display name $$(team_color) fetchr.orange_display $(team_name)
#$scoreboard players display name $$(team_color) fetchr.purple_display $(team_name)
#$scoreboard players display name $$(team_color) fetchr.red_display $(team_name)
#$scoreboard players display name $$(team_color) fetchr.white_display $(team_name)
#$scoreboard players display name $$(team_color) fetchr.yellow_display $(team_name)

#$scoreboard players display name $$(team_color) fetchr.$(team_color)_display [{ "text": "", "bold": true },$(team_name)]
#NEUN_SCRIPT end