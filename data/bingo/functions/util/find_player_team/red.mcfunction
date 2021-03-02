#> bingo:util/find_player_team/red
#
# Marks team red as current team
#
# @within function bingo:util/find_player_team

data modify storage bingo:card teams[{id:"bingo:red"}].selected set value true
tag @a[team=bingo.red] add bingo.in_current_team