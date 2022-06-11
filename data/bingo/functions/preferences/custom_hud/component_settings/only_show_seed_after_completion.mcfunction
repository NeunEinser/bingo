#> bingo:preferences/custom_hud/component_settings/only_show_seed_after_completion
#
# This makes the bingo seed always show
#
# @within function bingo:preferences/custom_hud/show


data modify storage bingo:custom_hud currentPlayer.components[{id: "bingo:seed"}].custom.bingo.onlyShowAfterRun set value true

scoreboard players set @s bingo.update_hud 1
scoreboard players set $preferences.next_page bingo.tmp 74