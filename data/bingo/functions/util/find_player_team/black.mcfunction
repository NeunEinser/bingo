#> bingo:util/find_player_team/black
#
# Marks team aqua as current team
#
# @within function bingo:util/find_player_team

data modify storage bingo:card teams[{id:"bingo:black"}].selected set value true
tag @a[team=bingo.black] add bingo.in_current_team