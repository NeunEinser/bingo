#> bingo:preferences/custom_hud/component_settings/show_compass_icon
#
# This makes the icon used in the position display use a compass icon
#
# @within function bingo:preferences/custom_hud/show

data modify storage bingo:custom_hud currentPlayer.components[{id: "bingo:player_position"}].custom.bingo.iconType set value 'compass'

scoreboard players set @s bingo.update_hud 1
scoreboard players set $preferences.next_page bingo.tmp 72