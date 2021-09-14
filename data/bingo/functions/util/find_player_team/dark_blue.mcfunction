#> bingo:util/find_player_team/dark_blue
#
# Marks team dark_blue as current team
#
# @within function bingo:util/find_player_team

data modify storage tmp.bingo:find_team currentTeam set from storage bingo:card teams[{id: "bingo:dark_blue"}]
data remove storage bingo:card teams[{id: "bingo:dark_blue"}]
data modify storage bingo:card teams append from storage tmp.bingo:find_team currentTeam
tag @a[team=bingo.dark_blue] add bingo.in_current_team