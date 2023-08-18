#> fetchr:game/skybox/join_team/blue
#
# This function is executed during the skybox phase
#
# @within function fetchr:game/skybox/**
# @context
# 	location The location of the button

team join fetchr.blue @s
tellraw @a {"translate":"fetchr.lobby.team_selection.join_blue","with":[{"selector":"@s"}]}