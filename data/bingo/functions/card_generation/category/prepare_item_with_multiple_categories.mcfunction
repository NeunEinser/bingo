scoreboard players operation $gcd.a 91.math.io = $categories bingo.tmp
scoreboard players operation $gcd.b 91.math.io = $weight_multiplier bingo.tmp
function neuneinser.math:greatest_common_divisor

scoreboard players operation $multiplier bingo.tmp = $categories bingo.tmp
scoreboard players operation $multiplier bingo.tmp /= $gcd.result 91.math.io

scoreboard players operation $total_weight bingo.tmp *= $multiplier bingo.tmp
scoreboard players operation $weight_multiplier bingo.tmp *= $multiplier bingo.tmp

function bingo:card_generation/category/prepare_item