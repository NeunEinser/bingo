#> fetchr:game/skybox/join_team/orange
#
# This function is executed during the skybox phase
#
# @within function fetchr:game/skybox/**
# @context
# 	location The location of the button

team join fetchr.orange @s
tellraw @a { "translate": "fetchr.lobby.team_selection.join_orange", "with": [{ "selector": "@s" }]}