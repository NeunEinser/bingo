scoreboard players operation $a math_main = $categories bingo_tmp
scoreboard players operation $b math_main = $weight_multiplier bingo_tmp
function math:greatest_common_divisor

scoreboard players operation $multiplier bingo_tmp = $categories bingo_tmp
scoreboard players operation $multiplier bingo_tmp /= $result math_main

scoreboard players operation $total_weight bingo_tmp *= $multiplier bingo_tmp
scoreboard players operation $weight_multiplier bingo_tmp *= $multiplier bingo_tmp

function bingo:card_generation/category/prepare_item