#> fetchr:game/skybox/join_team/purple
#
# This function is executed during the skybox phase
#
# @within function fetchr:game/skybox/**
# @context
# 	location The location of the button

team join fetchr.purple @s
tellraw @a { "translate": "fetchr.lobby.team_selection.join_purple", "with": [{ "selector": "@s" }]}