#> fetchr:lobby/join_team/light_blue
#
# This function is executed during the skybox phase
#
# @within function fetchr:lobby/on_skybox_button_pressed
# @context
# 	location The location of the button

team join fetchr.light_blue @p[tag=fetchr.pressed_button]
tellraw @a {"translate":"fetchr.lobby.team_selection.join_light_blue","with":[{"selector":"@p[tag=fetchr.pressed_button]"}]}