#> fetchr:game/skybox/join_team/green
#
# This function is executed during the skybox phase
#
# @within function fetchr:game/skybox/**
# @context
# 	location The location of the button

team join fetchr.green @s
tellraw @a {"translate":"fetchr.lobby.team_selection.join_green","with":[{"selector":"@s"}]}