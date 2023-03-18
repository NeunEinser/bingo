#> fetchr:util/find_player_team/dark_purple
#
# Marks team dark_purple as current team
#
# @within function fetchr:util/find_player_team

data modify storage tmp.fetchr:find_team currentTeam set from storage fetchr:card teams[{id: "fetchr:dark_purple"}]
data remove storage fetchr:card teams[{id: "fetchr:dark_purple"}]
data modify storage fetchr:card teams append from storage tmp.fetchr:find_team currentTeam
tag @a[team=fetchr.dark_purple] add fetchr.in_current_team