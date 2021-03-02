#> bingo:util/find_player_team/yellow
#
# Marks team yellow as current team
#
# @within function bingo:util/find_player_team

data modify storage bingo:card teams[{id:"bingo:yellow"}].selected set value true
tag @a[team=bingo.yellow] add bingo.in_current_team