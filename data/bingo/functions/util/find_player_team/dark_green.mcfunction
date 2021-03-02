#> bingo:util/find_player_team/dark_green
#
# Marks team dark_green as current team
#
# @within function bingo:util/find_player_team

data modify storage bingo:card teams[{id:"bingo:dark_green"}].selected set value true
tag @a[team=bingo.dark_green] add bingo.in_current_team