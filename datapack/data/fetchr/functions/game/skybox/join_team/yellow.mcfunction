#> fetchr:game/skybox/join_team/yellow
#
# This function is executed during the skybox phase
#
# @within function fetchr:game/skybox/**
# @context
# 	location The location of the button

team join fetchr.yellow @s
tellraw @a {"translate":"fetchr.lobby.team_selection.join_yellow","with":[{"selector":"@s"}]}