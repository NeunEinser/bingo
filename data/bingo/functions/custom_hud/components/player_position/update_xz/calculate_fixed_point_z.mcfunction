#> bingo:custom_hud/components/player_position/update_xz/calculate_fixed_point_z
#
# Calculates integer and decimal portion of z
#
# @within
# 	function bingo:custom_hud/components/player_position/update_xz/shorten_z
# 	function bingo:custom_hud/components/player_position/update_xz/shorten_both
# 	function bingo:custom_hud/components/player_position/update_xz/calculate_fixed_point_z

#>
# @private
#declare score_holder $custom_hud/player_pos.rem

scoreboard players operation $custom_hud/player_pos.rem bingo.tmp = $custom_hud/player_pos.int_z bingo.tmp
scoreboard players operation $custom_hud/player_pos.rem bingo.tmp %= 10 bingo.const
scoreboard players operation $custom_hud/player_pos.rem bingo.tmp *= $custom_hud/player_pos.ten_pow bingo.tmp
scoreboard players operation $custom_hud/player_pos.dec_z bingo.tmp += $custom_hud/player_pos.rem bingo.tmp

execute unless score $custom_hud/player_pos.ten_pow bingo.tmp matches 1 if score $custom_hud/player_pos.rem bingo.tmp matches 0 run data modify storage tmp.bingo:custom_hud zFillerZeros append value "0"
execute unless score $custom_hud/player_pos.rem bingo.tmp matches 0 run data modify storage tmp.bingo:custom_hud zFillerZeros set value [""]

scoreboard players operation $custom_hud/player_pos.int_z bingo.tmp /= 10 bingo.const

scoreboard players operation $custom_hud/player_pos.ten_pow bingo.tmp *= 10 bingo.const
scoreboard players add $custom_hud/player_pos.decimal_digits bingo.tmp 1

execute if score $custom_hud/player_pos.abs_z bingo.tmp matches 1000000.. if score $custom_hud/player_pos.decimal_digits bingo.tmp matches ..5 run function bingo:custom_hud/components/player_position/update_xz/calculate_fixed_point_z