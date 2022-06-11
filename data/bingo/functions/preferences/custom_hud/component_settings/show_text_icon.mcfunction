#> bingo:preferences/custom_hud/component_settings/show_text_icon
#
# This makes the bingo seed only show after the current run was completed
#
# @within function bingo:preferences/custom_hud/show

data modify storage bingo:custom_hud currentPlayer.components[{id: "bingo:player_position"}].custom.bingo.iconType set value 'text'

scoreboard players set @s bingo.update_hud 1
scoreboard players set $preferences.next_page bingo.tmp 72