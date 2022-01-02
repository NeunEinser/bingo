#> bingo:lobby/press_button
#
# This function is called whenever a button in the lobby is pressed.
#
# @within advancement bingo:press_button
# @context position location of the button

#>
# @within
# 	function bingo:lobby/press_button
# 	structure bingo:card_generation
#declare tag bingo.pressed_button

tag @a remove bingo.pressed_button
tag @s add bingo.pressed_button
advancement revoke @s only bingo:press_button