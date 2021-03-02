#> bingo:util/find_player_team/aqua
#
# Marks team aqua as current team
#
# @within function bingo:util/find_player_team

data modify storage bingo:card teams[{id:"bingo:aqua"}].selected set value true
tag @a[team=bingo.aqua] add bingo.in_current_team