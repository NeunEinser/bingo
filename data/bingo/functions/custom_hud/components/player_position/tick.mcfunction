#> bingo:custom_hud/components/player_position/tick
#
# @within tag/function bingo:tick_hud_components
# @handles #bingo:tick_hud_components

#>
# The x coordinate of the current player
#
# @within function bingo:custom_hud/components/player_position/**
#declare score_holder $custom_hud/player_pos.x
execute store result score $custom_hud/player_pos.x bingo.tmp run data get entity @s Pos[0]

#>
# The x coordinate of the current player
#
# @within function bingo:custom_hud/components/player_position/**
#declare score_holder $custom_hud/player_pos.y
execute store result score $custom_hud/player_pos.y bingo.tmp run data get entity @s Pos[1]

#>
# The z coordinate of the current player
#
# @within function bingo:custom_hud/components/player_position/**
#declare score_holder $custom_hud/player_pos.z
execute store result score $custom_hud/player_pos.z bingo.tmp run data get entity @s Pos[2]

#>
# The position hash
#
# @within
# 	function bingo:custom_hud/components/player_position/tick
# 	function bingo:custom_hud/components/player_position/update
#declare score_holder $custom_hud/player_pos.hash
scoreboard players operation $custom_hud/player_pos.hash bingo.tmp = $custom_hud/player_pos.x bingo.tmp
scoreboard players operation $custom_hud/player_pos.hash bingo.tmp %= 128 bingo.const
execute if score $custom_hud/player_pos.x bingo.tmp matches ..-1 run scoreboard players add $custom_hud/player_pos.hash bingo.tmp 128

#>
# The y value relevant for position hash
#
# @private
#declare score_holder $custom_hud/player_pos.hash_y
scoreboard players operation $custom_hud/player_pos.hash_y bingo.tmp = $custom_hud/player_pos.y bingo.tmp
scoreboard players operation $custom_hud/player_pos.hash_y bingo.tmp %= 128 bingo.const
execute if score $custom_hud/player_pos.y bingo.tmp matches ..-1 run scoreboard players add $custom_hud/player_pos.hash_y bingo.tmp 128

#>
# The z value relevant for position hash
#
# @private
#declare score_holder $custom_hud/player_pos.hash_z
scoreboard players operation $custom_hud/player_pos.hash_z bingo.tmp = $custom_hud/player_pos.z bingo.tmp
scoreboard players operation $custom_hud/player_pos.hash_z bingo.tmp %= 128 bingo.const
execute if score $custom_hud/player_pos.z bingo.tmp matches ..-1 run scoreboard players add $custom_hud/player_pos.hash_z bingo.tmp 128

#>
# The rotation of the player for the compass icon in a resolution of 32 possible
# values
#
# @within function bingo:custom_hud/components/player_position/**
#declare score_holder $custom_hud/player_pos.rot
# Rotation / 5.625 (divides the 360 possible values into 64)
execute store result score $custom_hud/player_pos.rot bingo.tmp run data get entity @s Rotation[0] 0.53333333333333333333333333333333
# Divide by 2 and ceil to next integer
scoreboard players add $custom_hud/player_pos.rot bingo.tmp 1
scoreboard players operation $custom_hud/player_pos.rot bingo.tmp /= 2 bingo.const
scoreboard players operation $custom_hud/player_pos.rot bingo.tmp %= 96 bingo.const

# calculate current position hash
# coordinate_hash(coord) := coord % 256 + (coord < 0 ? 512 : 0)
# hash := ((coordinate_hash(player_x) * 512 + coordinate_hash(player_y)) * 512 + coordinate_hash(player_z)) * 32 + compass_direction
scoreboard players operation $custom_hud/player_pos.hash bingo.tmp *= 256 bingo.const
scoreboard players operation $custom_hud/player_pos.hash bingo.tmp += $custom_hud/player_pos.hash_y bingo.tmp
scoreboard players operation $custom_hud/player_pos.hash bingo.tmp *= 256 bingo.const
scoreboard players operation $custom_hud/player_pos.hash bingo.tmp += $custom_hud/player_pos.hash_z bingo.tmp
scoreboard players operation $custom_hud/player_pos.hash bingo.tmp *= 128 bingo.const
scoreboard players operation $custom_hud/player_pos.hash bingo.tmp += $custom_hud/player_pos.rot bingo.tmp
scoreboard players operation $custom_hud/player_pos.hash bingo.tmp *= 2 bingo.const
execute if entity @s[predicate=bingo:holding_treasure_map] run scoreboard players add $custom_hud/player_pos.hash bingo.tmp 1

execute if score @s bingo.update_hud matches 1 run function bingo:custom_hud/components/player_position/update
execute unless score @s bingo.update_hud matches 1 unless score @s bingo.pos_hash = $custom_hud/player_pos.hash bingo.tmp run function bingo:custom_hud/components/player_position/update