#> fetchr:lobby/join_team/magenta
#
# This function is executed during the skybox phase
#
# @within function fetchr:lobby/on_skybox_button_pressed
# @context
# 	location The location of the button

team join fetchr.light_purple @p[tag=fetchr.pressed_button]
tellraw @a {"translate":"fetchr.lobby.team_selection.join_magenta","with":[{"selector":"@p[tag=fetchr.pressed_button]"}]}