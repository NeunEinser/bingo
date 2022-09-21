#> bingo:custom_hud/components/player_position/emerald_detection/chunk/detect
#
# Detects if @s is in a chunk that can generate emerald ore
#
# @context
# 	entity Player
# 	position @s
# @within function bingo:custom_hud/components/player_position/update_y
# @output tag @s bingo.emerald

#>
# @private
#declare tag bingo.emerald_cloud

scoreboard players operation $custom_hud/player_pos.x bingo.tmp %= 16 bingo.const
scoreboard players operation $custom_hud/player_pos.z bingo.tmp %= 16 bingo.const

function bingo:custom_hud/components/player_position/emerald_detection/chunk/move_x/0