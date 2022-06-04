#> bingo:custom_hud/components/player_position/update_xz/shorten_both
#
# This function shortens
#
# @within function bingo:custom_hud/components/player_position/update_xz/shorten

#>
# The max amount of digits that can be removed from the coordinate with the
# lower absolute value.
#
# @within
# 	function bingo:custom_hud/components/player_position/update_xz/shorten_both
# 	function bingo:custom_hud/components/player_position/update_xz/shorten_both_iter
#declare score_holder $custom_hud/player_pos.max_secondary
#>
# The remaining digits of the x coordinate
#
# @within
# 	function bingo:custom_hud/components/player_position/update_xz/shorten_both
# 	function bingo:custom_hud/components/player_position/update_xz/shorten_both_iter
# 	function bingo:custom_hud/components/player_position/update_xz/shorten_x_iter
#declare score_holder $custom_hud/player_pos.short_x
#>
# The remaining digits of the z coordinate
#
# @within
# 	function bingo:custom_hud/components/player_position/update_xz/shorten_both
# 	function bingo:custom_hud/components/player_position/update_xz/shorten_both_iter
# 	function bingo:custom_hud/components/player_position/update_xz/shorten_z_iter
#declare score_holder $custom_hud/player_pos.short_z
#>
# The current amount of removed digits for x.
#
# @within
# 	function bingo:custom_hud/components/player_position/update_xz/shorten_both
# 	function bingo:custom_hud/components/player_position/update_xz/shorten_both_iter
# 	function bingo:custom_hud/components/player_position/update_xz/shorten_x_iter
#declare score_holder $custom_hud/player_pos.removed_x
#>
# The current amount of removed digits for z.
#
# @within
# 	function bingo:custom_hud/components/player_position/update_xz/shorten_both
# 	function bingo:custom_hud/components/player_position/update_xz/shorten_both_iter
# 	function bingo:custom_hud/components/player_position/update_xz/shorten_z_iter
#declare score_holder $custom_hud/player_pos.removed_z

scoreboard players set $custom_hud/player_pos.max_secondary bingo.tmp 6

execute if score $custom_hud/player_pos.abs_x bingo.tmp matches ..999999 run scoreboard players set $custom_hud/player_pos.max_secondary bingo.tmp 3
execute if score $custom_hud/player_pos.abs_z bingo.tmp matches ..999999 run scoreboard players set $custom_hud/player_pos.max_secondary bingo.tmp 3

# Use absolute value for now so that integer division cuts of digits (Mojang
# uses floor_div and floor_mod, which is a good thing in most applications and
# can easily be mitigated like this for when it isn't)
scoreboard players operation $custom_hud/player_pos.short_x bingo.tmp = $custom_hud/player_pos.abs_x bingo.tmp
scoreboard players operation $custom_hud/player_pos.short_z bingo.tmp = $custom_hud/player_pos.abs_z bingo.tmp

# At least 2 digits need to be removed.
scoreboard players operation $custom_hud/player_pos.short_x bingo.tmp /= 100 bingo.const
scoreboard players operation $custom_hud/player_pos.short_z bingo.tmp /= 100 bingo.const
scoreboard players set $custom_hud/player_pos.removed_x bingo.tmp 2
scoreboard players set $custom_hud/player_pos.removed_z bingo.tmp 2
scoreboard players remove $custom_hud/width.characters bingo.io 2

# Remove 2 digits (width 12) and add per coordinate:
#   - decimal point (width 2)
#   - Either k for kilo (width 5) or M for million (width 6)
# Total is either 5 or 4
execute if score $custom_hud/player_pos.abs_x bingo.tmp matches ..999999 run scoreboard players add $custom_hud/width.padding bingo.io 5
execute if score $custom_hud/player_pos.abs_x bingo.tmp matches ..999999 run data modify storage tmp.bingo:custom_hud xChar set value "k"
execute unless score $custom_hud/player_pos.abs_x bingo.tmp matches ..999999 run scoreboard players add $custom_hud/width.padding bingo.io 4
execute unless score $custom_hud/player_pos.abs_x bingo.tmp matches ..999999 run data modify storage tmp.bingo:custom_hud xChar set value "M"
execute if score $custom_hud/player_pos.abs_z bingo.tmp matches ..999999 run scoreboard players add $custom_hud/width.padding bingo.io 5
execute if score $custom_hud/player_pos.abs_z bingo.tmp matches ..999999 run data modify storage tmp.bingo:custom_hud zChar set value "k"
execute unless score $custom_hud/player_pos.abs_z bingo.tmp matches ..999999 run scoreboard players add $custom_hud/width.padding bingo.io 4
execute unless score $custom_hud/player_pos.abs_z bingo.tmp matches ..999999 run data modify storage tmp.bingo:custom_hud zChar set value "M"

execute if score $custom_hud/width.characters bingo.io matches 13.. run function bingo:custom_hud/components/player_position/update_xz/shorten_both_iter
execute if score $custom_hud/width.characters bingo.io matches 12.. if score $custom_hud/player_pos.abs_x bingo.tmp >= $custom_hud/player_pos.abs_z bingo.tmp run function bingo:custom_hud/components/player_position/update_xz/shorten_x_iter
execute if score $custom_hud/width.characters bingo.io matches 12.. if score $custom_hud/player_pos.abs_z bingo.tmp > $custom_hud/player_pos.abs_x bingo.tmp run function bingo:custom_hud/components/player_position/update_xz/shorten_z_iter

#>
# Current decimal digits
#
# @within
# 	function bingo:custom_hud/components/player_position/update_xz/shorten_both
# 	function bingo:custom_hud/components/player_position/update_xz/calculate_fixed_point_x
# 	function bingo:custom_hud/components/player_position/update_xz/calculate_fixed_point_z
#declare score_holder $custom_hud/player_pos.decimal_digits
#>
# @within
# 	function bingo:custom_hud/components/player_position/update_xz/shorten_both
# 	function bingo:custom_hud/components/player_position/update_xz/calculate_fixed_point_x
# 	function bingo:custom_hud/components/player_position/update_xz/calculate_fixed_point_z
#declare score_holder $custom_hud/player_pos.ten_pow

#>
# Integer portion of x
#
# @within
# 	function bingo:custom_hud/components/player_position/update_xz/shorten_both
# 	function bingo:custom_hud/components/player_position/update_xz/calculate_fixed_point_x
#declare score_holder $custom_hud/player_pos.int_x
scoreboard players operation $custom_hud/player_pos.int_x bingo.tmp = $custom_hud/player_pos.short_x bingo.tmp
#>
# Decimal portion of x
#
# @within
# 	function bingo:custom_hud/components/player_position/update_xz/shorten_both
# 	function bingo:custom_hud/components/player_position/update_xz/calculate_fixed_point_x
#declare score_holder $custom_hud/player_pos.dec_x
scoreboard players set $custom_hud/player_pos.dec_x bingo.tmp 0
data modify storage tmp.bingo:custom_hud xFillerZeros set value [""]
scoreboard players set $custom_hud/player_pos.ten_pow bingo.tmp 1
scoreboard players operation $custom_hud/player_pos.decimal_digits bingo.tmp = $custom_hud/player_pos.removed_x bingo.tmp
execute if score $custom_hud/player_pos.abs_x bingo.tmp matches 1000000.. run function bingo:custom_hud/components/player_position/update_xz/calculate_fixed_point_x
execute unless score $custom_hud/player_pos.abs_x bingo.tmp matches 1000000.. if score $custom_hud/player_pos.removed_x bingo.tmp matches ..2 run function bingo:custom_hud/components/player_position/update_xz/calculate_fixed_point_x

#>
# Integer portion of z
#
# @within
# 	function bingo:custom_hud/components/player_position/update_xz/shorten_both
# 	function bingo:custom_hud/components/player_position/update_xz/calculate_fixed_point_z
#declare score_holder $custom_hud/player_pos.int_z
scoreboard players operation $custom_hud/player_pos.int_z bingo.tmp = $custom_hud/player_pos.short_z bingo.tmp
#>
# Decimal portion of z
#
# @within
# 	function bingo:custom_hud/components/player_position/update_xz/shorten_both
# 	function bingo:custom_hud/components/player_position/update_xz/calculate_fixed_point_z
#declare score_holder $custom_hud/player_pos.dec_z
scoreboard players set $custom_hud/player_pos.dec_z bingo.tmp 0
data modify storage tmp.bingo:custom_hud zFillerZeros set value [""]
scoreboard players set $custom_hud/player_pos.ten_pow bingo.tmp 1
scoreboard players operation $custom_hud/player_pos.decimal_digits bingo.tmp = $custom_hud/player_pos.removed_z bingo.tmp
execute if score $custom_hud/player_pos.abs_z bingo.tmp matches 1000000.. run function bingo:custom_hud/components/player_position/update_xz/calculate_fixed_point_z
execute unless score $custom_hud/player_pos.abs_z bingo.tmp matches 1000000.. if score $custom_hud/player_pos.removed_z bingo.tmp matches ..2 run function bingo:custom_hud/components/player_position/update_xz/calculate_fixed_point_z

execute if score $custom_hud/player_pos.x bingo.tmp matches ..-1 run scoreboard players operation $custom_hud/player_pos.int_x bingo.tmp *= -1 bingo.const
execute if score $custom_hud/player_pos.z bingo.tmp matches ..-1 run scoreboard players operation $custom_hud/player_pos.int_z bingo.tmp *= -1 bingo.const

data modify storage io.bingo:custom_hud component.textComponent set value '[{"storage": "tmp.bingo:custom_hud", "nbt": "xComp", "interpret": true}, " ", {"storage": "tmp.bingo:custom_hud", "nbt": "zComp", "interpret": true}]'

data modify storage tmp.bingo:custom_hud xComp set value '[{"score": {"name": "$custom_hud/player_pos.int_x", "objective": "bingo.tmp"}}, ".", {"storage": "tmp.bingo:custom_hud", "nbt": "xFillerZeros", "interpret": true}, {"score": {"name": "$custom_hud/player_pos.dec_x", "objective": "bingo.tmp"}}, {"storage": "tmp.bingo:custom_hud", "nbt": "xChar"}]'
execute if score $custom_hud/player_pos.abs_x bingo.tmp matches ..999999 if score $custom_hud/player_pos.removed_x bingo.tmp matches 3 run data modify storage tmp.bingo:custom_hud xComp set value '[{"score": {"name": "$custom_hud/player_pos.int_x", "objective": "bingo.tmp"}}, {"storage": "tmp.bingo:custom_hud", "nbt": "xChar"}]'
execute if score $custom_hud/player_pos.abs_x bingo.tmp matches ..999999 if score $custom_hud/player_pos.removed_x bingo.tmp matches 3 run scoreboard players add $custom_hud/width.padding bingo.io 2

data modify storage tmp.bingo:custom_hud zComp set value '[{"score": {"name": "$custom_hud/player_pos.int_z", "objective": "bingo.tmp"}}, ".", {"storage": "tmp.bingo:custom_hud", "nbt": "zFillerZeros", "interpret": true}, {"score": {"name": "$custom_hud/player_pos.dec_z", "objective": "bingo.tmp"}}, {"storage": "tmp.bingo:custom_hud", "nbt": "zChar"}]'
execute if score $custom_hud/player_pos.abs_z bingo.tmp matches ..999999 if score $custom_hud/player_pos.removed_z bingo.tmp matches 3 run data modify storage tmp.bingo:custom_hud zComp set value '[{"score": {"name": "$custom_hud/player_pos.int_z", "objective": "bingo.tmp"}}, {"storage": "tmp.bingo:custom_hud", "nbt": "zChar"}]'
execute if score $custom_hud/player_pos.abs_z bingo.tmp matches ..999999 if score $custom_hud/player_pos.removed_z bingo.tmp matches 3 run scoreboard players add $custom_hud/width.padding bingo.io 2