#> bingo:util/find_player_team/gray
#
# Marks team gray as current team
#
# @within function bingo:util/find_player_team

data modify storage bingo:card teams[{id:"bingo:gray"}].selected set value true
tag @a[team=bingo.gray] add bingo.in_current_team