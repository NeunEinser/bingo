#> bingo:game/start/set_spawn
#
# Sets the spawnpoint for all players and spawns a marker aec incase the player
# respawns in the overworld
#
# @within function bingo:game/start/start_game

#>
# @within function bingo:game/**
#declare tag bingo.spawn

spawnpoint @a[predicate=!bingo:is_in_lobby] ~ ~ ~
forceload add ~ ~
summon minecraft:area_effect_cloud ~ ~ ~ {Age: -2147483648, Duration: -1, WaitTime: -2147483648, Tags: ["bingo.spawn"]}