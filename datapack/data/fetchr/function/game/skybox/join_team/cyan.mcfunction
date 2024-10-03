#> fetchr:game/skybox/join_team/cyan
#
# This function is executed during the skybox phase
#
# @within function fetchr:game/skybox/**
# @context
# 	location The location of the button

team join fetchr.cyan @s
tellraw @a {"translate":"fetchr.lobby.team_selection.join_cyan","with":[{"selector":"@s"}]}