#> bingo:util/find_player_team/dark_blue
#
# Marks team dark_blue as current team
#
# @within function bingo:util/find_player_team

data modify storage bingo:card teams[{id:"bingo:dark_blue"}].selected set value true
tag @a[team=bingo.dark_blue] add bingo.in_current_team