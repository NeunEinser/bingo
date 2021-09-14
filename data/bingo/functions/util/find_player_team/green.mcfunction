#> bingo:util/find_player_team/green
#
# Marks team green as current team
#
# @within function bingo:util/find_player_team

data modify storage tmp.bingo:find_team currentTeam set from storage bingo:card teams[{id: "bingo:green"}]
data remove storage bingo:card teams[{id: "bingo:green"}]
data modify storage bingo:card teams append from storage tmp.bingo:find_team currentTeam
tag @a[team=bingo.green] add bingo.in_current_team