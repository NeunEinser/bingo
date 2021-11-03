#> bingo:util/find_player_team/gray
#
# Marks team gray as current team
#
# @within function bingo:util/find_player_team

data modify storage tmp.bingo:find_team currentTeam set from storage bingo:card teams[{id: "bingo:gray"}]
data remove storage bingo:card teams[{id: "bingo:gray"}]
data modify storage bingo:card teams append from storage tmp.bingo:find_team currentTeam
tag @a[team=bingo.gray] add bingo.in_current_team