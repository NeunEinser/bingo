#> fetchr:lobby/join_team/orange
#
# This function is executed during the skybox phase
#
# @within function fetchr:lobby/on_skybox_button_pressed
# @context
# 	location The location of the button

team join fetchr.gold @p[tag=fetchr.pressed_button]
tellraw @a {"translate":"fetchr.lobby.team_selection.join_orange","with":[{"selector":"@p[tag=fetchr.pressed_button]"}]}