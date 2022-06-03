#> neun_einser.math:greatest_common_divisor
#
# Calculates the greatest common divisor of a and b and returns it as result
#
# @api
# @input
# 	score $gcd.a 91.math.io first number
# 	score $gcd.b 91.math.io second number
# @output score $gcd.result 91.math.io return value

#>
# Input for neun_einser.math:greatest_common_divisor
#
#@api
#declare score_holder $gcd.a
#>
# Input for neun_einser.math:greatest_common_divisor
#
#@api
#declare score_holder $gcd.b
#>
# Output for neun_einser.math:greatest_common_divisor
#
#@api
#declare score_holder $gcd.result

execute if score $gcd.b 91.math.io > $gcd.a 91.math.io run function neun_einser.math:greatest_common_divisor/swap
scoreboard players operation $gcd.a 91.math.io %= $gcd.b 91.math.io

execute if score $gcd.b 91.math.io matches 0 run scoreboard players operation $gcd.result 91.math.io = $gcd.a 91.math.io
execute if score $gcd.b 91.math.io matches 1.. run function neun_einser.math:greatest_common_divisor