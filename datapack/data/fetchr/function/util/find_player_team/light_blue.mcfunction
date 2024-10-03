#> fetchr:util/find_player_team/light_blue
#
# Marks team light_blue as current team
#
# @within function fetchr:util/find_player_team

data modify storage tmp.fetchr:find_team currentTeam set from storage fetchr:card teams[{id: "fetchr:light_blue"}]
data remove storage fetchr:card teams[{id: "fetchr:light_blue"}]
data modify storage fetchr:card teams append from storage tmp.fetchr:find_team currentTeam
tag @a[team=fetchr.light_blue] add fetchr.in_current_team