#> bingo:util/find_player_team/dark_gray
#
# Marks team dark_gray as current team
#
# @within function bingo:util/find_player_team

data modify storage tmp.bingo:find_team currentTeam set from storage bingo:card teams[{id: "bingo:dark_gray"}]
data remove storage bingo:card teams[{id: "bingo:dark_gray"}]
data modify storage bingo:card teams append from storage tmp.bingo:find_team currentTeam
tag @a[team=bingo.dark_gray] add bingo.in_current_team