#> fetchr:custom_hud/display_card
#
# Calculates the width the seed's characters make up in order to be able to
# display it with the correct padding in the action bar
#
# @within function fetchr:custom_hud/tick

# card
execute if score @s fetchr.card_position matches ..7 run function fetchr:custom_hud/left
execute if score @s fetchr.card_position matches 8.. run function fetchr:custom_hud/right