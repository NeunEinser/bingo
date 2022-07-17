#> fetchr:custom_hud/components/player_position/tick
#
# @within tag/function fetchr:tick_hud_components
# @handles #fetchr:tick_hud_components

#>
# The x coordinate of the current player
#
# @within function fetchr:custom_hud/components/player_position/**
#declare score_holder $custom_hud/player_pos.x
execute store result score $custom_hud/player_pos.x fetchr.tmp run data get entity @s Pos[0]

#>
# The x coordinate of the current player
#
# @within function fetchr:custom_hud/components/player_position/**
#declare score_holder $custom_hud/player_pos.y
execute store result score $custom_hud/player_pos.y fetchr.tmp run data get entity @s Pos[1]

#>
# The z coordinate of the current player
#
# @within function fetchr:custom_hud/components/player_position/**
#declare score_holder $custom_hud/player_pos.z
execute store result score $custom_hud/player_pos.z fetchr.tmp run data get entity @s Pos[2]

#>
# The position hash
#
# @within
# 	function fetchr:custom_hud/components/player_position/tick
# 	function fetchr:custom_hud/components/player_position/update
#declare score_holder $custom_hud/player_pos.hash
scoreboard players operation $custom_hud/player_pos.hash fetchr.tmp = $custom_hud/player_pos.x fetchr.tmp
scoreboard players operation $custom_hud/player_pos.hash fetchr.tmp %= 128 fetchr.const
execute if score $custom_hud/player_pos.x fetchr.tmp matches ..-1 run scoreboard players add $custom_hud/player_pos.hash fetchr.tmp 128

#>
# The y value relevant for position hash
#
# @private
#declare score_holder $custom_hud/player_pos.hash_y
scoreboard players operation $custom_hud/player_pos.hash_y fetchr.tmp = $custom_hud/player_pos.y fetchr.tmp
scoreboard players operation $custom_hud/player_pos.hash_y fetchr.tmp %= 128 fetchr.const
execute if score $custom_hud/player_pos.y fetchr.tmp matches ..-1 run scoreboard players add $custom_hud/player_pos.hash_y fetchr.tmp 128

#>
# The z value relevant for position hash
#
# @private
#declare score_holder $custom_hud/player_pos.hash_z
scoreboard players operation $custom_hud/player_pos.hash_z fetchr.tmp = $custom_hud/player_pos.z fetchr.tmp
scoreboard players operation $custom_hud/player_pos.hash_z fetchr.tmp %= 128 fetchr.const
execute if score $custom_hud/player_pos.z fetchr.tmp matches ..-1 run scoreboard players add $custom_hud/player_pos.hash_z fetchr.tmp 128

#>
# The rotation of the player for the compass icon in a resolution of 32 possible
# values
#
# @within function fetchr:custom_hud/components/player_position/**
#declare score_holder $custom_hud/player_pos.rot
# Rotation / 5.625 (divides the 360 possible values into 64)
execute store result score $custom_hud/player_pos.rot fetchr.tmp run data get entity @s Rotation[0] 0.53333333333333333333333333333333
# Divide by 2 and ceil to next integer
scoreboard players add $custom_hud/player_pos.rot fetchr.tmp 1
scoreboard players operation $custom_hud/player_pos.rot fetchr.tmp /= 2 fetchr.const
scoreboard players operation $custom_hud/player_pos.rot fetchr.tmp %= 96 fetchr.const

# calculate current position hash
# coordinate_hash(coord) := coord % 256 + (coord < 0 ? 512 : 0)
# hash := ((coordinate_hash(player_x) * 512 + coordinate_hash(player_y)) * 512 + coordinate_hash(player_z)) * 32 + compass_direction
scoreboard players operation $custom_hud/player_pos.hash fetchr.tmp *= 256 fetchr.const
scoreboard players operation $custom_hud/player_pos.hash fetchr.tmp += $custom_hud/player_pos.hash_y fetchr.tmp
scoreboard players operation $custom_hud/player_pos.hash fetchr.tmp *= 256 fetchr.const
scoreboard players operation $custom_hud/player_pos.hash fetchr.tmp += $custom_hud/player_pos.hash_z fetchr.tmp
scoreboard players operation $custom_hud/player_pos.hash fetchr.tmp *= 128 fetchr.const
scoreboard players operation $custom_hud/player_pos.hash fetchr.tmp += $custom_hud/player_pos.rot fetchr.tmp
scoreboard players operation $custom_hud/player_pos.hash fetchr.tmp *= 2 fetchr.const
execute if entity @s[predicate=fetchr:holding_treasure_map] run scoreboard players add $custom_hud/player_pos.hash fetchr.tmp 1

execute if score @s fetchr.update_hud matches 1 run function fetchr:custom_hud/components/player_position/update
execute unless score @s fetchr.update_hud matches 1 unless score @s fetchr.pos_hash = $custom_hud/player_pos.hash fetchr.tmp run function fetchr:custom_hud/components/player_position/update