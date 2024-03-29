#> fetchr:game/join_as_spectator
#
# This function will put the player inside of the currently running game, as a
# spectator
#
# @context entity Player changing the setting

scoreboard players operation @s fetchr.game_id = $current_game_id fetchr.game_id
execute at @e[type=minecraft:marker, tag=fetchr.spawn, limit=1] positioned over motion_blocking_no_leaves run teleport @s ~ ~ ~
tag @s add fetchr.spectator
scoreboard players enable @s fetchr.lobby
gamemode creative @s
gamemode spectator @s

tellraw @a {"translate":"fetchr.game.start_spectating","with":[{"selector":"@s"}]}
