#> bingo:util/find_player_team/dark_red
#
# Marks team dark_red as current team
#
# @within function bingo:util/find_player_team

data modify storage bingo:card teams[{id:"bingo:dark_red"}].selected set value true
tag @a[team=bingo.dark_red] add bingo.in_current_team