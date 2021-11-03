#> bingo:util/find_player_team/red
#
# Marks team red as current team
#
# @within function bingo:util/find_player_team

data modify storage tmp.bingo:find_team currentTeam set from storage bingo:card teams[{id: "bingo:red"}]
data remove storage bingo:card teams[{id: "bingo:red"}]
data modify storage bingo:card teams append from storage tmp.bingo:find_team currentTeam
tag @a[team=bingo.red] add bingo.in_current_team