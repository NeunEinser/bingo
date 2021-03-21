#> bingo:game/emerald_detection/chunk/find_valid_coordinate_5
#
# i = 6 (bitmask 110)
#
# @within function bingo:game/emerald_detection/chunk/find_valid_coordinate_4

#region load cached unsalted lcg result for lcg call 2

scoreboard players operation $detect_emerald/chunk.seed_low bingo.tmp = $detect_emerald/chunk.cache_px_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.seed_high bingo.tmp = $detect_emerald/chunk.cache_px_high bingo.tmp

# Add salt (in this case biome y pos offset)
## If salt is negative, add 0xFFFF_FFFF to higher bits.
execute if score $detect_emerald/chunk.biomey_pos_offset bingo.tmp matches ..-1 run scoreboard players remove $detect_emerald/chunk.seed_high bingo.tmp 1

## Add lower salt bits with overflow detection
scoreboard players operation $detect_emerald/chunk.seed_low bingo.tmp += $detect_emerald/chunk.biomey_pos_offset bingo.tmp
scoreboard players set $detect_emerald/chunk.overflow_check bingo.tmp -2147483648
scoreboard players operation $detect_emerald/chunk.overflow_check bingo.tmp += $detect_emerald/chunk.seed_low bingo.tmp
execute if score $detect_emerald/chunk.overflow_check bingo.tmp < $detect_emerald/chunk.biomey_pos_o_chk bingo.tmp run scoreboard players add $detect_emerald/chunk.seed_high bingo.tmp 1
#endregion

#region LCG call 3:
#       seed = seed * (seed * 6364136223846793005 + 1442695040888963407) + salt

#region mult = seed * 6364136223846793005 + 1442695040888963407
scoreboard players operation $detect_emerald/chunk.seed_low_low bingo.tmp = $detect_emerald/chunk.seed_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.seed_low_low bingo.tmp %= 65536 bingo.const

scoreboard players operation $detect_emerald/chunk.seed_low_high bingo.tmp = $detect_emerald/chunk.seed_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.seed_low_high bingo.tmp /= 65536 bingo.const
execute if score $detect_emerald/chunk.seed_low_high bingo.tmp matches ..-1 run scoreboard players add $detect_emerald/chunk.seed_low_high bingo.tmp 65536

scoreboard players set $detect_emerald/chunk.middle1 bingo.tmp 19605
scoreboard players operation $detect_emerald/chunk.middle1 bingo.tmp *= $detect_emerald/chunk.seed_low_low bingo.tmp

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
### Overflow detection (if mult_low < middle1, unsigned compare)
scoreboard players operation $detect_emerald/chunk.mult_low bingo.tmp += $detect_emerald/chunk.middle1 bingo.tmp
scoreboard players operation $detect_emerald/chunk.middle1 bingo.tmp += -2147483648 bingo.const
scoreboard players set $detect_emerald/chunk.overflow_check bingo.tmp -2147483648
scoreboard players operation $detect_emerald/chunk.overflow_check bingo.tmp += $detect_emerald/chunk.mult_low bingo.tmp
execute if score $detect_emerald/chunk.overflow_check bingo.tmp < $detect_emerald/chunk.middle1 bingo.tmp run scoreboard players add $detect_emerald/chunk.mult_high bingo.tmp 1

### Add middle 2
scoreboard players operation $detect_emerald/chunk.middle2 bingo.tmp *= 65536 bingo.const
### Overflow detection
scoreboard players operation $detect_emerald/chunk.mult_low bingo.tmp += $detect_emerald/chunk.middle2 bingo.tmp
scoreboard players operation $detect_emerald/chunk.overflow_check bingo.tmp += $detect_emerald/chunk.middle2 bingo.tmp
scoreboard players operation $detect_emerald/chunk.middle2 bingo.tmp += -2147483648 bingo.const
execute if score $detect_emerald/chunk.overflow_check bingo.tmp < $detect_emerald/chunk.middle2 bingo.tmp run scoreboard players add $detect_emerald/chunk.mult_high bingo.tmp 1

# Add c (1442695040888963407)
scoreboard players remove $detect_emerald/chunk.mult_low bingo.tmp 144211633
scoreboard players remove $detect_emerald/chunk.overflow_check bingo.tmp 144211633
execute if score $detect_emerald/chunk.overflow_check bingo.tmp matches ..2003272015 run scoreboard players add $detect_emerald/chunk.mult_high bingo.tmp 1

scoreboard players add $detect_emerald/chunk.mult_high bingo.tmp 335903614
#endregion

#region seed *= mult
scoreboard players operation $detect_emerald/chunk.mult_low_low bingo.tmp = $detect_emerald/chunk.mult_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.mult_low_low bingo.tmp %= 65536 bingo.const

scoreboard players operation $detect_emerald/chunk.mult_low_high bingo.tmp = $detect_emerald/chunk.mult_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.mult_low_high bingo.tmp /= 65536 bingo.const
execute if score $detect_emerald/chunk.mult_low_high bingo.tmp matches ..-1 run scoreboard players add $detect_emerald/chunk.mult_low_high bingo.tmp 65536

scoreboard players operation $detect_emerald/chunk.middle1 bingo.tmp = $detect_emerald/chunk.seed_low_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.middle1 bingo.tmp *= $detect_emerald/chunk.mult_low_high bingo.tmp

scoreboard players operation $detect_emerald/chunk.middle2 bingo.tmp = $detect_emerald/chunk.seed_low_high bingo.tmp
scoreboard players operation $detect_emerald/chunk.middle2 bingo.tmp *= $detect_emerald/chunk.mult_low_low bingo.tmp

# Calculate high bits
scoreboard players operation $detect_emerald/chunk.seed_high bingo.tmp *= $detect_emerald/chunk.mult_low bingo.tmp

scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp = $detect_emerald/chunk.mult_high bingo.tmp
scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp *= $detect_emerald/chunk.seed_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.seed_high bingo.tmp += $detect_emerald/chunk.tmp bingo.tmp

scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp = $detect_emerald/chunk.middle1 bingo.tmp
scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp /= 65536 bingo.const
execute if score $detect_emerald/chunk.tmp bingo.tmp matches ..-1 run scoreboard players add $detect_emerald/chunk.tmp bingo.tmp 65536
scoreboard players operation $detect_emerald/chunk.seed_high bingo.tmp += $detect_emerald/chunk.tmp bingo.tmp

scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp = $detect_emerald/chunk.middle2 bingo.tmp
scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp /= 65536 bingo.const
execute if score $detect_emerald/chunk.tmp bingo.tmp matches ..-1 run scoreboard players add $detect_emerald/chunk.tmp bingo.tmp 65536
scoreboard players operation $detect_emerald/chunk.seed_high bingo.tmp += $detect_emerald/chunk.tmp bingo.tmp

scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp = $detect_emerald/chunk.seed_low_high bingo.tmp
scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp *= $detect_emerald/chunk.mult_low_high bingo.tmp
scoreboard players operation $detect_emerald/chunk.seed_high bingo.tmp += $detect_emerald/chunk.tmp bingo.tmp

# Calculate low bits
scoreboard players operation $detect_emerald/chunk.seed_low bingo.tmp = $detect_emerald/chunk.seed_low_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.seed_low bingo.tmp *= $detect_emerald/chunk.mult_low_low bingo.tmp

## Add middle 1
scoreboard players operation $detect_emerald/chunk.middle1 bingo.tmp *= 65536 bingo.const
### Overflow detection (if mult_low < middle1, unsigned compare)
scoreboard players operation $detect_emerald/chunk.seed_low bingo.tmp += $detect_emerald/chunk.middle1 bingo.tmp
scoreboard players operation $detect_emerald/chunk.middle1 bingo.tmp += -2147483648 bingo.const
scoreboard players set $detect_emerald/chunk.overflow_check bingo.tmp -2147483648
scoreboard players operation $detect_emerald/chunk.overflow_check bingo.tmp += $detect_emerald/chunk.seed_low bingo.tmp
execute if score $detect_emerald/chunk.overflow_check bingo.tmp < $detect_emerald/chunk.middle1 bingo.tmp run scoreboard players add $detect_emerald/chunk.seed_high bingo.tmp 1

## Add middle 2
scoreboard players operation $detect_emerald/chunk.middle2 bingo.tmp *= 65536 bingo.const
### Overflow detection
scoreboard players operation $detect_emerald/chunk.seed_low bingo.tmp += $detect_emerald/chunk.middle2 bingo.tmp
scoreboard players operation $detect_emerald/chunk.overflow_check bingo.tmp += $detect_emerald/chunk.middle2 bingo.tmp
scoreboard players operation $detect_emerald/chunk.middle2 bingo.tmp += -2147483648 bingo.const
execute if score $detect_emerald/chunk.overflow_check bingo.tmp < $detect_emerald/chunk.middle2 bingo.tmp run scoreboard players add $detect_emerald/chunk.seed_high bingo.tmp 1
#endregion

scoreboard players operation $detect_emerald/chunk.cache_pxpy_low bingo.tmp = $detect_emerald/chunk.seed_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.cache_pxpy_high bingo.tmp = $detect_emerald/chunk.seed_high bingo.tmp

#region seed += salt (in this case salt is biome z neg offset)
## If salt is negative, add 0xFFFF_FFFF to higher bits.
execute if score $detect_emerald/chunk.biomez_neg_offset bingo.tmp matches ..-1 run scoreboard players remove $detect_emerald/chunk.seed_high bingo.tmp 1

## Add lower salt bits with overflow detection
scoreboard players operation $detect_emerald/chunk.seed_low bingo.tmp += $detect_emerald/chunk.biomez_neg_offset bingo.tmp
scoreboard players operation $detect_emerald/chunk.overflow_check bingo.tmp += $detect_emerald/chunk.biomez_neg_offset bingo.tmp
execute if score $detect_emerald/chunk.overflow_check bingo.tmp < $detect_emerald/chunk.biomez_neg_o_chk bingo.tmp run scoreboard players add $detect_emerald/chunk.seed_high bingo.tmp 1
#endregion

#endregion

#region LCG call 4:
#       seed = seed * (seed * 6364136223846793005 + 1442695040888963407) + salt

#region mult = seed * 6364136223846793005 + 1442695040888963407
scoreboard players operation $detect_emerald/chunk.seed_low_low bingo.tmp = $detect_emerald/chunk.seed_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.seed_low_low bingo.tmp %= 65536 bingo.const

scoreboard players operation $detect_emerald/chunk.seed_low_high bingo.tmp = $detect_emerald/chunk.seed_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.seed_low_high bingo.tmp /= 65536 bingo.const
execute if score $detect_emerald/chunk.seed_low_high bingo.tmp matches ..-1 run scoreboard players add $detect_emerald/chunk.seed_low_high bingo.tmp 65536

scoreboard players set $detect_emerald/chunk.middle1 bingo.tmp 19605
scoreboard players operation $detect_emerald/chunk.middle1 bingo.tmp *= $detect_emerald/chunk.seed_low_low bingo.tmp

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
### Overflow detection (if mult_low < middle1, unsigned compare)
scoreboard players operation $detect_emerald/chunk.mult_low bingo.tmp += $detect_emerald/chunk.middle1 bingo.tmp
scoreboard players operation $detect_emerald/chunk.middle1 bingo.tmp += -2147483648 bingo.const
scoreboard players set $detect_emerald/chunk.overflow_check bingo.tmp -2147483648
scoreboard players operation $detect_emerald/chunk.overflow_check bingo.tmp += $detect_emerald/chunk.mult_low bingo.tmp
execute if score $detect_emerald/chunk.overflow_check bingo.tmp < $detect_emerald/chunk.middle1 bingo.tmp run scoreboard players add $detect_emerald/chunk.mult_high bingo.tmp 1

### Add middle 2
scoreboard players operation $detect_emerald/chunk.middle2 bingo.tmp *= 65536 bingo.const
### Overflow detection
scoreboard players operation $detect_emerald/chunk.mult_low bingo.tmp += $detect_emerald/chunk.middle2 bingo.tmp
scoreboard players operation $detect_emerald/chunk.overflow_check bingo.tmp += $detect_emerald/chunk.middle2 bingo.tmp
scoreboard players operation $detect_emerald/chunk.middle2 bingo.tmp += -2147483648 bingo.const
execute if score $detect_emerald/chunk.overflow_check bingo.tmp < $detect_emerald/chunk.middle2 bingo.tmp run scoreboard players add $detect_emerald/chunk.mult_high bingo.tmp 1

# Add c (1442695040888963407)
scoreboard players remove $detect_emerald/chunk.mult_low bingo.tmp 144211633
scoreboard players remove $detect_emerald/chunk.overflow_check bingo.tmp 144211633
execute if score $detect_emerald/chunk.overflow_check bingo.tmp matches ..2003272015 run scoreboard players add $detect_emerald/chunk.mult_high bingo.tmp 1

scoreboard players add $detect_emerald/chunk.mult_high bingo.tmp 335903614
#endregion

#region seed *= mult
scoreboard players operation $detect_emerald/chunk.mult_low_low bingo.tmp = $detect_emerald/chunk.mult_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.mult_low_low bingo.tmp %= 65536 bingo.const

scoreboard players operation $detect_emerald/chunk.mult_low_high bingo.tmp = $detect_emerald/chunk.mult_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.mult_low_high bingo.tmp /= 65536 bingo.const
execute if score $detect_emerald/chunk.mult_low_high bingo.tmp matches ..-1 run scoreboard players add $detect_emerald/chunk.mult_low_high bingo.tmp 65536

scoreboard players operation $detect_emerald/chunk.middle1 bingo.tmp = $detect_emerald/chunk.seed_low_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.middle1 bingo.tmp *= $detect_emerald/chunk.mult_low_high bingo.tmp

scoreboard players operation $detect_emerald/chunk.middle2 bingo.tmp = $detect_emerald/chunk.seed_low_high bingo.tmp
scoreboard players operation $detect_emerald/chunk.middle2 bingo.tmp *= $detect_emerald/chunk.mult_low_low bingo.tmp

# Calculate high bits
scoreboard players operation $detect_emerald/chunk.seed_high bingo.tmp *= $detect_emerald/chunk.mult_low bingo.tmp

scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp = $detect_emerald/chunk.mult_high bingo.tmp
scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp *= $detect_emerald/chunk.seed_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.seed_high bingo.tmp += $detect_emerald/chunk.tmp bingo.tmp

scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp = $detect_emerald/chunk.middle1 bingo.tmp
scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp /= 65536 bingo.const
execute if score $detect_emerald/chunk.tmp bingo.tmp matches ..-1 run scoreboard players add $detect_emerald/chunk.tmp bingo.tmp 65536
scoreboard players operation $detect_emerald/chunk.seed_high bingo.tmp += $detect_emerald/chunk.tmp bingo.tmp

scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp = $detect_emerald/chunk.middle2 bingo.tmp
scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp /= 65536 bingo.const
execute if score $detect_emerald/chunk.tmp bingo.tmp matches ..-1 run scoreboard players add $detect_emerald/chunk.tmp bingo.tmp 65536
scoreboard players operation $detect_emerald/chunk.seed_high bingo.tmp += $detect_emerald/chunk.tmp bingo.tmp

scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp = $detect_emerald/chunk.seed_low_high bingo.tmp
scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp *= $detect_emerald/chunk.mult_low_high bingo.tmp
scoreboard players operation $detect_emerald/chunk.seed_high bingo.tmp += $detect_emerald/chunk.tmp bingo.tmp

# Calculate low bits
scoreboard players operation $detect_emerald/chunk.seed_low bingo.tmp = $detect_emerald/chunk.seed_low_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.seed_low bingo.tmp *= $detect_emerald/chunk.mult_low_low bingo.tmp

## Add middle 1
scoreboard players operation $detect_emerald/chunk.middle1 bingo.tmp *= 65536 bingo.const
### Overflow detection (if mult_low < middle1, unsigned compare)
scoreboard players operation $detect_emerald/chunk.seed_low bingo.tmp += $detect_emerald/chunk.middle1 bingo.tmp
scoreboard players operation $detect_emerald/chunk.middle1 bingo.tmp += -2147483648 bingo.const
scoreboard players set $detect_emerald/chunk.overflow_check bingo.tmp -2147483648
scoreboard players operation $detect_emerald/chunk.overflow_check bingo.tmp += $detect_emerald/chunk.seed_low bingo.tmp
execute if score $detect_emerald/chunk.overflow_check bingo.tmp < $detect_emerald/chunk.middle1 bingo.tmp run scoreboard players add $detect_emerald/chunk.seed_high bingo.tmp 1

## Add middle 2
scoreboard players operation $detect_emerald/chunk.middle2 bingo.tmp *= 65536 bingo.const
### Overflow detection
scoreboard players operation $detect_emerald/chunk.seed_low bingo.tmp += $detect_emerald/chunk.middle2 bingo.tmp
scoreboard players operation $detect_emerald/chunk.overflow_check bingo.tmp += $detect_emerald/chunk.middle2 bingo.tmp
scoreboard players operation $detect_emerald/chunk.middle2 bingo.tmp += -2147483648 bingo.const
execute if score $detect_emerald/chunk.overflow_check bingo.tmp < $detect_emerald/chunk.middle2 bingo.tmp run scoreboard players add $detect_emerald/chunk.seed_high bingo.tmp 1
#endregion

#region seed += salt (in this case salt is biome x pos offset)
## If salt is negative, add 0xFFFF_FFFF to higher bits.
execute if score $detect_emerald/chunk.biomex_pos_offset bingo.tmp matches ..-1 run scoreboard players remove $detect_emerald/chunk.seed_high bingo.tmp 1

## Add lower salt bits with overflow detection
scoreboard players operation $detect_emerald/chunk.seed_low bingo.tmp += $detect_emerald/chunk.biomex_pos_offset bingo.tmp
scoreboard players operation $detect_emerald/chunk.overflow_check bingo.tmp += $detect_emerald/chunk.biomex_pos_offset bingo.tmp
execute if score $detect_emerald/chunk.overflow_check bingo.tmp < $detect_emerald/chunk.biomex_pos_o_chk bingo.tmp run scoreboard players add $detect_emerald/chunk.seed_high bingo.tmp 1
#endregion

#endregion

#region LCG call 5:
#       seed = seed * (seed * 6364136223846793005 + 1442695040888963407) + salt

#region mult = seed * 6364136223846793005 + 1442695040888963407
scoreboard players operation $detect_emerald/chunk.seed_low_low bingo.tmp = $detect_emerald/chunk.seed_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.seed_low_low bingo.tmp %= 65536 bingo.const

scoreboard players operation $detect_emerald/chunk.seed_low_high bingo.tmp = $detect_emerald/chunk.seed_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.seed_low_high bingo.tmp /= 65536 bingo.const
execute if score $detect_emerald/chunk.seed_low_high bingo.tmp matches ..-1 run scoreboard players add $detect_emerald/chunk.seed_low_high bingo.tmp 65536

scoreboard players set $detect_emerald/chunk.middle1 bingo.tmp 19605
scoreboard players operation $detect_emerald/chunk.middle1 bingo.tmp *= $detect_emerald/chunk.seed_low_low bingo.tmp

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
### Overflow detection (if mult_low < middle1, unsigned compare)
scoreboard players operation $detect_emerald/chunk.mult_low bingo.tmp += $detect_emerald/chunk.middle1 bingo.tmp
scoreboard players operation $detect_emerald/chunk.middle1 bingo.tmp += -2147483648 bingo.const
scoreboard players set $detect_emerald/chunk.overflow_check bingo.tmp -2147483648
scoreboard players operation $detect_emerald/chunk.overflow_check bingo.tmp += $detect_emerald/chunk.mult_low bingo.tmp
execute if score $detect_emerald/chunk.overflow_check bingo.tmp < $detect_emerald/chunk.middle1 bingo.tmp run scoreboard players add $detect_emerald/chunk.mult_high bingo.tmp 1

### Add middle 2
scoreboard players operation $detect_emerald/chunk.middle2 bingo.tmp *= 65536 bingo.const
### Overflow detection
scoreboard players operation $detect_emerald/chunk.mult_low bingo.tmp += $detect_emerald/chunk.middle2 bingo.tmp
scoreboard players operation $detect_emerald/chunk.overflow_check bingo.tmp += $detect_emerald/chunk.middle2 bingo.tmp
scoreboard players operation $detect_emerald/chunk.middle2 bingo.tmp += -2147483648 bingo.const
execute if score $detect_emerald/chunk.overflow_check bingo.tmp < $detect_emerald/chunk.middle2 bingo.tmp run scoreboard players add $detect_emerald/chunk.mult_high bingo.tmp 1

# Add c (1442695040888963407)
scoreboard players remove $detect_emerald/chunk.mult_low bingo.tmp 144211633
scoreboard players remove $detect_emerald/chunk.overflow_check bingo.tmp 144211633
execute if score $detect_emerald/chunk.overflow_check bingo.tmp matches ..2003272015 run scoreboard players add $detect_emerald/chunk.mult_high bingo.tmp 1

scoreboard players add $detect_emerald/chunk.mult_high bingo.tmp 335903614
#endregion

#region seed *= mult
scoreboard players operation $detect_emerald/chunk.mult_low_low bingo.tmp = $detect_emerald/chunk.mult_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.mult_low_low bingo.tmp %= 65536 bingo.const

scoreboard players operation $detect_emerald/chunk.mult_low_high bingo.tmp = $detect_emerald/chunk.mult_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.mult_low_high bingo.tmp /= 65536 bingo.const
execute if score $detect_emerald/chunk.mult_low_high bingo.tmp matches ..-1 run scoreboard players add $detect_emerald/chunk.mult_low_high bingo.tmp 65536

scoreboard players operation $detect_emerald/chunk.middle1 bingo.tmp = $detect_emerald/chunk.seed_low_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.middle1 bingo.tmp *= $detect_emerald/chunk.mult_low_high bingo.tmp

scoreboard players operation $detect_emerald/chunk.middle2 bingo.tmp = $detect_emerald/chunk.seed_low_high bingo.tmp
scoreboard players operation $detect_emerald/chunk.middle2 bingo.tmp *= $detect_emerald/chunk.mult_low_low bingo.tmp

# Calculate high bits
scoreboard players operation $detect_emerald/chunk.seed_high bingo.tmp *= $detect_emerald/chunk.mult_low bingo.tmp

scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp = $detect_emerald/chunk.mult_high bingo.tmp
scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp *= $detect_emerald/chunk.seed_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.seed_high bingo.tmp += $detect_emerald/chunk.tmp bingo.tmp

scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp = $detect_emerald/chunk.middle1 bingo.tmp
scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp /= 65536 bingo.const
execute if score $detect_emerald/chunk.tmp bingo.tmp matches ..-1 run scoreboard players add $detect_emerald/chunk.tmp bingo.tmp 65536
scoreboard players operation $detect_emerald/chunk.seed_high bingo.tmp += $detect_emerald/chunk.tmp bingo.tmp

scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp = $detect_emerald/chunk.middle2 bingo.tmp
scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp /= 65536 bingo.const
execute if score $detect_emerald/chunk.tmp bingo.tmp matches ..-1 run scoreboard players add $detect_emerald/chunk.tmp bingo.tmp 65536
scoreboard players operation $detect_emerald/chunk.seed_high bingo.tmp += $detect_emerald/chunk.tmp bingo.tmp

scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp = $detect_emerald/chunk.seed_low_high bingo.tmp
scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp *= $detect_emerald/chunk.mult_low_high bingo.tmp
scoreboard players operation $detect_emerald/chunk.seed_high bingo.tmp += $detect_emerald/chunk.tmp bingo.tmp

# Calculate low bits
scoreboard players operation $detect_emerald/chunk.seed_low bingo.tmp = $detect_emerald/chunk.seed_low_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.seed_low bingo.tmp *= $detect_emerald/chunk.mult_low_low bingo.tmp

## Add middle 1
scoreboard players operation $detect_emerald/chunk.middle1 bingo.tmp *= 65536 bingo.const
### Overflow detection (if mult_low < middle1, unsigned compare)
scoreboard players operation $detect_emerald/chunk.seed_low bingo.tmp += $detect_emerald/chunk.middle1 bingo.tmp
scoreboard players operation $detect_emerald/chunk.middle1 bingo.tmp += -2147483648 bingo.const
scoreboard players set $detect_emerald/chunk.overflow_check bingo.tmp -2147483648
scoreboard players operation $detect_emerald/chunk.overflow_check bingo.tmp += $detect_emerald/chunk.seed_low bingo.tmp
execute if score $detect_emerald/chunk.overflow_check bingo.tmp < $detect_emerald/chunk.middle1 bingo.tmp run scoreboard players add $detect_emerald/chunk.seed_high bingo.tmp 1

## Add middle 2
scoreboard players operation $detect_emerald/chunk.middle2 bingo.tmp *= 65536 bingo.const
### Overflow detection
scoreboard players operation $detect_emerald/chunk.seed_low bingo.tmp += $detect_emerald/chunk.middle2 bingo.tmp
scoreboard players operation $detect_emerald/chunk.overflow_check bingo.tmp += $detect_emerald/chunk.middle2 bingo.tmp
scoreboard players operation $detect_emerald/chunk.middle2 bingo.tmp += -2147483648 bingo.const
execute if score $detect_emerald/chunk.overflow_check bingo.tmp < $detect_emerald/chunk.middle2 bingo.tmp run scoreboard players add $detect_emerald/chunk.seed_high bingo.tmp 1
#endregion

#region seed += salt (in this case salt is biome y pos offset)
## If salt is negative, add 0xFFFF_FFFF to higher bits.
execute if score $detect_emerald/chunk.biomey_pos_offset bingo.tmp matches ..-1 run scoreboard players remove $detect_emerald/chunk.seed_high bingo.tmp 1

## Add lower salt bits with overflow detection
scoreboard players operation $detect_emerald/chunk.seed_low bingo.tmp += $detect_emerald/chunk.biomey_pos_offset bingo.tmp
scoreboard players operation $detect_emerald/chunk.overflow_check bingo.tmp += $detect_emerald/chunk.biomey_pos_offset bingo.tmp
execute if score $detect_emerald/chunk.overflow_check bingo.tmp < $detect_emerald/chunk.biomey_pos_o_chk bingo.tmp run scoreboard players add $detect_emerald/chunk.seed_high bingo.tmp 1
#endregion

#endregion

#region LCG call 6:
#       seed = seed * (seed * 6364136223846793005 + 1442695040888963407) + salt

#region mult = seed * 6364136223846793005 + 1442695040888963407
scoreboard players operation $detect_emerald/chunk.seed_low_low bingo.tmp = $detect_emerald/chunk.seed_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.seed_low_low bingo.tmp %= 65536 bingo.const

scoreboard players operation $detect_emerald/chunk.seed_low_high bingo.tmp = $detect_emerald/chunk.seed_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.seed_low_high bingo.tmp /= 65536 bingo.const
execute if score $detect_emerald/chunk.seed_low_high bingo.tmp matches ..-1 run scoreboard players add $detect_emerald/chunk.seed_low_high bingo.tmp 65536

scoreboard players set $detect_emerald/chunk.middle1 bingo.tmp 19605
scoreboard players operation $detect_emerald/chunk.middle1 bingo.tmp *= $detect_emerald/chunk.seed_low_low bingo.tmp

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
### Overflow detection (if mult_low < middle1, unsigned compare)
scoreboard players operation $detect_emerald/chunk.mult_low bingo.tmp += $detect_emerald/chunk.middle1 bingo.tmp
scoreboard players operation $detect_emerald/chunk.middle1 bingo.tmp += -2147483648 bingo.const
scoreboard players set $detect_emerald/chunk.overflow_check bingo.tmp -2147483648
scoreboard players operation $detect_emerald/chunk.overflow_check bingo.tmp += $detect_emerald/chunk.mult_low bingo.tmp
execute if score $detect_emerald/chunk.overflow_check bingo.tmp < $detect_emerald/chunk.middle1 bingo.tmp run scoreboard players add $detect_emerald/chunk.mult_high bingo.tmp 1

### Add middle 2
scoreboard players operation $detect_emerald/chunk.middle2 bingo.tmp *= 65536 bingo.const
### Overflow detection
scoreboard players operation $detect_emerald/chunk.mult_low bingo.tmp += $detect_emerald/chunk.middle2 bingo.tmp
scoreboard players operation $detect_emerald/chunk.overflow_check bingo.tmp += $detect_emerald/chunk.middle2 bingo.tmp
scoreboard players operation $detect_emerald/chunk.middle2 bingo.tmp += -2147483648 bingo.const
execute if score $detect_emerald/chunk.overflow_check bingo.tmp < $detect_emerald/chunk.middle2 bingo.tmp run scoreboard players add $detect_emerald/chunk.mult_high bingo.tmp 1

# Add c (1442695040888963407)
scoreboard players remove $detect_emerald/chunk.mult_low bingo.tmp 144211633
scoreboard players remove $detect_emerald/chunk.overflow_check bingo.tmp 144211633
execute if score $detect_emerald/chunk.overflow_check bingo.tmp matches ..2003272015 run scoreboard players add $detect_emerald/chunk.mult_high bingo.tmp 1

scoreboard players add $detect_emerald/chunk.mult_high bingo.tmp 335903614
#endregion

#region seed *= mult
scoreboard players operation $detect_emerald/chunk.mult_low_low bingo.tmp = $detect_emerald/chunk.mult_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.mult_low_low bingo.tmp %= 65536 bingo.const

scoreboard players operation $detect_emerald/chunk.mult_low_high bingo.tmp = $detect_emerald/chunk.mult_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.mult_low_high bingo.tmp /= 65536 bingo.const
execute if score $detect_emerald/chunk.mult_low_high bingo.tmp matches ..-1 run scoreboard players add $detect_emerald/chunk.mult_low_high bingo.tmp 65536

scoreboard players operation $detect_emerald/chunk.middle1 bingo.tmp = $detect_emerald/chunk.seed_low_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.middle1 bingo.tmp *= $detect_emerald/chunk.mult_low_high bingo.tmp

scoreboard players operation $detect_emerald/chunk.middle2 bingo.tmp = $detect_emerald/chunk.seed_low_high bingo.tmp
scoreboard players operation $detect_emerald/chunk.middle2 bingo.tmp *= $detect_emerald/chunk.mult_low_low bingo.tmp

# Calculate high bits
scoreboard players operation $detect_emerald/chunk.seed_high bingo.tmp *= $detect_emerald/chunk.mult_low bingo.tmp

scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp = $detect_emerald/chunk.mult_high bingo.tmp
scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp *= $detect_emerald/chunk.seed_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.seed_high bingo.tmp += $detect_emerald/chunk.tmp bingo.tmp

scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp = $detect_emerald/chunk.middle1 bingo.tmp
scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp /= 65536 bingo.const
execute if score $detect_emerald/chunk.tmp bingo.tmp matches ..-1 run scoreboard players add $detect_emerald/chunk.tmp bingo.tmp 65536
scoreboard players operation $detect_emerald/chunk.seed_high bingo.tmp += $detect_emerald/chunk.tmp bingo.tmp

scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp = $detect_emerald/chunk.middle2 bingo.tmp
scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp /= 65536 bingo.const
execute if score $detect_emerald/chunk.tmp bingo.tmp matches ..-1 run scoreboard players add $detect_emerald/chunk.tmp bingo.tmp 65536
scoreboard players operation $detect_emerald/chunk.seed_high bingo.tmp += $detect_emerald/chunk.tmp bingo.tmp

scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp = $detect_emerald/chunk.seed_low_high bingo.tmp
scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp *= $detect_emerald/chunk.mult_low_high bingo.tmp
scoreboard players operation $detect_emerald/chunk.seed_high bingo.tmp += $detect_emerald/chunk.tmp bingo.tmp

# Calculate low bits
scoreboard players operation $detect_emerald/chunk.seed_low bingo.tmp = $detect_emerald/chunk.seed_low_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.seed_low bingo.tmp *= $detect_emerald/chunk.mult_low_low bingo.tmp

## Add middle 1
scoreboard players operation $detect_emerald/chunk.middle1 bingo.tmp *= 65536 bingo.const
### Overflow detection (if mult_low < middle1, unsigned compare)
scoreboard players operation $detect_emerald/chunk.seed_low bingo.tmp += $detect_emerald/chunk.middle1 bingo.tmp
scoreboard players operation $detect_emerald/chunk.middle1 bingo.tmp += -2147483648 bingo.const
scoreboard players set $detect_emerald/chunk.overflow_check bingo.tmp -2147483648
scoreboard players operation $detect_emerald/chunk.overflow_check bingo.tmp += $detect_emerald/chunk.seed_low bingo.tmp
execute if score $detect_emerald/chunk.overflow_check bingo.tmp < $detect_emerald/chunk.middle1 bingo.tmp run scoreboard players add $detect_emerald/chunk.seed_high bingo.tmp 1

## Add middle 2
scoreboard players operation $detect_emerald/chunk.middle2 bingo.tmp *= 65536 bingo.const
### Overflow detection
scoreboard players operation $detect_emerald/chunk.seed_low bingo.tmp += $detect_emerald/chunk.middle2 bingo.tmp
scoreboard players operation $detect_emerald/chunk.overflow_check bingo.tmp += $detect_emerald/chunk.middle2 bingo.tmp
scoreboard players operation $detect_emerald/chunk.middle2 bingo.tmp += -2147483648 bingo.const
execute if score $detect_emerald/chunk.overflow_check bingo.tmp < $detect_emerald/chunk.middle2 bingo.tmp run scoreboard players add $detect_emerald/chunk.seed_high bingo.tmp 1
#endregion

#region seed += salt (in this case salt is biome z neg offset)
## If salt is negative, add 0xFFFF_FFFF to higher bits.
execute if score $detect_emerald/chunk.biomez_neg_offset bingo.tmp matches ..-1 run scoreboard players remove $detect_emerald/chunk.seed_high bingo.tmp 1

## Add lower salt bits with overflow detection
scoreboard players operation $detect_emerald/chunk.seed_low bingo.tmp += $detect_emerald/chunk.biomez_neg_offset bingo.tmp
scoreboard players operation $detect_emerald/chunk.overflow_check bingo.tmp += $detect_emerald/chunk.biomez_neg_offset bingo.tmp
execute if score $detect_emerald/chunk.overflow_check bingo.tmp < $detect_emerald/chunk.biomez_neg_o_chk bingo.tmp run scoreboard players add $detect_emerald/chunk.seed_high bingo.tmp 1
#endregion

#endregion

#region calculate x coordinate offset
#>
# @private
#declare score_holder $detect_emerald/chunk.cur_distance

scoreboard players operation $detect_emerald/chunk.cur_distance bingo.tmp = $detect_emerald/chunk.seed_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.cur_distance bingo.tmp /= 16777216 bingo.const
execute if score $detect_emerald/chunk.cur_distance bingo.tmp matches ..-1 run scoreboard players add $detect_emerald/chunk.cur_distance bingo.tmp 256

scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp = $detect_emerald/chunk.seed_high bingo.tmp
scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp *= 256 bingo.const
scoreboard players operation $detect_emerald/chunk.cur_distance bingo.tmp += $detect_emerald/chunk.tmp bingo.tmp

scoreboard players operation $detect_emerald/chunk.cur_distance bingo.tmp %= 1024 bingo.const
scoreboard players remove $detect_emerald/chunk.cur_distance bingo.tmp 512
scoreboard players operation $detect_emerald/chunk.cur_distance bingo.tmp *= 9 bingo.const
#endregion

#region LCG call 7:
#       seed = seed * (seed * 6364136223846793005 + 1442695040888963407) + salt

#region mult = seed * 6364136223846793005 + 1442695040888963407
scoreboard players operation $detect_emerald/chunk.seed_low_low bingo.tmp = $detect_emerald/chunk.seed_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.seed_low_low bingo.tmp %= 65536 bingo.const

scoreboard players operation $detect_emerald/chunk.seed_low_high bingo.tmp = $detect_emerald/chunk.seed_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.seed_low_high bingo.tmp /= 65536 bingo.const
execute if score $detect_emerald/chunk.seed_low_high bingo.tmp matches ..-1 run scoreboard players add $detect_emerald/chunk.seed_low_high bingo.tmp 65536

scoreboard players set $detect_emerald/chunk.middle1 bingo.tmp 19605
scoreboard players operation $detect_emerald/chunk.middle1 bingo.tmp *= $detect_emerald/chunk.seed_low_low bingo.tmp

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
### Overflow detection (if mult_low < middle1, unsigned compare)
scoreboard players operation $detect_emerald/chunk.mult_low bingo.tmp += $detect_emerald/chunk.middle1 bingo.tmp
scoreboard players operation $detect_emerald/chunk.middle1 bingo.tmp += -2147483648 bingo.const
scoreboard players set $detect_emerald/chunk.overflow_check bingo.tmp -2147483648
scoreboard players operation $detect_emerald/chunk.overflow_check bingo.tmp += $detect_emerald/chunk.mult_low bingo.tmp
execute if score $detect_emerald/chunk.overflow_check bingo.tmp < $detect_emerald/chunk.middle1 bingo.tmp run scoreboard players add $detect_emerald/chunk.mult_high bingo.tmp 1

### Add middle 2
scoreboard players operation $detect_emerald/chunk.middle2 bingo.tmp *= 65536 bingo.const
### Overflow detection
scoreboard players operation $detect_emerald/chunk.mult_low bingo.tmp += $detect_emerald/chunk.middle2 bingo.tmp
scoreboard players operation $detect_emerald/chunk.overflow_check bingo.tmp += $detect_emerald/chunk.middle2 bingo.tmp
scoreboard players operation $detect_emerald/chunk.middle2 bingo.tmp += -2147483648 bingo.const
execute if score $detect_emerald/chunk.overflow_check bingo.tmp < $detect_emerald/chunk.middle2 bingo.tmp run scoreboard players add $detect_emerald/chunk.mult_high bingo.tmp 1

# Add c (1442695040888963407)
scoreboard players remove $detect_emerald/chunk.mult_low bingo.tmp 144211633
scoreboard players remove $detect_emerald/chunk.overflow_check bingo.tmp 144211633
execute if score $detect_emerald/chunk.overflow_check bingo.tmp matches ..2003272015 run scoreboard players add $detect_emerald/chunk.mult_high bingo.tmp 1

scoreboard players add $detect_emerald/chunk.mult_high bingo.tmp 335903614
#endregion

#region seed *= mult
scoreboard players operation $detect_emerald/chunk.mult_low_low bingo.tmp = $detect_emerald/chunk.mult_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.mult_low_low bingo.tmp %= 65536 bingo.const

scoreboard players operation $detect_emerald/chunk.mult_low_high bingo.tmp = $detect_emerald/chunk.mult_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.mult_low_high bingo.tmp /= 65536 bingo.const
execute if score $detect_emerald/chunk.mult_low_high bingo.tmp matches ..-1 run scoreboard players add $detect_emerald/chunk.mult_low_high bingo.tmp 65536

scoreboard players operation $detect_emerald/chunk.middle1 bingo.tmp = $detect_emerald/chunk.seed_low_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.middle1 bingo.tmp *= $detect_emerald/chunk.mult_low_high bingo.tmp

scoreboard players operation $detect_emerald/chunk.middle2 bingo.tmp = $detect_emerald/chunk.seed_low_high bingo.tmp
scoreboard players operation $detect_emerald/chunk.middle2 bingo.tmp *= $detect_emerald/chunk.mult_low_low bingo.tmp

# Calculate high bits
scoreboard players operation $detect_emerald/chunk.seed_high bingo.tmp *= $detect_emerald/chunk.mult_low bingo.tmp

scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp = $detect_emerald/chunk.mult_high bingo.tmp
scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp *= $detect_emerald/chunk.seed_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.seed_high bingo.tmp += $detect_emerald/chunk.tmp bingo.tmp

scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp = $detect_emerald/chunk.middle1 bingo.tmp
scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp /= 65536 bingo.const
execute if score $detect_emerald/chunk.tmp bingo.tmp matches ..-1 run scoreboard players add $detect_emerald/chunk.tmp bingo.tmp 65536
scoreboard players operation $detect_emerald/chunk.seed_high bingo.tmp += $detect_emerald/chunk.tmp bingo.tmp

scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp = $detect_emerald/chunk.middle2 bingo.tmp
scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp /= 65536 bingo.const
execute if score $detect_emerald/chunk.tmp bingo.tmp matches ..-1 run scoreboard players add $detect_emerald/chunk.tmp bingo.tmp 65536
scoreboard players operation $detect_emerald/chunk.seed_high bingo.tmp += $detect_emerald/chunk.tmp bingo.tmp

scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp = $detect_emerald/chunk.seed_low_high bingo.tmp
scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp *= $detect_emerald/chunk.mult_low_high bingo.tmp
scoreboard players operation $detect_emerald/chunk.seed_high bingo.tmp += $detect_emerald/chunk.tmp bingo.tmp

# Calculate low bits
scoreboard players operation $detect_emerald/chunk.seed_low bingo.tmp = $detect_emerald/chunk.seed_low_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.seed_low bingo.tmp *= $detect_emerald/chunk.mult_low_low bingo.tmp

## Add middle 1
scoreboard players operation $detect_emerald/chunk.middle1 bingo.tmp *= 65536 bingo.const
### Overflow detection (if mult_low < middle1, unsigned compare)
scoreboard players operation $detect_emerald/chunk.seed_low bingo.tmp += $detect_emerald/chunk.middle1 bingo.tmp
scoreboard players operation $detect_emerald/chunk.middle1 bingo.tmp += -2147483648 bingo.const
scoreboard players set $detect_emerald/chunk.overflow_check bingo.tmp -2147483648
scoreboard players operation $detect_emerald/chunk.overflow_check bingo.tmp += $detect_emerald/chunk.seed_low bingo.tmp
execute if score $detect_emerald/chunk.overflow_check bingo.tmp < $detect_emerald/chunk.middle1 bingo.tmp run scoreboard players add $detect_emerald/chunk.seed_high bingo.tmp 1

## Add middle 2
scoreboard players operation $detect_emerald/chunk.middle2 bingo.tmp *= 65536 bingo.const
### Overflow detection
scoreboard players operation $detect_emerald/chunk.seed_low bingo.tmp += $detect_emerald/chunk.middle2 bingo.tmp
scoreboard players operation $detect_emerald/chunk.overflow_check bingo.tmp += $detect_emerald/chunk.middle2 bingo.tmp
scoreboard players operation $detect_emerald/chunk.middle2 bingo.tmp += -2147483648 bingo.const
execute if score $detect_emerald/chunk.overflow_check bingo.tmp < $detect_emerald/chunk.middle2 bingo.tmp run scoreboard players add $detect_emerald/chunk.seed_high bingo.tmp 1
#endregion

#region seed += salt (in this case salt is 1222086395815990741)
## If salt is negative, add 0xFFFF_FFFF to higher bits.
scoreboard players add $detect_emerald/chunk.seed_high bingo.tmp 284539162

## Add lower salt bits with overflow detection
scoreboard players add $detect_emerald/chunk.seed_low bingo.tmp 594744789
scoreboard players add $detect_emerald/chunk.overflow_check bingo.tmp 594744789
execute if score $detect_emerald/chunk.overflow_check bingo.tmp matches ..-1552738860 run scoreboard players add $detect_emerald/chunk.seed_high bingo.tmp 1
#endregion

#endregion

#region calculate y coordinate offset
scoreboard players operation $detect_emerald/chunk.random_y_offset bingo.tmp = $detect_emerald/chunk.seed_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.random_y_offset bingo.tmp /= 16777216 bingo.const
execute if score $detect_emerald/chunk.random_y_offset bingo.tmp matches ..-1 run scoreboard players add $detect_emerald/chunk.random_y_offset bingo.tmp 256

scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp = $detect_emerald/chunk.seed_high bingo.tmp
scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp *= 256 bingo.const
scoreboard players operation $detect_emerald/chunk.random_y_offset bingo.tmp += $detect_emerald/chunk.tmp bingo.tmp

scoreboard players operation $detect_emerald/chunk.random_y_offset bingo.tmp %= 1024 bingo.const
scoreboard players remove $detect_emerald/chunk.random_y_offset bingo.tmp 512
scoreboard players operation $detect_emerald/chunk.random_y_offset bingo.tmp *= 9 bingo.const
#endregion

#region LCG call 8:
#       seed = seed * (seed * 6364136223846793005 + 1442695040888963407) + salt

#region mult = seed * 6364136223846793005 + 1442695040888963407
scoreboard players operation $detect_emerald/chunk.seed_low_low bingo.tmp = $detect_emerald/chunk.seed_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.seed_low_low bingo.tmp %= 65536 bingo.const

scoreboard players operation $detect_emerald/chunk.seed_low_high bingo.tmp = $detect_emerald/chunk.seed_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.seed_low_high bingo.tmp /= 65536 bingo.const
execute if score $detect_emerald/chunk.seed_low_high bingo.tmp matches ..-1 run scoreboard players add $detect_emerald/chunk.seed_low_high bingo.tmp 65536

scoreboard players set $detect_emerald/chunk.middle1 bingo.tmp 19605
scoreboard players operation $detect_emerald/chunk.middle1 bingo.tmp *= $detect_emerald/chunk.seed_low_low bingo.tmp

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
### Overflow detection (if mult_low < middle1, unsigned compare)
scoreboard players operation $detect_emerald/chunk.mult_low bingo.tmp += $detect_emerald/chunk.middle1 bingo.tmp
scoreboard players operation $detect_emerald/chunk.middle1 bingo.tmp += -2147483648 bingo.const
scoreboard players set $detect_emerald/chunk.overflow_check bingo.tmp -2147483648
scoreboard players operation $detect_emerald/chunk.overflow_check bingo.tmp += $detect_emerald/chunk.mult_low bingo.tmp
execute if score $detect_emerald/chunk.overflow_check bingo.tmp < $detect_emerald/chunk.middle1 bingo.tmp run scoreboard players add $detect_emerald/chunk.mult_high bingo.tmp 1

### Add middle 2
scoreboard players operation $detect_emerald/chunk.middle2 bingo.tmp *= 65536 bingo.const
### Overflow detection
scoreboard players operation $detect_emerald/chunk.mult_low bingo.tmp += $detect_emerald/chunk.middle2 bingo.tmp
scoreboard players operation $detect_emerald/chunk.overflow_check bingo.tmp += $detect_emerald/chunk.middle2 bingo.tmp
scoreboard players operation $detect_emerald/chunk.middle2 bingo.tmp += -2147483648 bingo.const
execute if score $detect_emerald/chunk.overflow_check bingo.tmp < $detect_emerald/chunk.middle2 bingo.tmp run scoreboard players add $detect_emerald/chunk.mult_high bingo.tmp 1

# Add c (1442695040888963407)
scoreboard players remove $detect_emerald/chunk.mult_low bingo.tmp 144211633
scoreboard players remove $detect_emerald/chunk.overflow_check bingo.tmp 144211633
execute if score $detect_emerald/chunk.overflow_check bingo.tmp matches ..2003272015 run scoreboard players add $detect_emerald/chunk.mult_high bingo.tmp 1

scoreboard players add $detect_emerald/chunk.mult_high bingo.tmp 335903614
#endregion

#region seed *= mult
scoreboard players operation $detect_emerald/chunk.mult_low_low bingo.tmp = $detect_emerald/chunk.mult_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.mult_low_low bingo.tmp %= 65536 bingo.const

scoreboard players operation $detect_emerald/chunk.mult_low_high bingo.tmp = $detect_emerald/chunk.mult_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.mult_low_high bingo.tmp /= 65536 bingo.const
execute if score $detect_emerald/chunk.mult_low_high bingo.tmp matches ..-1 run scoreboard players add $detect_emerald/chunk.mult_low_high bingo.tmp 65536

scoreboard players operation $detect_emerald/chunk.middle1 bingo.tmp = $detect_emerald/chunk.seed_low_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.middle1 bingo.tmp *= $detect_emerald/chunk.mult_low_high bingo.tmp

scoreboard players operation $detect_emerald/chunk.middle2 bingo.tmp = $detect_emerald/chunk.seed_low_high bingo.tmp
scoreboard players operation $detect_emerald/chunk.middle2 bingo.tmp *= $detect_emerald/chunk.mult_low_low bingo.tmp

# Calculate high bits
scoreboard players operation $detect_emerald/chunk.seed_high bingo.tmp *= $detect_emerald/chunk.mult_low bingo.tmp

scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp = $detect_emerald/chunk.mult_high bingo.tmp
scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp *= $detect_emerald/chunk.seed_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.seed_high bingo.tmp += $detect_emerald/chunk.tmp bingo.tmp

scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp = $detect_emerald/chunk.middle1 bingo.tmp
scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp /= 65536 bingo.const
execute if score $detect_emerald/chunk.tmp bingo.tmp matches ..-1 run scoreboard players add $detect_emerald/chunk.tmp bingo.tmp 65536
scoreboard players operation $detect_emerald/chunk.seed_high bingo.tmp += $detect_emerald/chunk.tmp bingo.tmp

scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp = $detect_emerald/chunk.middle2 bingo.tmp
scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp /= 65536 bingo.const
execute if score $detect_emerald/chunk.tmp bingo.tmp matches ..-1 run scoreboard players add $detect_emerald/chunk.tmp bingo.tmp 65536
scoreboard players operation $detect_emerald/chunk.seed_high bingo.tmp += $detect_emerald/chunk.tmp bingo.tmp

scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp = $detect_emerald/chunk.seed_low_high bingo.tmp
scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp *= $detect_emerald/chunk.mult_low_high bingo.tmp
scoreboard players operation $detect_emerald/chunk.seed_high bingo.tmp += $detect_emerald/chunk.tmp bingo.tmp

# Calculate low bits
scoreboard players operation $detect_emerald/chunk.seed_low bingo.tmp = $detect_emerald/chunk.seed_low_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.seed_low bingo.tmp *= $detect_emerald/chunk.mult_low_low bingo.tmp

## Add middle 1
scoreboard players operation $detect_emerald/chunk.middle1 bingo.tmp *= 65536 bingo.const
### Overflow detection (if mult_low < middle1, unsigned compare)
scoreboard players operation $detect_emerald/chunk.seed_low bingo.tmp += $detect_emerald/chunk.middle1 bingo.tmp
scoreboard players operation $detect_emerald/chunk.middle1 bingo.tmp += -2147483648 bingo.const
scoreboard players set $detect_emerald/chunk.overflow_check bingo.tmp -2147483648
scoreboard players operation $detect_emerald/chunk.overflow_check bingo.tmp += $detect_emerald/chunk.seed_low bingo.tmp
execute if score $detect_emerald/chunk.overflow_check bingo.tmp < $detect_emerald/chunk.middle1 bingo.tmp run scoreboard players add $detect_emerald/chunk.seed_high bingo.tmp 1

## Add middle 2
scoreboard players operation $detect_emerald/chunk.middle2 bingo.tmp *= 65536 bingo.const
### Overflow detection
scoreboard players operation $detect_emerald/chunk.seed_low bingo.tmp += $detect_emerald/chunk.middle2 bingo.tmp
scoreboard players operation $detect_emerald/chunk.overflow_check bingo.tmp += $detect_emerald/chunk.middle2 bingo.tmp
scoreboard players operation $detect_emerald/chunk.middle2 bingo.tmp += -2147483648 bingo.const
execute if score $detect_emerald/chunk.overflow_check bingo.tmp < $detect_emerald/chunk.middle2 bingo.tmp run scoreboard players add $detect_emerald/chunk.seed_high bingo.tmp 1
#endregion

#region seed += salt (in this case salt is 1222086395815990741)
## If salt is negative, add 0xFFFF_FFFF to higher bits.
scoreboard players add $detect_emerald/chunk.seed_high bingo.tmp 284539162

## Add lower salt bits with overflow detection
scoreboard players add $detect_emerald/chunk.seed_low bingo.tmp 594744789
scoreboard players add $detect_emerald/chunk.overflow_check bingo.tmp 594744789
execute if score $detect_emerald/chunk.overflow_check bingo.tmp matches ..-1552738860 run scoreboard players add $detect_emerald/chunk.seed_high bingo.tmp 1
#endregion

#endregion

#region calculate z coordinate offset
scoreboard players operation $detect_emerald/chunk.random_z_offset bingo.tmp = $detect_emerald/chunk.seed_low bingo.tmp
scoreboard players operation $detect_emerald/chunk.random_z_offset bingo.tmp /= 16777216 bingo.const
execute if score $detect_emerald/chunk.random_z_offset bingo.tmp matches ..-1 run scoreboard players add $detect_emerald/chunk.random_z_offset bingo.tmp 256

scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp = $detect_emerald/chunk.seed_high bingo.tmp
scoreboard players operation $detect_emerald/chunk.tmp bingo.tmp *= 256 bingo.const
scoreboard players operation $detect_emerald/chunk.random_z_offset bingo.tmp += $detect_emerald/chunk.tmp bingo.tmp

scoreboard players operation $detect_emerald/chunk.random_z_offset bingo.tmp %= 1024 bingo.const
scoreboard players remove $detect_emerald/chunk.random_z_offset bingo.tmp 512
scoreboard players operation $detect_emerald/chunk.random_z_offset bingo.tmp *= 9 bingo.const
#endregion

#region calculate distance

scoreboard players operation $detect_emerald/chunk.cur_distance bingo.tmp += $detect_emerald/chunk.biomex_mod_pos_off bingo.tmp
scoreboard players operation $detect_emerald/chunk.cur_distance bingo.tmp *= $detect_emerald/chunk.cur_distance bingo.tmp

scoreboard players operation $detect_emerald/chunk.random_y_offset bingo.tmp += $detect_emerald/chunk.biomey_mod_pos_off bingo.tmp
scoreboard players operation $detect_emerald/chunk.random_y_offset bingo.tmp *= $detect_emerald/chunk.random_y_offset bingo.tmp

scoreboard players operation $detect_emerald/chunk.random_z_offset bingo.tmp += $detect_emerald/chunk.biomez_mod_neg_off bingo.tmp
scoreboard players operation $detect_emerald/chunk.random_z_offset bingo.tmp *= $detect_emerald/chunk.random_z_offset bingo.tmp

scoreboard players operation $detect_emerald/chunk.cur_distance bingo.tmp += $detect_emerald/chunk.random_y_offset bingo.tmp
scoreboard players operation $detect_emerald/chunk.cur_distance bingo.tmp += $detect_emerald/chunk.random_z_offset bingo.tmp

# Short-circut execution in case the found distance is lower than the lowest
# distance that still works
execute if score $detect_emerald/chunk.min_distance bingo.tmp <= $detect_emerald/chunk.cur_distance bingo.tmp run function bingo:game/emerald_detection/chunk/find_valid_coordinate_6
#endregion

#endregion