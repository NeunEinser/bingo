#> bingo:custom_hud/components/seed/tick
#
# @within tag/function bingo:tick_hud_components
# @handles #bingo:tick_hud_components

execute if score $update_card bingo.state matches 1 if data storage bingo:custom_hud currentPlayer.components[{id: "bingo:seed"}] run function bingo:custom_hud/components/seed/update
execute if score @s bingo.update_hud matches 1 if data storage bingo:custom_hud currentPlayer.components[{id: "bingo:seed"}] run function bingo:custom_hud/components/seed/update