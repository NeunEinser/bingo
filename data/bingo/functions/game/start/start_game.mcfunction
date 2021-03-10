#> bingo:game/start/start_game
#
# This function is responsible for properly initializing the game
#
# @within function bingo:game/start/countdown

execute as @a at @s run spawnpoint @s ~ ~ ~
tellraw @a {"text": "GO!"}
execute as @a at @s run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 1

effect clear @a
clear @a
gamerule doDaylightCycle true
advancement revoke @a from bingo:item_detection/root
execute in bingo:lobby run function neun_einser.timer:start/hundredth_of_second