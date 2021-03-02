#> bingo:util/find_player_team/gold
#
# Marks team gold as current team
#
# @within function bingo:util/find_player_team

data modify storage bingo:card teams[{id:"bingo:gold"}].selected set value true
tag @a[team=bingo.gold] add bingo.in_current_team