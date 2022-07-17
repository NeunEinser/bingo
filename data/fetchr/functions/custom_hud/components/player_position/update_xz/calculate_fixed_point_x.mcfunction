#> fetchr:custom_hud/components/player_position/update_xz/calculate_fixed_point_x
#
# Calculates integer and decimal portion of x
#
# @within
# 	function fetchr:custom_hud/components/player_position/update_xz/shorten_x
# 	function fetchr:custom_hud/components/player_position/update_xz/shorten_both
# 	function fetchr:custom_hud/components/player_position/update_xz/calculate_fixed_point_x

#>
# @private
#declare score_holder $custom_hud/player_pos.rem

scoreboard players operation $custom_hud/player_pos.rem fetchr.tmp = $custom_hud/player_pos.int_x fetchr.tmp
scoreboard players operation $custom_hud/player_pos.rem fetchr.tmp %= 10 fetchr.const
scoreboard players operation $custom_hud/player_pos.rem fetchr.tmp *= $custom_hud/player_pos.ten_pow fetchr.tmp
scoreboard players operation $custom_hud/player_pos.dec_x fetchr.tmp += $custom_hud/player_pos.rem fetchr.tmp

execute unless score $custom_hud/player_pos.ten_pow fetchr.tmp matches 1 if score $custom_hud/player_pos.rem fetchr.tmp matches 0 run data modify storage tmp.fetchr:custom_hud xFillerZeros append value "0"
execute unless score $custom_hud/player_pos.rem fetchr.tmp matches 0 run data modify storage tmp.fetchr:custom_hud xFillerZeros set value [""]

scoreboard players operation $custom_hud/player_pos.int_x fetchr.tmp /= 10 fetchr.const

scoreboard players operation $custom_hud/player_pos.ten_pow fetchr.tmp *= 10 fetchr.const
scoreboard players add $custom_hud/player_pos.decimal_digits fetchr.tmp 1

execute if score $custom_hud/player_pos.abs_x fetchr.tmp matches 1000000.. if score $custom_hud/player_pos.decimal_digits fetchr.tmp matches ..5 run function fetchr:custom_hud/components/player_position/update_xz/calculate_fixed_point_x