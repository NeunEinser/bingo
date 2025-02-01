#> fetchr:game/start/player_init
#
# This function is responsible for properly setting everything for the players
#
# @within function fetchr:game/start/start_game

execute \
	rotated as @s \
	run teleport ~ ~ ~
tellraw @s { "translate": "fetchr.game.start.countdown_completed" }
function fetchr:game/menu/print_with_hint
execute \
	at @s \
	run playsound minecraft:block.note_block.pling voice @s ~ ~ ~ 1 1

effect clear @s
clear @s
gamemode creative @s
gamemode survival @s
experience set @s 0 levels
experience set @s 0 points

#NEUN_SCRIPT until 49
#execute \
	as @a \
	run attribute @s minecraft:player.entity_interaction_range modifier remove fetchr:card_item_frame_range
#NEUN_SCRIPT end
#NEUN_SCRIPT since 49
execute \
	as @a \
	run attribute @s minecraft:entity_interaction_range modifier remove fetchr:card_item_frame_range
#NEUN_SCRIPT end

execute \
	if score $allow_spectating fetchr.settings matches 1 \
	run scoreboard players enable @s fetchr.spectator
execute \
	if score $blind_mode fetchr.state matches 1 \
	run scoreboard players enable @s fetchr.reveal_card
