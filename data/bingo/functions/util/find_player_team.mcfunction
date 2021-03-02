#> bingo:util/find_player_team
#
# Marks the current player's team in the bingo:card storage and adds the tag
# bingo.in_current_team to all teammates.
#
# This is used to be able to read or modify the current player's team's progress
# and to be able to announce reaching a goal with all members of a certain team.
#
# @internal
# @context entity Player who's team should be selected as the current team
# @output tag bingo.in_currennt_team

#>
# A member of the currently selected team.
# Used as output by bingo:util/find_player_team.
# May only be set by that function.
# @internal
#declare tag bingo.in_current_team

execute if entity @s[team=bingo.aqua] run function bingo:util/find_player_team/aqua
execute if entity @s[team=bingo.black] run function bingo:util/find_player_team/black
execute if entity @s[team=bingo.blue] run function bingo:util/find_player_team/blue
execute if entity @s[team=bingo.dark_aqua] run function bingo:util/find_player_team/dark_aqua
execute if entity @s[team=bingo.dark_blue] run function bingo:util/find_player_team/dark_blue
execute if entity @s[team=bingo.dark_gray] run function bingo:util/find_player_team/dark_gray
execute if entity @s[team=bingo.dark_green] run function bingo:util/find_player_team/dark_green
execute if entity @s[team=bingo.dark_purpl] run function bingo:util/find_player_team/dark_purple
execute if entity @s[team=bingo.dark_red] run function bingo:util/find_player_team/dark_red
execute if entity @s[team=bingo.gold] run function bingo:util/find_player_team/gold
execute if entity @s[team=bingo.gray] run function bingo:util/find_player_team/gray
execute if entity @s[team=bingo.green] run function bingo:util/find_player_team/green
execute if entity @s[team=bingo.light_purp] run function bingo:util/find_player_team/light_purple
execute if entity @s[team=bingo.red] run function bingo:util/find_player_team/red
execute if entity @s[team=bingo.white] run function bingo:util/find_player_team/white
execute if entity @s[team=bingo.yellow] run function bingo:util/find_player_team/yellow