#> fetchr:game/start/start_game
#
# This function is responsible for properly initializing the game
#
# @within function fetchr:game/start/countdown

execute at @e[type=minecraft:area_effect_cloud, tag=fetchr.spawn, limit=1] rotated as @s run tp ~ ~ ~
execute at @e[type=minecraft:area_effect_cloud, tag=fetchr.spawn, limit=1] run forceload add ~ ~
scoreboard players set $game_state fetchr.state 3

tellraw @s {"translate": "fetchr.game.start.countdown_completed"}
function fetchr:game/menu/print_with_hint
execute at @s run playsound minecraft:block.note_block.pling voice @s ~ ~ ~ 1 1

effect clear @s
clear @s
gamemode survival @s
experience set @s 0 levels
experience set @s 0 points
gamerule doDaylightCycle true

execute in fetchr:lobby run data modify block 5 3 5 auto set value true

team modify fetchr.aqua seeFriendlyInvisibles true
team modify fetchr.black seeFriendlyInvisibles true
team modify fetchr.blue seeFriendlyInvisibles true
team modify fetchr.dark_aqua seeFriendlyInvisibles true
team modify fetchr.dark_blue seeFriendlyInvisibles true
team modify fetchr.dark_gray seeFriendlyInvisibles true
team modify fetchr.dark_green seeFriendlyInvisibles true
team modify fetchr.dark_purple seeFriendlyInvisibles true
team modify fetchr.dark_red seeFriendlyInvisibles true
team modify fetchr.gold seeFriendlyInvisibles true
team modify fetchr.gray seeFriendlyInvisibles true
team modify fetchr.green seeFriendlyInvisibles true
team modify fetchr.light_purple seeFriendlyInvisibles true
team modify fetchr.red seeFriendlyInvisibles true
team modify fetchr.white seeFriendlyInvisibles true
team modify fetchr.yellow seeFriendlyInvisibles true

execute at @s run fill ~-1 0 ~-1 ~1 130 ~1 minecraft:air replace minecraft:barrier
execute in fetchr:lobby run function neun_einser.timer:start/hundredth_of_second