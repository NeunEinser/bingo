#> bingo:util/find_player_team/light_purple
#
# Marks team light_purple as current team
#
# @within function bingo:util/find_player_team

data modify storage bingo:card teams[{id:"bingo:light_purple"}].selected set value true
tag @a[team=bingo.light_purp] add bingo.in_current_team