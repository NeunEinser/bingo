#> fetchr:game/spawn_preview/join_team/green
#
# This function is executed during the spawn preview phase
#
# @within function fetchr:game/spawn_preview/**
# @context
# 	location The location of the button

team join fetchr.green @s
tellraw @a { "translate": "fetchr.lobby.team_selection.join_green", "with": [{ "selector": "@s" }]}