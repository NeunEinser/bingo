#> bingo:util/find_player_team/dark_gray
#
# Marks team dark_gray as current team
#
# @within function bingo:util/find_player_team

data modify storage bingo:card teams[{id:"bingo:dark_gray"}].selected set value true
tag @a[team=bingo.dark_gray] add bingo.in_current_team