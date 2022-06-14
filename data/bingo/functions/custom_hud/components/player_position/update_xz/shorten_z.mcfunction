#> bingo:custom_hud/components/player_position/update_xz/shorten_z
#
# This function shortens
#
# @within function bingo:custom_hud/components/player_position/update_xz/shorten

#>
# The remaining digits of the z coordinate
#
# @within
# 	function bingo:custom_hud/components/player_position/update_xz/shorten_z
# 	function bingo:custom_hud/components/player_position/update_xz/shorten_z_iter
#declare score_holder $custom_hud/player_pos.short_z
#>
# The current amount of removed digits
#
# @within
# 	function bingo:custom_hud/components/player_position/update_xz/shorten_z
# 	function bingo:custom_hud/components/player_position/update_xz/shorten_z_iter
#declare score_holder $custom_hud/player_pos.removed_z

# Use absolute value for now so that integer division cuts of digits (Mojang
# uses floor_div and floor_mod, which is a good thing in most applications and
# can easily be mitigated like this for when it isn't)
scoreboard players operation $custom_hud/player_pos.short_z bingo.tmp = $custom_hud/player_pos.abs_z bingo.tmp

# At least 2 digits need to be removed.
scoreboard players operation $custom_hud/player_pos.short_z bingo.tmp /= 100 bingo.const
scoreboard players set $custom_hud/player_pos.removed_z bingo.tmp 2
scoreboard players remove $custom_hud/width.characters bingo.io 1

# Remove 2 digits (width 12) and add per coordinate:
#   - decimal point (width 2)
#   - Either k for kilo (width 5) or M for million (width 6)
# Total is either 5 or 4
execute if score $custom_hud/player_pos.abs_z bingo.tmp matches ..999999 run scoreboard players add $custom_hud/width.padding bingo.io 5
execute if score $custom_hud/player_pos.abs_z bingo.tmp matches ..999999 run data modify storage tmp.bingo:custom_hud zChar set value "k"
execute unless score $custom_hud/player_pos.abs_z bingo.tmp matches ..999999 run scoreboard players add $custom_hud/width.padding bingo.io 4
execute unless score $custom_hud/player_pos.abs_z bingo.tmp matches ..999999 run data modify storage tmp.bingo:custom_hud zChar set value "M"

execute if score $custom_hud/width.characters bingo.tmp matches 12.. if score $custom_hud/player_pos.abs_z bingo.tmp > $custom_hud/player_pos.abs_x bingo.tmp run function bingo:custom_hud/components/player_position/update_xz/shorten_z_iter

#>
# Current decimal digits
#
# @within
# 	function bingo:custom_hud/components/player_position/update_xz/shorten_z
# 	function bingo:custom_hud/components/player_position/update_xz/calculate_fixed_point_z
#declare score_holder $custom_hud/player_pos.decimal_digits
#>
# @within
# 	function bingo:custom_hud/components/player_position/update_xz/shorten_z
# 	function bingo:custom_hud/components/player_position/update_xz/calculate_fixed_point_z
#declare score_holder $custom_hud/player_pos.ten_pow

#>
# Integer portion of z
#
# @within
# 	function bingo:custom_hud/components/player_position/update_xz/shorten_z
# 	function bingo:custom_hud/components/player_position/update_xz/calculate_fixed_point_z
#declare score_holder $custom_hud/player_pos.int_z
scoreboard players operation $custom_hud/player_pos.int_z bingo.tmp = $custom_hud/player_pos.short_z bingo.tmp
#>
# Decimal portion of x
#
# @within
# 	function bingo:custom_hud/components/player_position/update_xz/shorten_z
# 	function bingo:custom_hud/components/player_position/update_xz/calculate_fixed_point_z
#declare score_holder $custom_hud/player_pos.dec_z
scoreboard players set $custom_hud/player_pos.dec_z bingo.tmp 0
data modify storage tmp.bingo:custom_hud zFillerZeros set value [""]
scoreboard players set $custom_hud/player_pos.ten_pow bingo.tmp 1
scoreboard players operation $custom_hud/player_pos.decimal_digits bingo.tmp = $custom_hud/player_pos.removed_z bingo.tmp
execute if score $custom_hud/player_pos.abs_z bingo.tmp matches 1000000.. run function bingo:custom_hud/components/player_position/update_xz/calculate_fixed_point_z
execute unless score $custom_hud/player_pos.abs_z bingo.tmp matches 1000000.. if score $custom_hud/player_pos.removed_z bingo.tmp matches ..2 run function bingo:custom_hud/components/player_position/update_xz/calculate_fixed_point_z

execute if score $custom_hud/player_pos.z bingo.tmp matches ..-1 run scoreboard players operation $custom_hud/player_pos.int_z bingo.tmp *= -1 bingo.const
data modify storage io.bingo:custom_hud component.textComponent set value '[{"score": {"name": "$custom_hud/player_pos.x", "objective": "bingo.tmp"}}, " ", {"score": {"name": "$custom_hud/player_pos.int_z", "objective": "bingo.tmp"}}, ".", {"storage": "tmp.bingo:custom_hud", "nbt": "zFillerZeros", "interpret": true}, {"score": {"name": "$custom_hud/player_pos.dec_z", "objective": "bingo.tmp"}}, {"storage": "tmp.bingo:custom_hud", "nbt": "zChar"}]'