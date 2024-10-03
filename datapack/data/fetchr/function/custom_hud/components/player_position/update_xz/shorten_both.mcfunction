#> fetchr:custom_hud/components/player_position/update_xz/shorten_both
#
# This function shortens
#
# @within function fetchr:custom_hud/components/player_position/update_xz/shorten

#>
# The max amount of digits that can be removed from the coordinate with the
# lower absolute value.
#
# @within
# 	function fetchr:custom_hud/components/player_position/update_xz/shorten_both
# 	function fetchr:custom_hud/components/player_position/update_xz/shorten_both_iter
#declare score_holder $custom_hud/player_pos.max_secondary
#>
# The remaining digits of the x coordinate
#
# @within
# 	function fetchr:custom_hud/components/player_position/update_xz/shorten_both
# 	function fetchr:custom_hud/components/player_position/update_xz/shorten_both_iter
# 	function fetchr:custom_hud/components/player_position/update_xz/shorten_x_iter
#declare score_holder $custom_hud/player_pos.short_x
#>
# The remaining digits of the z coordinate
#
# @within
# 	function fetchr:custom_hud/components/player_position/update_xz/shorten_both
# 	function fetchr:custom_hud/components/player_position/update_xz/shorten_both_iter
# 	function fetchr:custom_hud/components/player_position/update_xz/shorten_z_iter
#declare score_holder $custom_hud/player_pos.short_z
#>
# The current amount of removed digits for x.
#
# @within
# 	function fetchr:custom_hud/components/player_position/update_xz/shorten_both
# 	function fetchr:custom_hud/components/player_position/update_xz/shorten_both_iter
# 	function fetchr:custom_hud/components/player_position/update_xz/shorten_x_iter
#declare score_holder $custom_hud/player_pos.removed_x
#>
# The current amount of removed digits for z.
#
# @within
# 	function fetchr:custom_hud/components/player_position/update_xz/shorten_both
# 	function fetchr:custom_hud/components/player_position/update_xz/shorten_both_iter
# 	function fetchr:custom_hud/components/player_position/update_xz/shorten_z_iter
#declare score_holder $custom_hud/player_pos.removed_z

scoreboard players set $custom_hud/player_pos.max_secondary fetchr.tmp 6

execute if score $custom_hud/player_pos.abs_x fetchr.tmp matches ..999999 run scoreboard players set $custom_hud/player_pos.max_secondary fetchr.tmp 3
execute if score $custom_hud/player_pos.abs_z fetchr.tmp matches ..999999 run scoreboard players set $custom_hud/player_pos.max_secondary fetchr.tmp 3

# Use absolute value for now so that integer division cuts of digits (Mojang
# uses floor_div and floor_mod, which is a good thing in most applications and
# can easily be mitigated like this for when it isn't)
scoreboard players operation $custom_hud/player_pos.short_x fetchr.tmp = $custom_hud/player_pos.abs_x fetchr.tmp
scoreboard players operation $custom_hud/player_pos.short_z fetchr.tmp = $custom_hud/player_pos.abs_z fetchr.tmp

# At least 2 digits need to be removed.
scoreboard players operation $custom_hud/player_pos.short_x fetchr.tmp /= 100 fetchr.const
scoreboard players operation $custom_hud/player_pos.short_z fetchr.tmp /= 100 fetchr.const
scoreboard players set $custom_hud/player_pos.removed_x fetchr.tmp 2
scoreboard players set $custom_hud/player_pos.removed_z fetchr.tmp 2

# Remove 2 digits (width 12) and add per coordinate:
#   - decimal point (width 2)
#   - Either k for kilo (width 5) or M for million (width 6)
# Total is either 5 or 4
execute if score $custom_hud/player_pos.abs_x fetchr.tmp matches ..999999 run scoreboard players add $custom_hud/width.padding fetchr.io 5
execute if score $custom_hud/player_pos.abs_x fetchr.tmp matches ..999999 run data modify storage tmp.fetchr:custom_hud xChar set value "k"
execute unless score $custom_hud/player_pos.abs_x fetchr.tmp matches ..999999 run scoreboard players add $custom_hud/width.padding fetchr.io 4
execute unless score $custom_hud/player_pos.abs_x fetchr.tmp matches ..999999 run data modify storage tmp.fetchr:custom_hud xChar set value "M"
execute if score $custom_hud/player_pos.abs_z fetchr.tmp matches ..999999 run scoreboard players add $custom_hud/width.padding fetchr.io 5
execute if score $custom_hud/player_pos.abs_z fetchr.tmp matches ..999999 run data modify storage tmp.fetchr:custom_hud zChar set value "k"
execute unless score $custom_hud/player_pos.abs_z fetchr.tmp matches ..999999 run scoreboard players add $custom_hud/width.padding fetchr.io 4
execute unless score $custom_hud/player_pos.abs_z fetchr.tmp matches ..999999 run data modify storage tmp.fetchr:custom_hud zChar set value "M"

execute if score $custom_hud/width.padding fetchr.io matches ..-7 run function fetchr:custom_hud/components/player_position/update_xz/shorten_both_iter
execute if score $custom_hud/width.padding fetchr.io matches ..-1 if score $custom_hud/player_pos.abs_x fetchr.tmp >= $custom_hud/player_pos.abs_z fetchr.tmp run function fetchr:custom_hud/components/player_position/update_xz/shorten_x_iter
execute if score $custom_hud/width.padding fetchr.io matches ..-1 if score $custom_hud/player_pos.abs_z fetchr.tmp > $custom_hud/player_pos.abs_x fetchr.tmp run function fetchr:custom_hud/components/player_position/update_xz/shorten_z_iter

#>
# Current decimal digits
#
# @within
# 	function fetchr:custom_hud/components/player_position/update_xz/shorten_both
# 	function fetchr:custom_hud/components/player_position/update_xz/calculate_fixed_point_x
# 	function fetchr:custom_hud/components/player_position/update_xz/calculate_fixed_point_z
#declare score_holder $custom_hud/player_pos.decimal_digits
#>
# @within
# 	function fetchr:custom_hud/components/player_position/update_xz/shorten_both
# 	function fetchr:custom_hud/components/player_position/update_xz/calculate_fixed_point_x
# 	function fetchr:custom_hud/components/player_position/update_xz/calculate_fixed_point_z
#declare score_holder $custom_hud/player_pos.ten_pow

#>
# Integer portion of x
#
# @within
# 	function fetchr:custom_hud/components/player_position/update_xz/shorten_both
# 	function fetchr:custom_hud/components/player_position/update_xz/calculate_fixed_point_x
#declare score_holder $custom_hud/player_pos.int_x
scoreboard players operation $custom_hud/player_pos.int_x fetchr.tmp = $custom_hud/player_pos.short_x fetchr.tmp
#>
# Decimal portion of x
#
# @within
# 	function fetchr:custom_hud/components/player_position/update_xz/shorten_both
# 	function fetchr:custom_hud/components/player_position/update_xz/calculate_fixed_point_x
#declare score_holder $custom_hud/player_pos.dec_x
scoreboard players set $custom_hud/player_pos.dec_x fetchr.tmp 0
data modify storage tmp.fetchr:custom_hud xFillerZeros set value [""]
scoreboard players set $custom_hud/player_pos.ten_pow fetchr.tmp 1
scoreboard players operation $custom_hud/player_pos.decimal_digits fetchr.tmp = $custom_hud/player_pos.removed_x fetchr.tmp
execute if score $custom_hud/player_pos.abs_x fetchr.tmp matches 1000000.. run function fetchr:custom_hud/components/player_position/update_xz/calculate_fixed_point_x
execute unless score $custom_hud/player_pos.abs_x fetchr.tmp matches 1000000.. if score $custom_hud/player_pos.removed_x fetchr.tmp matches ..2 run function fetchr:custom_hud/components/player_position/update_xz/calculate_fixed_point_x

#>
# Integer portion of z
#
# @within
# 	function fetchr:custom_hud/components/player_position/update_xz/shorten_both
# 	function fetchr:custom_hud/components/player_position/update_xz/calculate_fixed_point_z
#declare score_holder $custom_hud/player_pos.int_z
scoreboard players operation $custom_hud/player_pos.int_z fetchr.tmp = $custom_hud/player_pos.short_z fetchr.tmp
#>
# Decimal portion of z
#
# @within
# 	function fetchr:custom_hud/components/player_position/update_xz/shorten_both
# 	function fetchr:custom_hud/components/player_position/update_xz/calculate_fixed_point_z
#declare score_holder $custom_hud/player_pos.dec_z
scoreboard players set $custom_hud/player_pos.dec_z fetchr.tmp 0
data modify storage tmp.fetchr:custom_hud zFillerZeros set value [""]
scoreboard players set $custom_hud/player_pos.ten_pow fetchr.tmp 1
scoreboard players operation $custom_hud/player_pos.decimal_digits fetchr.tmp = $custom_hud/player_pos.removed_z fetchr.tmp
execute if score $custom_hud/player_pos.abs_z fetchr.tmp matches 1000000.. run function fetchr:custom_hud/components/player_position/update_xz/calculate_fixed_point_z
execute unless score $custom_hud/player_pos.abs_z fetchr.tmp matches 1000000.. if score $custom_hud/player_pos.removed_z fetchr.tmp matches ..2 run function fetchr:custom_hud/components/player_position/update_xz/calculate_fixed_point_z

execute if score $custom_hud/player_pos.x fetchr.tmp matches ..-1 run scoreboard players operation $custom_hud/player_pos.int_x fetchr.tmp *= -1 fetchr.const
execute if score $custom_hud/player_pos.z fetchr.tmp matches ..-1 run scoreboard players operation $custom_hud/player_pos.int_z fetchr.tmp *= -1 fetchr.const

data modify storage io.fetchr:custom_hud component.textComponent set value '[{"storage": "tmp.fetchr:custom_hud", "nbt": "xComp", "interpret": true}, " ", {"storage": "tmp.fetchr:custom_hud", "nbt": "zComp", "interpret": true}]'

data modify storage tmp.fetchr:custom_hud xComp set value '[{"score": {"name": "$custom_hud/player_pos.int_x", "objective": "fetchr.tmp"}}, ".", {"storage": "tmp.fetchr:custom_hud", "nbt": "xFillerZeros", "interpret": true}, {"score": {"name": "$custom_hud/player_pos.dec_x", "objective": "fetchr.tmp"}}, {"storage": "tmp.fetchr:custom_hud", "nbt": "xChar"}]'
execute if score $custom_hud/player_pos.abs_x fetchr.tmp matches ..999999 if score $custom_hud/player_pos.removed_x fetchr.tmp matches 3 run data modify storage tmp.fetchr:custom_hud xComp set value '[{"score": {"name": "$custom_hud/player_pos.int_x", "objective": "fetchr.tmp"}}, {"storage": "tmp.fetchr:custom_hud", "nbt": "xChar"}]'
execute if score $custom_hud/player_pos.abs_x fetchr.tmp matches ..999999 if score $custom_hud/player_pos.removed_x fetchr.tmp matches 3 run scoreboard players add $custom_hud/width.padding fetchr.io 2

data modify storage tmp.fetchr:custom_hud zComp set value '[{"score": {"name": "$custom_hud/player_pos.int_z", "objective": "fetchr.tmp"}}, ".", {"storage": "tmp.fetchr:custom_hud", "nbt": "zFillerZeros", "interpret": true}, {"score": {"name": "$custom_hud/player_pos.dec_z", "objective": "fetchr.tmp"}}, {"storage": "tmp.fetchr:custom_hud", "nbt": "zChar"}]'
execute if score $custom_hud/player_pos.abs_z fetchr.tmp matches ..999999 if score $custom_hud/player_pos.removed_z fetchr.tmp matches 3 run data modify storage tmp.fetchr:custom_hud zComp set value '[{"score": {"name": "$custom_hud/player_pos.int_z", "objective": "fetchr.tmp"}}, {"storage": "tmp.fetchr:custom_hud", "nbt": "zChar"}]'
execute if score $custom_hud/player_pos.abs_z fetchr.tmp matches ..999999 if score $custom_hud/player_pos.removed_z fetchr.tmp matches 3 run scoreboard players add $custom_hud/width.padding fetchr.io 2