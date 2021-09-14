#> bingo:util/find_player_team/blue
#
# Marks team blue as current team
#
# @within function bingo:util/find_player_team

data modify storage tmp.bingo:find_team currentTeam set from storage bingo:card teams[{id: "bingo:blue"}]
data remove storage bingo:card teams[{id: "bingo:blue"}]
data modify storage bingo:card teams append from storage tmp.bingo:find_team currentTeam
tag @a[team=bingo.blue] add bingo.in_current_team