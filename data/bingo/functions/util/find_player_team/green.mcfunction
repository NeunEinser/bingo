#> bingo:util/find_player_team/green
#
# Marks team green as current team
#
# @within function bingo:util/find_player_team

data modify storage bingo:card teams[{id:"bingo:green"}].selected set value true
tag @a[team=bingo.green] add bingo.in_current_team