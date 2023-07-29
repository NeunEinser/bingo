#> fetchr:util/find_player_team
#
# Marks the current player's team in the fetchr:card storage and adds the tag
# fetchr.in_current_team to all teammates.
#
# Furthermore, the team in path fetchr:card teams will be sorted to the end and
# you can read and write the selected team's preogress using storage fetchr:card
# teams[-1]
#
# This is used to be able to read or modify the current player's team's progress
# and to be able to announce reaching a goal with all members of a certain team.
#
# @internal
# @context entity Player who's team should be selected as the current team
# @output
# 	tag fetchr.in_current_team
# 	storage fetchr:card teams[-1]

#>
# A member of the currently selected team.
# Used as output by fetchr:util/find_player_team.
# May only be set by that function.
# @internal
#declare tag fetchr.in_current_team

#>
# @within fetchr:util/find_player_team/*
#declare storage tmp.fetchr:find_team

tag @a remove fetchr.in_current_team

execute if entity @s[team=fetchr.light_blue] run function fetchr:util/find_player_team/light_blue
execute if entity @s[team=fetchr.black] run function fetchr:util/find_player_team/black
execute if entity @s[team=fetchr.blue] run function fetchr:util/find_player_team/blue
execute if entity @s[team=fetchr.cyan] run function fetchr:util/find_player_team/cyan
execute if entity @s[team=fetchr.dark_blue] run function fetchr:util/find_player_team/dark_blue
execute if entity @s[team=fetchr.dark_gray] run function fetchr:util/find_player_team/dark_gray
execute if entity @s[team=fetchr.green] run function fetchr:util/find_player_team/green
execute if entity @s[team=fetchr.purple] run function fetchr:util/find_player_team/purple
execute if entity @s[team=fetchr.dark_red] run function fetchr:util/find_player_team/dark_red
execute if entity @s[team=fetchr.orange] run function fetchr:util/find_player_team/orange
execute if entity @s[team=fetchr.gray] run function fetchr:util/find_player_team/gray
execute if entity @s[team=fetchr.lime] run function fetchr:util/find_player_team/lime
execute if entity @s[team=fetchr.magenta] run function fetchr:util/find_player_team/magenta
execute if entity @s[team=fetchr.red] run function fetchr:util/find_player_team/red
execute if entity @s[team=fetchr.white] run function fetchr:util/find_player_team/white
execute if entity @s[team=fetchr.yellow] run function fetchr:util/find_player_team/yellow