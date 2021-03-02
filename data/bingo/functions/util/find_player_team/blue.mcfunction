#> bingo:util/find_player_team/blue
#
# Marks team blue as current team
#
# @within function bingo:util/find_player_team

data modify storage bingo:card teams[{id:"bingo:blue"}].selected set value true
tag @a[team=bingo.blue] add bingo.in_current_team