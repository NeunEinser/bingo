#> bingo:lobby/settings/random_seed_strict_mode_check
#
# This function checks whether strict mode is active and the player clicking is
# a confirmed operator, and the either asks the player to confirm their op
# status or generates a new seed.
#
# @within bingo:lobby/place_indestructible_blocks
# @user
# @context entity Player changing the setting

execute if score $strict_mode bingo.settings matches 0 run function bingo:card_generation/random_card
execute if score $strict_mode bingo.settings matches 1 if score @s bingo.operator matches 1 run function bingo:card_generation/random_card
execute if score $strict_mode bingo.settings matches 1 if score @s bingo.operator matches 0 run function bingo:util/confirm_operator_status