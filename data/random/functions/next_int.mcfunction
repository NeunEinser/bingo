scoreboard players operation $cur_seed random_main *= $a random_main
#scoreboard players operation $cur_seed random_main %= $m random_main
#scoreboard players operation $cur_seed random_main += $c random_main

scoreboard players operation $result random_main = $cur_seed random_main
execute if score $max_val random_main matches -2147483648..2147483647 run scoreboard players operation $result random_main %= $max_val random_main
scoreboard players reset $max_val random_main