scoreboard players operation $a math_main = $categories bingo.tmp
scoreboard players operation $b math_main = $weight_multiplier bingo.tmp
function math:greatest_common_divisor

scoreboard players operation $multiplier bingo.tmp = $categories bingo.tmp
scoreboard players operation $multiplier bingo.tmp /= $result math_main

scoreboard players operation $total_weight bingo.tmp *= $multiplier bingo.tmp
scoreboard players operation $weight_multiplier bingo.tmp *= $multiplier bingo.tmp

function bingo:card_generation/category/prepare_item