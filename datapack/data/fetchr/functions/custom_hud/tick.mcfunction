#> fetchr:custom_hud/tick
#
# Displays the fetchr card for @s
#
# @within fetchr:tick/player_tick
# @context entity Player for displaying the card
# @reads score @s fetchr.card_pos

#>
# @within
# 	function fetchr:custom_hud/**
# 	function fetchr:tick/tick
#declare storage tmp.fetchr:custom_hud

function fetchr:util/find_player_team

data remove storage fetchr:custom_hud currentPlayer
data modify storage tmp.fetchr:custom_hud skipped set value []
function fetchr:custom_hud/find_player
data modify storage fetchr:custom_hud players append from storage tmp.fetchr:custom_hud skipped[]

function #fetchr:tick_hud_components

execute if score $seed fetchr.state matches -2147483648.. run function fetchr:custom_hud/display_card

scoreboard players add @s fetchr.hud_update 1

execute if data storage fetchr:custom_hud currentPlayer.components[{changed: true}] run function fetchr:custom_hud/update_actionbar
execute if score @s fetchr.hud_update matches 40.. run function fetchr:custom_hud/update_actionbar

data modify storage fetchr:custom_hud currentPlayer.components[].changed set value false
data modify storage tmp.fetchr:custom_hud handled prepend from storage fetchr:custom_hud currentPlayer
scoreboard players reset @s fetchr.update_hud