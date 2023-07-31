#> fetchr:lobby/settings/blind_mode_strict_mode_check
#
# This function checks whether strict mode is active and the player clicking is
# a confirmed operator, and the either asks the player to confirm their op
# status or toggles the blind mode setting.
#
# @user
# @context entity Player changing the setting

execute unless score $strict_mode fetchr.settings matches 1 run function fetchr:lobby/settings/toggle_blind_mode
execute if score $strict_mode fetchr.settings matches 1 if score @s fetchr.operator matches 1 run function fetchr:lobby/settings/toggle_blind_mode
execute if score $strict_mode fetchr.settings matches 1 if score @s fetchr.operator matches 0 run function fetchr:util/confirm_operator_status