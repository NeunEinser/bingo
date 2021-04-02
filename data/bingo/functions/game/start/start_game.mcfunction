#> bingo:game/start/start_game
#
# This function is responsible for properly initializing the game
#
# @within function bingo:game/start/countdown

execute at @e[type=minecraft:area_effect_cloud, tag=bingo.spawn, limit=1] rotated as @s run tp ~ ~ ~

tellraw @s {"text": "GO!"}
tellraw @s [{"translate": "bingo.game.go_to_lobby", "with": [{"translate": "bingo.game.go_to_lobby.click", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger bingo.lobby"}}]}, "\n", {"translate": "bingo.game.go_to_lobby.hint", "color": "gray", "italic": true, "with": [{"text": "/trigger bingo.lobby", "color": "white", "italic": false, "clickEvent": {"action": "suggest_command", "value": "/trigger bingo.lobby"}}]}]
execute at @s run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 1

effect clear @s
clear @s
gamemode adventure @s
experience set @s 0 levels
gamerule doDaylightCycle true
advancement revoke @s from bingo:item_detection/root

execute in bingo:lobby run function neun_einser.timer:start/hundredth_of_second
execute at @s run fill ~-1 0 ~-1 ~1 129 ~1 minecraft:air replace minecraft:barrier