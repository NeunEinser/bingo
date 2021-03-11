#> bingo:util/find_player_team/gold
#
# Marks team gold as current team
#
# @within function bingo:util/find_player_team

data modify storage temp:bingo.find_team currentTeam set from storage bingo:card teams[{id: "bingo:gold"}]
data remove storage bingo:card teams[{id: "bingo:gold"}]
data modify storage bingo:card teams append from storage temp:bingo.find_team currentTeam
tag @a[team=bingo.gold] add bingo.in_current_team