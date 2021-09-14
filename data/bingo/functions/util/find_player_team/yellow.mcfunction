#> bingo:util/find_player_team/yellow
#
# Marks team yellow as current team
#
# @within function bingo:util/find_player_team

data modify storage tmp.bingo:find_team currentTeam set from storage bingo:card teams[{id: "bingo:yellow"}]
data remove storage bingo:card teams[{id: "bingo:yellow"}]
data modify storage bingo:card teams append from storage tmp.bingo:find_team currentTeam
tag @a[team=bingo.yellow] add bingo.in_current_team