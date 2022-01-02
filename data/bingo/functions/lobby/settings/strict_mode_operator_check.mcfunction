#> bingo:lobby/settings/strict_mode_operator_check
#
# This function checks whether the player clicking is a confirmed operator, and
# if so, prints the strict mode dialog
#
# @within bingo:lobby/place_indestructible_blocks
# @user
# @context entity Player changing the setting

execute if score @s bingo.operator matches 1 run function bingo:lobby/settings/change_strict_mode
execute if score @s bingo.operator matches 0 run function bingo:util/confirm_operator_status