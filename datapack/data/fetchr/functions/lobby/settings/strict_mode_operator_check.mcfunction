#> fetchr:lobby/settings/strict_mode_operator_check
#
# This function checks whether the player clicking is a confirmed operator, and
# if so, prints the strict mode dialog
#
# @user
# @context entity Player changing the setting

execute if score @s fetchr.operator matches 1 run function fetchr:lobby/settings/change_strict_mode
execute if score @s fetchr.operator matches 0 run function fetchr:util/confirm_operator_status