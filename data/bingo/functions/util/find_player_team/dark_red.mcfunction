#> bingo:util/find_player_team/dark_red
#
# Marks team dark_red as current team
#
# @within function bingo:util/find_player_team

data modify storage tmp.bingo:find_team currentTeam set from storage bingo:card teams[{id: "bingo:dark_red"}]
data remove storage bingo:card teams[{id: "bingo:dark_red"}]
data modify storage bingo:card teams append from storage tmp.bingo:find_team currentTeam
tag @a[team=bingo.dark_red] add bingo.in_current_team