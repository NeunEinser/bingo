#> bingo:custom_hud/display_card
#
# Calculates the width the seed's characters make up in order to be able to
# display it with the correct padding in the action bar
#
# @within function bingo:custom_hud/tick

scoreboard players operation $custom_hud/width.number bingo.io = $seed bingo.state
scoreboard players set $custom_hud/width.padding bingo.io 88
function bingo:custom_hud/subtract_width

# card
execute if score @s bingo.card_pos matches ..7 run function bingo:custom_hud/left
execute if score @s bingo.card_pos matches 8.. run function bingo:custom_hud/right