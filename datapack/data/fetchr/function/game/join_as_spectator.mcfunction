#> fetchr:game/join_as_spectator
#
# This function will put the player inside of the currently running game, as a
# spectator
#
# @context entity Player changing the setting

scoreboard players operation @s fetchr.game_id = $current_game_id fetchr.game_id
execute at @e[type=minecraft:marker, tag=fetchr.spawn, limit=1] positioned over motion_blocking_no_leaves run teleport @s ~ ~ ~
tag @s add fetchr.spectator
scoreboard players reset @s fetchr.pref

scoreboard players reset @s fetchr.seed
scoreboard players reset @s fetchr.settings
scoreboard players reset @s fetchr.pre_gen_radius
scoreboard players reset @s fetchr.points_race_minutes
scoreboard players enable @s fetchr.lobby

gamemode creative @s
gamemode spectator @s

tellraw @a {"translate":"fetchr.game.start_spectating","with":[{"selector":"@s"}]}

execute \
	if score $game_state fetchr.state matches 3 \
	run schedule function fetchr:game/start/countdown 1t replace
