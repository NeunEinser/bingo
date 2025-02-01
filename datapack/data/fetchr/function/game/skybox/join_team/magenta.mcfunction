#> fetchr:game/skybox/join_team/magenta
#
# This function is executed during the skybox phase
#
# @within function fetchr:game/skybox/**
# @context
# 	location The location of the button

team join fetchr.magenta @s
tellraw @a { "translate": "fetchr.lobby.team_selection.join_magenta", "with": [{ "selector": "@s" }]}