#> bingo:game/emerald_detection/chunk/find_valid_coordinate
#
# This function simulates Minecraft's
# net.minecraft.world.level.biome.FuzzyOffsetBiomeZoomer and tries to
# brute-force a location within the current biome location where the biome will
# actually match what's stored at the corresponding biome coordinates.
#
# Minecraft handles biomes as a 4x4x4 cube and interpolates on that later on.
# To find the true biome, we neewd to first find a location where the
# interpolated biome layout matches what should be at this location.
#
# Decorations (like emeralds) depend on the raw biome values.
#
# @within
# 	function bingo:game/emerald_detection/chunk/*

#region setup
scoreboard players remove $detect_emerald/chunk.x bingo.tmp 2
scoreboard players remove $detect_emerald/chunk.y bingo.tmp 2
scoreboard players remove $detect_emerald/chunk.z bingo.tmp 2


#>
# Temporary score holder that may only be used to store a value that is needed
# as part of a bigger calculation.
#
# @private
#declare score_holder $detect_emerald/chunk.tmp

#>
# Yes this function is that bad.
#
# @private
#declare score_holder $detect_emerald/chunk.tmp2

#>
# @private
#declare score_holder $detect_emerald/chunk.biomex_neg_offset
scoreboard players operation $detect_emerald/chunk.biomex_neg_offset bingo.tmp = $detect_emerald/chunk.x bingo.tmp
scoreboard players operation $detect_emerald/chunk.biomex_neg_offset bingo.tmp /= 4 bingo.const

#>
# @private
#declare score_holder $detect_emerald/chunk.biomey_neg_offset
scoreboard players operation $detect_emerald/chunk.biomey_neg_offset bingo.tmp = $detect_emerald/chunk.y bingo.tmp
scoreboard players operation $detect_emerald/chunk.biomey_neg_offset bingo.tmp /= 4 bingo.const

#>
# @private
#declare score_holder $detect_emerald/chunk.biomez_neg_offset
scoreboard players operation $detect_emerald/chunk.biomez_neg_offset bingo.tmp = $detect_emerald/chunk.z bingo.tmp
scoreboard players operation $detect_emerald/chunk.biomez_neg_offset bingo.tmp /= 4 bingo.const

#>
# @private
#declare score_holder $detect_emerald/chunk.biomex_mod_neg_off
scoreboard players operation $detect_emerald/chunk.biomex_mod_neg_off bingo.tmp = $detect_emerald/chunk.x bingo.tmp
scoreboard players operation $detect_emerald/chunk.biomex_mod_neg_off bingo.tmp %= 4 bingo.const

#>
# @private
#declare score_holder $detect_emerald/chunk.biomey_mod_neg_off
scoreboard players operation $detect_emerald/chunk.biomey_mod_neg_off bingo.tmp = $detect_emerald/chunk.y bingo.tmp
scoreboard players operation $detect_emerald/chunk.biomey_mod_neg_off bingo.tmp %= 4 bingo.const

#>
# @private
#declare score_holder $detect_emerald/chunk.biomez_mod_neg_off
scoreboard players operation $detect_emerald/chunk.biomez_mod_neg_off bingo.tmp = $detect_emerald/chunk.z bingo.tmp
scoreboard players operation $detect_emerald/chunk.biomez_mod_neg_off bingo.tmp %= 4 bingo.const

#>
# @private
#declare score_holder $detect_emerald/chunk.biomex_pos_offset
scoreboard players operation $detect_emerald/chunk.biomex_pos_offset bingo.tmp = $detect_emerald/chunk.biomex_neg_offset bingo.tmp
scoreboard players add $detect_emerald/chunk.biomex_pos_offset bingo.tmp 1

#>
# @private
#declare score_holder $detect_emerald/chunk.biomey_pos_offset
scoreboard players operation $detect_emerald/chunk.biomey_pos_offset bingo.tmp = $detect_emerald/chunk.biomey_neg_offset bingo.tmp
scoreboard players add $detect_emerald/chunk.biomey_pos_offset bingo.tmp 1

#>
# @private
#declare score_holder $detect_emerald/chunk.biomez_pos_offset
scoreboard players operation $detect_emerald/chunk.biomez_pos_offset bingo.tmp = $detect_emerald/chunk.biomez_neg_offset bingo.tmp
scoreboard players add $detect_emerald/chunk.biomez_pos_offset bingo.tmp 1

#>
# @private
#declare score_holder $detect_emerald/chunk.biomex_mod_pos_off
scoreboard players operation $detect_emerald/chunk.biomex_mod_pos_off bingo.tmp = $detect_emerald/chunk.biomex_mod_neg_off bingo.tmp
scoreboard players remove $detect_emerald/chunk.biomex_mod_pos_off bingo.tmp 4

#>
# @private
#declare score_holder $detect_emerald/chunk.biomey_mod_pos_off
scoreboard players operation $detect_emerald/chunk.biomey_mod_pos_off bingo.tmp = $detect_emerald/chunk.biomey_mod_neg_off bingo.tmp
scoreboard players remove $detect_emerald/chunk.biomey_mod_pos_off bingo.tmp 4

#>
# @private
#declare score_holder $detect_emerald/chunk.biomez_mod_pos_off
scoreboard players operation $detect_emerald/chunk.biomez_mod_pos_off bingo.tmp = $detect_emerald/chunk.biomez_mod_neg_off bingo.tmp
scoreboard players remove $detect_emerald/chunk.biomez_mod_pos_off bingo.tmp 4
#endregion

#region for loop setup
#>
# This bitmask is what determins how the biomex/y/z coordinates are offset.
#
# The for loop calculates the distance for each possible bitmask and uses the
# bitmask with the lowest distance
#
# 100 bit set: biomex uses positive offset
# 010 bit set: biomey uses positive offset
# 001 bit set: biomez uses positive offset
#
# @private
#declare score_holder $detect_emerald/chunk.biome_offset_mask
scoreboard players set $detect_emerald/chunk.biome_offset_mask bingo.tmp -1

#>
# The lowest found distance so far
#
# @private
#declare score_holder $detect_emerald/chunk.min_distance
scoreboard players set $detect_emerald/chunk.min_distance bingo.tmp 2147483647
#endregion

#region for i in 0..7
# This for loop calculates 8 distances. 
# i = 0 (bitmask 000)

#region Technically first lcg call, but most of it pre-calculated, just need to
#       add the salt.

#>
# Current lcg seed. This is pre-initialized with the seed after the first lcg
# call minue the salt.
#
# The lower value has the 1st bit flipped to save a command during overflow
# calculation
#
# The seed uses 64 bit. This contains the lower 32 bits
#
# @private
#declare score_holder $detect_emerald/chunk.seed_low
scoreboard players set $detect_emerald/chunk.seed_low bingo.tmp -1599338048
#>
# The higher bits of $detect_emerald/chunk.seed_low
#
# @private
#declare score_holder $detect_emerald/chunk.seed_high
scoreboard players set $detect_emerald/chunk.seed_high bingo.tmp 2116576316

#>
# After the addition, an overflow check takes place. That is result < right term
# with an unsigned compare.
#
# To do an unsigned compare with signed integers, the leftmost bit of both terms
# need to be flipped.
#
# Since it's the leftmost bit, it's possible to just add 0x8000_0000 =
# -2147483648.
#
# This variable holds one of the terms storing the term with the inverted bit
#
# @private
#declare score_holder $detect_emerald/chunk.overflow_check

# Add salt (in this case biome x)
## If salt is negative, add 0xFFFF_FFFF to higher bits.
execute if score $detect_emerald/chunk.biomex_neg_offset bingo.tmp matches ..-1 run scoreboard players remove $detect_emerald/chunk.seed_high bingo.tmp 1

## Add lower salt bits with overflow detection
scoreboard players operation $detect_emerald/chunk.seed_low bingo.tmp += $detect_emerald/chunk.biomex_neg_offset bingo.tmp
scoreboard players set $detect_emerald/chunk.overflow_check bingo.tmp -2147483648
scoreboard players operation $detect_emerald/chunk.overflow_check bingo.tmp += $detect_emerald/chunk.biomex_neg_offset bingo.tmp
execute if score $detect_emerald/chunk.seed_low bingo.tmp < $detect_emerald/chunk.overflow_check bingo.tmp run scoreboard players add $detect_emerald/chunk.seed_high bingo.tmp 1
scoreboard players operation $detect_emerald/chunk.seed_low bingo.tmp += -2147483648 bingo.const
#endregion

#region LCG call

#region seed * 6364136223846793005

#>
# The lower bits of the multiplication result
#
# @private
#declare score_holder $detect_emerald/chunk.mult_low

#>
# The higher bits of the multiplication result
#
# @private
#declare score_holder $detect_emerald/chunk.mult_high

#>
# The lower 16 bits of seed low
#
# @private
#declare score_holder $detect_emerald/chunk.seed_low_low
scoreboard players operation $detect_emerald/chunk.seed_low_low bingo.tmp = $detect_emerald/chunk.seed_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.seed_low_low bingo.tmp %= 65536 bingo.const

#>
# The higher 16 bits of seed low
#
# @private
#declare score_holder $detect_emerald/chunk.seed_low_high
scoreboard players operation $detect_emerald/chunk.seed_low_high bingo.tmp = $detect_emerald/chunk.seed_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.seed_low_high bingo.tmp /= 65536 bingo.const
execute if score $detect_emerald/chunk.seed_low_high bingo.tmp matches ..-1 run scoreboard players add $detect_emerald/chunk.seed_low_high bingo.tmp 65536

# Multiply seed_low_low * constant_low_high and seed_low_high * constant_low_low
# Since low_high is basically rightshifted by 16, to compensate, these need to
# be left-shifted by 16 when adding
#
# Since the calculation result of mutiplying to 16bit integers needs a 32 bit
# integer, this will be leftshifted by 16 and added to lower and rightshifted by
# 16 and added to higher.
#
# In the end, the result of these will be "in between" low and high

#>
# @private
#declare score_holder $detect_emerald/chunk.middle1
scoreboard players set $detect_emerald/chunk.middle1 bingo.tmp 19605
scoreboard players operation $detect_emerald/chunk.middle1 bingo.tmp *= $detect_emerald/chunk.seed_low_low bingo.tmp

#>
# @private
#declare score_holder $detect_emerald/chunk.middle2
scoreboard players set $detect_emerald/chunk.middle2 bingo.tmp 32557
scoreboard players operation $detect_emerald/chunk.middle2 bingo.tmp *= $detect_emerald/chunk.seed_low_high bingo.tmp

# Calculate high bits
scoreboard players set $detect_emerald/chunk.mult_high bingo.tmp 1284865837
scoreboard players operation $detect_emerald/chunk.mult_high bingo.tmp *= $detect_emerald/chunk.seed_high bingo.tmp

scoreboard players set $detect_emerald/chunk.tmp bingo.tmp 1481765933
scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp *= $detect_emerald/chunk.seed_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.mult_high bingo.tmp += $detect_emerald/chunk.tmp bingo.tmp

scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp = $detect_emerald/chunk.middle1 bingo.tmp
scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp /= 65536 bingo.const
execute if score $detect_emerald/chunk.tmp bingo.tmp matches ..-1 run scoreboard players add $detect_emerald/chunk.tmp bingo.tmp 65536
scoreboard players operation $detect_emerald/chunk.mult_high bingo.tmp += $detect_emerald/chunk.tmp bingo.tmp

scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp = $detect_emerald/chunk.middle2 bingo.tmp
scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp /= 65536 bingo.const
execute if score $detect_emerald/chunk.tmp bingo.tmp matches ..-1 run scoreboard players add $detect_emerald/chunk.tmp bingo.tmp 65536
scoreboard players operation $detect_emerald/chunk.mult_high bingo.tmp += $detect_emerald/chunk.tmp bingo.tmp

scoreboard players set $detect_emerald/chunk.tmp bingo.tmp 19605
scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp *= $detect_emerald/chunk.seed_low_high bingo.tmp
scoreboard players operation $detect_emerald/chunk.mult_high bingo.tmp += $detect_emerald/chunk.tmp bingo.tmp

# calculate low bits
scoreboard players set $detect_emerald/chunk.mult_low bingo.tmp 32557
scoreboard players operation $detect_emerald/chunk.mult_low bingo.tmp *= $detect_emerald/chunk.seed_low_low bingo.tmp

## Add middle 1
scoreboard players operation $detect_emerald/chunk.middle1 bingo.tmp *= 65536 bingo.const
## Overflow detection (if mult_low < middle1, unsigned compare)
scoreboard players operation $detect_emerald/chunk.mult_low bingo.tmp += $detect_emerald/chunk.middle1 bingo.tmp
scoreboard players operation $detect_emerald/chunk.middle1 bingo.tmp += -2147483648 bingo.const
scoreboard players set $detect_emerald/chunk.overflow_check bingo.tmp -2147483648
scoreboard players operation $detect_emerald/chunk.overflow_check bingo.tmp += $detect_emerald/chunk.mult_low bingo.tmp
execute if score $detect_emerald/chunk.overflow_check bingo.tmp < $detect_emerald/chunk.middle1 bingo.tmp run scoreboard players add $detect_emerald/chunk.mult_high bingo.tmp 1

## Add middle 2
scoreboard players operation $detect_emerald/chunk.middle2 bingo.tmp *= 65536 bingo.const
## Overflow detection
scoreboard players operation $detect_emerald/chunk.mult_low bingo.tmp += $detect_emerald/chunk.middle2 bingo.tmp
scoreboard players operation $detect_emerald/chunk.overflow_check bingo.tmp += $detect_emerald/chunk.middle2 bingo.tmp
scoreboard players operation $detect_emerald/chunk.middle2 bingo.tmp += -2147483648 bingo.const
execute if score $detect_emerald/chunk.overflow_check bingo.tmp < $detect_emerald/chunk.middle2 bingo.tmp run scoreboard players add $detect_emerald/chunk.mult_high bingo.tmp 1
#endregion

# Add c
scoreboard players remove $detect_emerald/chunk.mult_low bingo.tmp 144211633
scoreboard players remove $detect_emerald/chunk.overflow_check bingo.tmp 144211633
execute if score $detect_emerald/chunk.overflow_check bingo.tmp matches ..2003272016 run scoreboard players add $detect_emerald/chunk.mult_high bingo.tmp 1

scoreboard players add $detect_emerald/chunk.mult_high bingo.tmp 335903614

#region seed *= mult
#endregion
#endregion