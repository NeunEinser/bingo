#> bingo:custom_hud/tick
#
# Displays the bingo card for @s
#
# @within bingo:tick/tick
# @context entity Player for displaying the card
# @reads score @s bingo.card_pos

#>
# @within
# 	function bingo:custom_hud/**
# 	function bingo:tick/tick
#declare storage tmp.bingo:custom_hud

function bingo:util/find_player_team

data remove storage bingo:custom_hud currentPlayer
data modify storage tmp.bingo:custom_hud skipped set value []
function bingo:custom_hud/find_player
data modify storage bingo:custom_hud players append from storage tmp.bingo:custom_hud skipped[]

function #bingo:tick_hud_components

execute if score $seed bingo.state matches -2147483648.. run function bingo:custom_hud/display_card

scoreboard players add @s bingo.hud_update 1

execute if data storage bingo:custom_hud currentPlayer.components[{changed: true}] run function bingo:custom_hud/update_actionbar
execute if score @s bingo.hud_update matches 40.. run function bingo:custom_hud/update_actionbar

data remove storage bingo:custom_hud currentPlayer.components[].changed
data modify storage tmp.bingo:custom_hud handled prepend from storage bingo:custom_hud currentPlayer
scoreboard players reset @s bingo.update_hud