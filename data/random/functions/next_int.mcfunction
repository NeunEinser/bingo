scoreboard players operation $result random_main = $a random_main
scoreboard players operation $result random_main *= $cur_seed random_main
scoreboard players operation $result random_main %= $m random_main
scoreboard players operation $result random_main += $c random_main
scoreboard players operation $cur_seed random_main = $result random_main

scoreboard players operation $result random_main %= $max_val random_main