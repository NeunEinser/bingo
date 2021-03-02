#> bingo:util/find_player_team/white
#
# Marks team white as current team
#
# @within function bingo:util/find_player_team

data modify storage bingo:card teams[{id:"bingo:white"}].selected set value true
tag @a[team=bingo.white] add bingo.in_current_team