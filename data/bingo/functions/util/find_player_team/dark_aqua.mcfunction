#> bingo:util/find_player_team/dark_aqua
#
# Marks team dark_aqua as current team
#
# @within function bingo:util/find_player_team

data modify storage bingo:card teams[{id:"bingo:dark_aqua"}].selected set value true
tag @a[team=bingo.dark_aqua] add bingo.in_current_team