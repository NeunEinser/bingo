#> fetchr:preferences/custom_hud/component_settings/show_text_icon
#
# This makes the Fetchr seed only show after the current run was completed
#
# @within function fetchr:preferences/custom_hud/show

data modify storage fetchr:custom_hud currentPlayer.components[{id: "fetchr:player_position"}].custom.fetchr.iconType set value 'text'

scoreboard players set @s fetchr.update_hud 1
scoreboard players set $preferences.next_page fetchr.tmp 72