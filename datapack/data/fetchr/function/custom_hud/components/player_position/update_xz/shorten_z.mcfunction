#> fetchr:custom_hud/components/player_position/update_xz/shorten_z
#
# This function shortens
#
# @within function fetchr:custom_hud/components/player_position/update_xz/shorten

#>
# The remaining digits of the z coordinate
#
# @within
# 	function fetchr:custom_hud/components/player_position/update_xz/shorten_z
# 	function fetchr:custom_hud/components/player_position/update_xz/shorten_z_iter
#declare score_holder $custom_hud/player_pos.short_z
#>
# The current amount of removed digits
#
# @within
# 	function fetchr:custom_hud/components/player_position/update_xz/shorten_z
# 	function fetchr:custom_hud/components/player_position/update_xz/shorten_z_iter
#declare score_holder $custom_hud/player_pos.removed_z

# Use absolute value for now so that integer division cuts of digits (Mojang
# uses floor_div and floor_mod, which is a good thing in most applications and
# can easily be mitigated like this for when it isn't)
scoreboard players operation $custom_hud/player_pos.short_z fetchr.tmp = $custom_hud/player_pos.abs_z fetchr.tmp

# At least 2 digits need to be removed.
scoreboard players operation $custom_hud/player_pos.short_z fetchr.tmp /= 100 fetchr.const
scoreboard players set $custom_hud/player_pos.removed_z fetchr.tmp 2

# Remove 2 digits (width 12) and add per coordinate:
#   - decimal point (width 2)
#   - Either k for kilo (width 5) or M for million (width 6)
# Total is either 5 or 4
execute if score $custom_hud/player_pos.abs_z fetchr.tmp matches ..999999 run scoreboard players add $custom_hud/width.padding fetchr.io 5
execute if score $custom_hud/player_pos.abs_z fetchr.tmp matches ..999999 run data modify storage tmp.fetchr:custom_hud zChar set value "k"
execute unless score $custom_hud/player_pos.abs_z fetchr.tmp matches ..999999 run scoreboard players add $custom_hud/width.padding fetchr.io 4
execute unless score $custom_hud/player_pos.abs_z fetchr.tmp matches ..999999 run data modify storage tmp.fetchr:custom_hud zChar set value "M"

execute if score $custom_hud/width.padding fetchr.io matches ..-1 if score $custom_hud/player_pos.abs_z fetchr.tmp > $custom_hud/player_pos.abs_x fetchr.tmp run function fetchr:custom_hud/components/player_position/update_xz/shorten_z_iter

#>
# Current decimal digits
#
# @within
# 	function fetchr:custom_hud/components/player_position/update_xz/shorten_z
# 	function fetchr:custom_hud/components/player_position/update_xz/calculate_fixed_point_z
#declare score_holder $custom_hud/player_pos.decimal_digits
#>
# @within
# 	function fetchr:custom_hud/components/player_position/update_xz/shorten_z
# 	function fetchr:custom_hud/components/player_position/update_xz/calculate_fixed_point_z
#declare score_holder $custom_hud/player_pos.ten_pow

#>
# Integer portion of z
#
# @within
# 	function fetchr:custom_hud/components/player_position/update_xz/shorten_z
# 	function fetchr:custom_hud/components/player_position/update_xz/calculate_fixed_point_z
#declare score_holder $custom_hud/player_pos.int_z
scoreboard players operation $custom_hud/player_pos.int_z fetchr.tmp = $custom_hud/player_pos.short_z fetchr.tmp
#>
# Decimal portion of x
#
# @within
# 	function fetchr:custom_hud/components/player_position/update_xz/shorten_z
# 	function fetchr:custom_hud/components/player_position/update_xz/calculate_fixed_point_z
#declare score_holder $custom_hud/player_pos.dec_z
scoreboard players set $custom_hud/player_pos.dec_z fetchr.tmp 0
data modify storage tmp.fetchr:custom_hud zFillerZeros set value [""]
scoreboard players set $custom_hud/player_pos.ten_pow fetchr.tmp 1
scoreboard players operation $custom_hud/player_pos.decimal_digits fetchr.tmp = $custom_hud/player_pos.removed_z fetchr.tmp
execute if score $custom_hud/player_pos.abs_z fetchr.tmp matches 1000000.. run function fetchr:custom_hud/components/player_position/update_xz/calculate_fixed_point_z
execute unless score $custom_hud/player_pos.abs_z fetchr.tmp matches 1000000.. if score $custom_hud/player_pos.removed_z fetchr.tmp matches ..2 run function fetchr:custom_hud/components/player_position/update_xz/calculate_fixed_point_z

execute if score $custom_hud/player_pos.z fetchr.tmp matches ..-1 run scoreboard players operation $custom_hud/player_pos.int_z fetchr.tmp *= -1 fetchr.const
data modify storage io.fetchr:custom_hud component.textComponent set value '[{"score": {"name": "$custom_hud/player_pos.x", "objective": "fetchr.tmp"}}, " ", {"score": {"name": "$custom_hud/player_pos.int_z", "objective": "fetchr.tmp"}}, ".", {"storage": "tmp.fetchr:custom_hud", "nbt": "zFillerZeros", "interpret": true}, {"score": {"name": "$custom_hud/player_pos.dec_z", "objective": "fetchr.tmp"}}, {"storage": "tmp.fetchr:custom_hud", "nbt": "zChar"}]'