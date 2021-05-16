#> bingo:game/start/start_game
#
# This function is responsible for properly initializing the game
#
# @within function bingo:game/start/countdown

execute at @e[type=minecraft:area_effect_cloud, tag=bingo.spawn, limit=1] rotated as @s run tp ~ ~ ~
scoreboard players set $game_state bingo.state 2

tellraw @s {"text": "GO!"}
tellraw @s [{"translate": "bingo.game.go_to_lobby", "with": [{"translate": "bingo.game.go_to_lobby.click", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger bingo.lobby"}}]}, "\n", {"translate": "bingo.game.go_to_lobby.hint", "color": "gray", "italic": true, "with": [{"text": "/trigger bingo.lobby", "color": "white", "italic": false, "clickEvent": {"action": "suggest_command", "value": "/trigger bingo.lobby"}}]}]
execute at @s run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 1

effect clear @s
clear @s
gamemode survival @s
experience set @s 0 levels
gamerule doDaylightCycle true

execute in bingo:lobby run data modify block 0 0 0 auto set value true

team modify bingo.aqua seeFriendlyInvisibles true
team modify bingo.black seeFriendlyInvisibles true
team modify bingo.blue seeFriendlyInvisibles true
team modify bingo.dark_aqua seeFriendlyInvisibles true
team modify bingo.dark_blue seeFriendlyInvisibles true
team modify bingo.dark_gray seeFriendlyInvisibles true
team modify bingo.dark_green seeFriendlyInvisibles true
team modify bingo.dark_purpl seeFriendlyInvisibles true
team modify bingo.dark_red seeFriendlyInvisibles true
team modify bingo.gold seeFriendlyInvisibles true
team modify bingo.gray seeFriendlyInvisibles true
team modify bingo.green seeFriendlyInvisibles true
team modify bingo.light_purp seeFriendlyInvisibles true
team modify bingo.red seeFriendlyInvisibles true
team modify bingo.white seeFriendlyInvisibles true
team modify bingo.yellow seeFriendlyInvisibles true

execute in bingo:lobby run function neun_einser.timer:start/hundredth_of_second
execute at @s run fill ~-1 0 ~-1 ~1 130 ~1 minecraft:air replace minecraft:barrier