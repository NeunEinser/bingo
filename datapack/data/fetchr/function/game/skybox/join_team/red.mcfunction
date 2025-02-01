#> fetchr:game/skybox/join_team/red
#
# This function is executed during the skybox phase
#
# @within function fetchr:game/skybox/**
# @context
# 	location The location of the button

team join fetchr.red @s
tellraw @a { "translate": "fetchr.lobby.team_selection.join_red", "with": [{ "selector": "@s" }]}