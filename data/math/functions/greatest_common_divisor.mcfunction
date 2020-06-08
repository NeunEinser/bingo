execute if score $b math_main > $a math_main run function math:helper/swap
scoreboard players operation $a math_main %= $b math_main

execute if score $b math_main matches 0 run scoreboard players operation $result math_main = $a math_main
execute if score $b math_main matches 1.. run function math:greatest_common_divisor