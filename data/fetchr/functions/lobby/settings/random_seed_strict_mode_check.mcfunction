#> fetchr:lobby/settings/random_seed_strict_mode_check
#
# This function checks whether strict mode is active and the player clicking is
# a confirmed operator, and the either asks the player to confirm their op
# status or generates a new seed.
#
# @within fetchr:lobby/place_indestructible_blocks
# @user
# @context entity Player changing the setting

execute unless score $strict_mode fetchr.settings matches 1 run function fetchr:card_generation/random_card
execute if score $strict_mode fetchr.settings matches 1 if score @s fetchr.operator matches 1 run function fetchr:card_generation/random_card
execute if score $strict_mode fetchr.settings matches 1 if score @s fetchr.operator matches 0 run function fetchr:util/confirm_operator_status