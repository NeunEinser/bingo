#> fetchr:game/start/player_init
#
# This function is responsible for properly setting everything for the players
#
# @within function fetchr:game/start/start_game

execute rotated as @s run teleport ~ ~ ~
tellraw @s {"translate": "fetchr.game.start.countdown_completed"}
function fetchr:game/menu/print_with_hint
execute at @s run playsound minecraft:block.note_block.pling voice @s ~ ~ ~ 1 1

effect clear @s
attribute @s generic.gravity base set 0.08
clear @s
gamemode survival @s
experience set @s 0 levels
experience set @s 0 points

execute if score $allow_spectating fetchr.settings matches 1 run scoreboard players enable @s fetchr.spectator
execute if score $blind_mode fetchr.state matches 1 run scoreboard players enable @s fetchr.reveal_card
