#> fetchr:util/find_player_team/dark_aqua
#
# Marks team dark_aqua as current team
#
# @within function fetchr:util/find_player_team

data modify storage tmp.fetchr:find_team currentTeam set from storage fetchr:card teams[{id: "fetchr:dark_aqua"}]
data remove storage fetchr:card teams[{id: "fetchr:dark_aqua"}]
data modify storage fetchr:card teams append from storage tmp.fetchr:find_team currentTeam
tag @a[team=fetchr.dark_aqua] add fetchr.in_current_team