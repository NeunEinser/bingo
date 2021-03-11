#> bingo:util/find_player_team/dark_green
#
# Marks team dark_green as current team
#
# @within function bingo:util/find_player_team

data modify storage temp:bingo.find_team currentTeam set from storage bingo:card teams[{id: "bingo:dark_green"}]
data remove storage bingo:card teams[{id: "bingo:dark_green"}]
data modify storage bingo:card teams append from storage temp:bingo.find_team currentTeam
tag @a[team=bingo.dark_green] add bingo.in_current_team