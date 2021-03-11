#> bingo:util/find_player_team/dark_aqua
#
# Marks team dark_aqua as current team
#
# @within function bingo:util/find_player_team

data modify storage temp:bingo.find_team currentTeam set from storage bingo:card teams[{id: "bingo:dark_aqua"}]
data remove storage bingo:card teams[{id: "bingo:dark_aqua"}]
data modify storage bingo:card teams append from storage temp:bingo.find_team currentTeam
tag @a[team=bingo.dark_aqua] add bingo.in_current_team