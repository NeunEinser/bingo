#> fetchr:game/spawn_preview/join_team/magenta
#
# This function is executed during the spawn preview phase
#
# @within function fetchr:game/spawn_preview/**
# @context
# 	location The location of the button

team join fetchr.magenta @s
tellraw @a { "translate": "fetchr.lobby.team_selection.join_magenta", "with": [{ "selector": "@s" }]}