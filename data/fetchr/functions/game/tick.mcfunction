#> fetchr:game/tick
#
# This function is called every tick when a game is running
#
# @within function fetchr:tick/tick

#execute in fetchr:lobby run function neun_einser.timer:detect_pause
teleport @a[predicate=fetchr:is_in_overworld, tag=!fetchr.resourcepack_check] @e[type=minecraft:marker, tag=fetchr.spawn, limit=1]

#>
# Count of players in the game
#
# @private
#declare score_holder $game/tick.player_count
execute store result score $game/tick.player_count fetchr.tmp if entity @a[gamemode=survival, predicate=fetchr:is_in_game]

#>
# Count of players sleeping
#
# @private
#declare score_holder $game/tick.sleeping_players
execute store result score $game/tick.sleeping_players fetchr.tmp if entity @a[gamemode=survival, predicate=fetchr:is_in_game, nbt={SleepTimer: 99s}]

execute if score $game/tick.player_count fetchr.tmp matches 1.. if score $game/tick.player_count fetchr.tmp = $game/tick.sleeping_players fetchr.tmp run function fetchr:game/skip_night

execute as @a[predicate=fetchr:is_in_game] run function fetchr:game/player_tick