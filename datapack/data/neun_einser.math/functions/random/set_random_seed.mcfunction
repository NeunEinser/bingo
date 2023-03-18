#> neun_einser.math:random/set_random_seed
#
# Sets the current seed of the lcg to a random seed.
#
# @api
# @input score $rand.max 91.math.io max value
# @output score $rand.out 91.math.io return value

scoreboard players set $rand.seed 91.math.io 0

execute if predicate neun_einser.math:rand run scoreboard players set $rand.seed 91.math.io -2147483648
execute if predicate neun_einser.math:rand run scoreboard players add $rand.seed 91.math.io 1073741824
execute if predicate neun_einser.math:rand run scoreboard players add $rand.seed 91.math.io 536870912
execute if predicate neun_einser.math:rand run scoreboard players add $rand.seed 91.math.io 268435456
execute if predicate neun_einser.math:rand run scoreboard players add $rand.seed 91.math.io 134217728
execute if predicate neun_einser.math:rand run scoreboard players add $rand.seed 91.math.io 67108864
execute if predicate neun_einser.math:rand run scoreboard players add $rand.seed 91.math.io 33554432
execute if predicate neun_einser.math:rand run scoreboard players add $rand.seed 91.math.io 16777216
execute if predicate neun_einser.math:rand run scoreboard players add $rand.seed 91.math.io 8388608
execute if predicate neun_einser.math:rand run scoreboard players add $rand.seed 91.math.io 4194304
execute if predicate neun_einser.math:rand run scoreboard players add $rand.seed 91.math.io 2097152
execute if predicate neun_einser.math:rand run scoreboard players add $rand.seed 91.math.io 1048576
execute if predicate neun_einser.math:rand run scoreboard players add $rand.seed 91.math.io 524288
execute if predicate neun_einser.math:rand run scoreboard players add $rand.seed 91.math.io 262144
execute if predicate neun_einser.math:rand run scoreboard players add $rand.seed 91.math.io 131072
execute if predicate neun_einser.math:rand run scoreboard players add $rand.seed 91.math.io 65536
execute if predicate neun_einser.math:rand run scoreboard players add $rand.seed 91.math.io 32768
execute if predicate neun_einser.math:rand run scoreboard players add $rand.seed 91.math.io 16384
execute if predicate neun_einser.math:rand run scoreboard players add $rand.seed 91.math.io 8192
execute if predicate neun_einser.math:rand run scoreboard players add $rand.seed 91.math.io 4096
execute if predicate neun_einser.math:rand run scoreboard players add $rand.seed 91.math.io 2048
execute if predicate neun_einser.math:rand run scoreboard players add $rand.seed 91.math.io 1024
execute if predicate neun_einser.math:rand run scoreboard players add $rand.seed 91.math.io 512
execute if predicate neun_einser.math:rand run scoreboard players add $rand.seed 91.math.io 256
execute if predicate neun_einser.math:rand run scoreboard players add $rand.seed 91.math.io 128
execute if predicate neun_einser.math:rand run scoreboard players add $rand.seed 91.math.io 64
execute if predicate neun_einser.math:rand run scoreboard players add $rand.seed 91.math.io 32
execute if predicate neun_einser.math:rand run scoreboard players add $rand.seed 91.math.io 16
execute if predicate neun_einser.math:rand run scoreboard players add $rand.seed 91.math.io 8
execute if predicate neun_einser.math:rand run scoreboard players add $rand.seed 91.math.io 4
execute if predicate neun_einser.math:rand run scoreboard players add $rand.seed 91.math.io 2
execute if predicate neun_einser.math:rand run scoreboard players add $rand.seed 91.math.io 1