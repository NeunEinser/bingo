#> bingo:util/find_player_team/white
#
# Marks team white as current team
#
# @within function bingo:util/find_player_team

data modify storage tmp.bingo:find_team currentTeam set from storage bingo:card teams[{id: "bingo:white"}]
data remove storage bingo:card teams[{id: "bingo:white"}]
data modify storage bingo:card teams append from storage tmp.bingo:find_team currentTeam
tag @a[team=bingo.white] add bingo.in_current_team