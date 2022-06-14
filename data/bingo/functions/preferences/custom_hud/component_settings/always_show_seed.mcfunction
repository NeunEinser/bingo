#> bingo:preferences/custom_hud/component_settings/always_show_seed
#
# This makes the bingo seed only show after the current run was completed
#
# @within function bingo:preferences/custom_hud/show

data modify storage bingo:custom_hud currentPlayer.components[{id: "bingo:seed"}].custom.bingo.onlyShowAfterRun set value false

scoreboard players set @s bingo.update_hud 1
scoreboard players set $preferences.next_page bingo.tmp 74