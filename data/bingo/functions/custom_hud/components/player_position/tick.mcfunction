#> bingo:custom_hud/components/player_position/tick
#
#

#>
# The x coordinate of the current player
#
# @within function bingo:custom_hud/components/player_position/*
#declare score_holder $custom_hud/player_pos.x
execute store result score $custom_hud/player_pos.x bingo.tmp run data get entity @s Pos[0]

#>
# The z coordinate of the current player
#
# @within function bingo:custom_hud/components/player_position/*
#declare score_holder $custom_hud/player_pos.z
execute store result score $custom_hud/player_pos.z bingo.tmp run data get entity @s Pos[2]

#>
# The position hash
#
# @within function bingo:custom_hud/components/player_position/*
#declare score_holder $custom_hud/player_pos.hash
scoreboard players operation $custom_hud/player_pos.hash bingo.tmp = $custom_hud/player_pos.x bingo.tmp
scoreboard players operation $custom_hud/player_pos.hash bingo.tmp %= 5792 bingo.const
execute if score $custom_hud/player_pos.x bingo.tmp matches ..-1 run scoreboard players add $custom_hud/player_pos.hash bingo.tmp 5792

#>
# The z value relevant for position hash
#
# @private
#declare score_holder $custom_hud/player_pos.hash_z
scoreboard players operation $custom_hud/player_pos.hash_z bingo.tmp = $custom_hud/player_pos.z bingo.tmp
scoreboard players operation $custom_hud/player_pos.hash_z bingo.tmp %= 5792 bingo.const
execute if score $custom_hud/player_pos.z bingo.tmp matches ..-1 run scoreboard players add $custom_hud/player_pos.hash_z bingo.tmp 5792

#>
# The rotation of the player for the compass icon in a resolution of 32 possible
# values
#
# @within function bingo:custom_hud/components/player_position/*
#declare score_holder $custom_hud/player_pos.rot
# Rotation / 5.625 (divides the 360 possible values into 64)
execute store result score $custom_hud/player_pos.rot bingo.tmp run data get entity @s Rotation[0] 0.17777777777777778
# Divide by 2 and ceil to next integer
scoreboard players add $custom_hud/player_pos.rot bingo.tmp 1
scoreboard players operation $custom_hud/player_pos.rot bingo.tmp /= 2 bingo.const
scoreboard players operation $custom_hud/player_pos.rot bingo.tmp %= 32 bingo.const

# calculate current position hash
# coordinate_hash(coord) := coord % 5792 + coord < 0 ? 5792 : 0
# hash := (coordinate_hash(player_x) * 11584 + coordinate_hash(player_z)) * 32 + compass_direction
scoreboard players operation $custom_hud/player_pos.hash bingo.tmp *= 11584 bingo.const
scoreboard players operation $custom_hud/player_pos.hash bingo.tmp += $custom_hud/player_pos.hash_z bingo.tmp
scoreboard players operation $custom_hud/player_pos.hash bingo.tmp *= 32 bingo.const
scoreboard players operation $custom_hud/player_pos.hash bingo.tmp += $custom_hud/player_pos.rot bingo.tmp

execute unless score @s bingo.pos_hash = $custom_hud/player_pos.hash bingo.tmp run function bingo:custom_hud/components/player_position/update