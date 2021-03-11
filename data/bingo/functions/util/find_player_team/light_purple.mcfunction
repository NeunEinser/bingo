#> bingo:util/find_player_team/light_purple
#
# Marks team light_purple as current team
#
# @within function bingo:util/find_player_team

data modify storage temp:bingo.find_team currentTeam set from storage bingo:card teams[{id: "bingo:light_purple"}]
data remove storage bingo:card teams[{id: "bingo:light_purple"}]
data modify storage bingo:card teams append from storage temp:bingo.find_team currentTeam
tag @a[team=bingo.light_purp] add bingo.in_current_team