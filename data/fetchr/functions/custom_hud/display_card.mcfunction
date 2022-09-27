#> fetchr:custom_hud/display_card
#
# Calculates the width the seed's characters make up in order to be able to
# display it with the correct padding in the action bar
#
# @within function fetchr:custom_hud/tick

scoreboard players operation $custom_hud/width.number fetchr.io = $seed fetchr.state
scoreboard players set $custom_hud/width.padding fetchr.io 88
function fetchr:custom_hud/subtract_width

# card
execute if score @s fetchr.card_position matches ..7 run function fetchr:custom_hud/left
execute if score @s fetchr.card_position matches 8.. run function fetchr:custom_hud/right