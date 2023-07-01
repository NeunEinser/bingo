#> fetchr:game/start/initialize_countdown
#
# Sets the spawnpoint for all players and spawns a marker aec incase the player
# respawns in the overworld
#
# @within function fetchr:game/start/until_player_on_ground

#>
# @internal
#declare tag fetchr.spawn

#>
# The countdown timer
# @within
# 	function fetchr:game/start/initialize_countdown
# 	function fetchr:game/start/countdown
#declare score_holder $start_game.countdown
scoreboard players set $start_game.countdown fetchr.tmp 3

spawnpoint @a[predicate=fetchr:is_in_game] ~ ~ ~
execute as @a[predicate=fetchr:is_in_game, gamemode=adventure] rotated as @s run teleport @s ~ ~ ~

schedule function fetchr:game/start/countdown 1s