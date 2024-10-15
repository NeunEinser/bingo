#> fetchr:util/find_player_team/dark_red
#
# Marks team dark_red as current team
#
# @within function fetchr:util/find_player_team

data modify storage io.fetchr:find_team current_team set from storage fetchr:card teams[{id: "fetchr:dark_red"}]
data remove storage fetchr:card teams[{id: "fetchr:dark_red"}]
data modify storage fetchr:card teams append from storage io.fetchr:find_team current_team
tag @a[team=fetchr.dark_red] add fetchr.in_current_team