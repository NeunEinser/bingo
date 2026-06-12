#> fetchr:game/spawn_preview/join_team/blue
#
# This function is executed during the spawn preview phase
#
# @within function fetchr:game/spawn_preview/**
# @context
# 	location The location of the button

team join fetchr.blue @s
tellraw @a { "translate": "fetchr.lobby.team_selection.join_blue", "with": [{ "selector": "@s" }]}