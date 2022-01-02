#> bingo:lobby/settings/start_game_strict_mode_check
#
# This function checks whether strict mode is active and the player clicking is
# a confirmed operator, and the either asks the player to confirm their op
# status or starts the game.
#
# @within bingo:lobby/place_indestructible_blocks
# @user
# @context entity Player changing the setting

execute if score $strict_mode bingo.settings matches 0 run function bingo:game/start/check_and_start
execute if score $strict_mode bingo.settings matches 1 if score @s bingo.operator matches 1 run function bingo:game/start/check_and_start
execute if score $strict_mode bingo.settings matches 1 if score @s bingo.operator matches 0 run function bingo:util/confirm_operator_status