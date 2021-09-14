#> bingo:util/find_player_team/aqua
#
# Marks team aqua as current team
#
# @within function bingo:util/find_player_team

data modify storage tmp.bingo:find_team currentTeam set from storage bingo:card teams[{id: "bingo:aqua"}]
data remove storage bingo:card teams[{id: "bingo:aqua"}]
data modify storage bingo:card teams append from storage tmp.bingo:find_team currentTeam
tag @a[team=bingo.aqua] add bingo.in_current_team