scoreboard players operation @s bingo_id = $next bingo_id
execute store result storage bingo:item id int 1 run scoreboard players get $next bingo_id
data modify storage bingo:main items append from storage bingo:item
scoreboard players add $next bingo_id 1