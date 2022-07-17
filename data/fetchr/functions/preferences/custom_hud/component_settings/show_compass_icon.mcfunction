#> fetchr:preferences/custom_hud/component_settings/show_compass_icon
#
# This makes the icon used in the position display use a compass icon
#
# @within function fetchr:preferences/custom_hud/show

data modify storage fetchr:custom_hud currentPlayer.components[{id: "fetchr:player_position"}].custom.fetchr.iconType set value 'compass'

scoreboard players set @s fetchr.update_hud 1
scoreboard players set $preferences.next_page fetchr.tmp 72