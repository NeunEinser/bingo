#> fetchr:custom_hud/components/player_position/emerald_detection/chunk/detect
#
# Detects if @s is in a chunk that can generate emerald ore
#
# @context
# 	entity Player
# 	position @s
# @within function fetchr:custom_hud/components/player_position/update_y
# @output tag @s fetchr.emerald

#>
# @private
#declare tag fetchr.emerald_cloud

scoreboard players operation $custom_hud/player_pos.x fetchr.tmp %= 16 fetchr.const
scoreboard players operation $custom_hud/player_pos.z fetchr.tmp %= 16 fetchr.const

function fetchr:custom_hud/components/player_position/emerald_detection/chunk/move_x/0