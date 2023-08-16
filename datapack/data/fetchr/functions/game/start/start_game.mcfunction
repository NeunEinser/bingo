#> fetchr:game/start/start_game
#
# This function is responsible for properly initializing the game
#
# @within function fetchr:game/start/countdown

execute as @e[distance=..10000] run function fetchr:game/start/unfreeze_entity

forceload remove all
forceload add 0 0
forceload add ~ ~

scoreboard players set $game_state fetchr.state 3
execute as @a[predicate=fetchr:is_in_game] run function fetchr:game/start/player_init

gamerule doDaylightCycle true

execute in fetchr:lobby run data modify block 5 3 5 auto set value true

team modify fetchr.light_blue seeFriendlyInvisibles true
team modify fetchr.black seeFriendlyInvisibles true
team modify fetchr.blue seeFriendlyInvisibles true
team modify fetchr.cyan seeFriendlyInvisibles true
team modify fetchr.dark_blue seeFriendlyInvisibles true
team modify fetchr.dark_gray seeFriendlyInvisibles true
team modify fetchr.green seeFriendlyInvisibles true
team modify fetchr.purple seeFriendlyInvisibles true
team modify fetchr.dark_red seeFriendlyInvisibles true
team modify fetchr.orange seeFriendlyInvisibles true
team modify fetchr.gray seeFriendlyInvisibles true
team modify fetchr.lime seeFriendlyInvisibles true
team modify fetchr.magenta seeFriendlyInvisibles true
team modify fetchr.red seeFriendlyInvisibles true
team modify fetchr.white seeFriendlyInvisibles true
team modify fetchr.yellow seeFriendlyInvisibles true

scoreboard players set $lockout_race_ended fetchr.state 0

fill ~-1 62 ~-1 ~1 319 ~1 minecraft:air replace minecraft:barrier
execute if score $use_in_game_time fetchr.settings matches 0 run function neun_einser.timer:start/hundredth_of_second
execute if score $use_in_game_time fetchr.settings matches 1 run function neun_einser.timer:start/gametime