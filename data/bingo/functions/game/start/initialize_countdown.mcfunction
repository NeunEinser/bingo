#> bingo:game/start/initialize_countdown
#
# Sets the spawnpoint for all players and spawns a marker aec incase the player
# respawns in the overworld
#
# @within function bingo:game/start/until_player_on_ground

#>
# @within function bingo:game/**
#declare tag bingo.spawn

#>
# The countdown timer
# @within
# 	function bingo:game/start/initialize_countdown
# 	function bingo:game/start/countdown
#declare score_holder $start_game.countdown
scoreboard players set $start_game.countdown bingo.schedule 3

spawnpoint @a[predicate=bingo:is_in_game] ~ ~ ~
forceload add ~ ~
summon minecraft:area_effect_cloud ~ ~ ~ {Age: -2147483648, Duration: -1, WaitTime: -2147483648, Tags: ["bingo.spawn"]}
teleport @a[predicate=bingo:is_in_game, gamemode=adventure] ~ ~ ~

schedule function bingo:game/start/countdown 1s