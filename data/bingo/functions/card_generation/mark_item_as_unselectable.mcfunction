scoreboard players operation $id bingo_tmp = @s bingo_id
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_selectable] if score @s bingo_id = $id bingo_tmp run tag @s remove bingo_selectable