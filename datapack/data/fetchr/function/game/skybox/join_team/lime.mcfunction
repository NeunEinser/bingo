#> fetchr:game/skybox/join_team/lime
#
# This function is executed during the skybox phase
#
# @within function fetchr:game/skybox/**
# @context
# 	location The location of the button

team join fetchr.lime @s
tellraw @a { "translate": "fetchr.lobby.team_selection.join_lime", "with": [{ "selector": "@s" }]}