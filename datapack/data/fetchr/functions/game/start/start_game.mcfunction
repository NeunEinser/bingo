#> fetchr:game/start/start_game
#
# This function is responsible for properly initializing the game
#
# @within function fetchr:game/start/countdown

teleport @e[type=!minecraft:player, type=!minecraft:marker, type=!minecraft:bee, type=!minecraft:item, tag=!fetchr.generated_entity, distance=..10000] ~ -128 ~
execute as @e[tag=fetchr.generated_entity, distance=..10000] run function fetchr:game/start/unfreeze_entity

forceload remove all
forceload add 0 0
forceload add ~ ~

scoreboard players set $game_state fetchr.state 3
execute as @a[predicate=fetchr:is_in_game] run function fetchr:game/start/player_init

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


fill ~-1 62 ~-1 ~1 319 ~1 minecraft:air replace minecraft:barrier
function neun_einser.timer:start/hundredth_of_second