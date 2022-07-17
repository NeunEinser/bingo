#> fetchr:util/find_player_team/light_purple
#
# Marks team light_purple as current team
#
# @within function fetchr:util/find_player_team

data modify storage tmp.fetchr:find_team currentTeam set from storage fetchr:card teams[{id: "fetchr:light_purple"}]
data remove storage fetchr:card teams[{id: "fetchr:light_purple"}]
data modify storage fetchr:card teams append from storage tmp.fetchr:find_team currentTeam
tag @a[team=fetchr.light_purple] add fetchr.in_current_team