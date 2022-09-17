#> bingo:custom_hud/update_actionbar
#
# Updates the action bar display.
# Should be called at least every 2 seconds, otherwise it starts fading out.
#
# Shouldn't be called every tick to also let vanilla action bar messages
# through.
#
# @within function bingo:custom_hud/tick
# @context entity The current player
#
# @reads storage bingo:custom_hud currentPlayer.components

scoreboard players set @s bingo.hud_update 0
data modify storage tmp.bingo:custom_hud texts set value []
data modify storage tmp.bingo:custom_hud texts append from storage bingo:custom_hud currentPlayer.components[].evaluated

#>
# @within
# 	function bingo:custom_hud/update_actionbar
# 	function bingo:custom_hud/update_actionbar/*
#declare score_holder $custom_hud/update.components
execute store result score $custom_hud/update.components bingo.tmp run data get storage tmp.bingo:custom_hud texts

execute if score $custom_hud/update.components bingo.tmp matches ..5 run function bingo:custom_hud/update_actionbar/0_5
execute if score $custom_hud/update.components bingo.tmp matches 6.. run function bingo:custom_hud/update_actionbar/6_11
