#> fetchr:init/update_lobby/update_entity/manipulate_old
#
# Handles special updates to entity data after the main update has been
# executed. 
#
# @within
# 	tag/function fetchr:lobby_update/manipulate_updated_entity

teleport @s ~ ~ ~ ~ ~

execute \
	if items entity @s armor.* minecraft:player_head \
	if items entity @e[tag=fetchr.current_new,distance=0..,limit=1] armor.* minecraft:player_head \
	run function fetchr:init/update_lobby/update_entity/update_player_head/armor
execute \
	if items entity @s weapon.mainhand minecraft:player_head \
	if items entity @e[tag=fetchr.current_new,distance=0..,limit=1] weapon.mainhand minecraft:player_head \
	run item replace entity @s weapon.mainhand from entity @e[tag=fetchr.current_new,distance=0..,limit=1] weapon.mainhand
execute \
	if items entity @s weapon.offhand minecraft:player_head \
	if items entity @e[tag=fetchr.current_new,distance=0..,limit=1] weapon.offhand minecraft:player_head \
	run item replace entity @s weapon.offhand from entity @e[tag=fetchr.current_new,distance=0..,limit=1] weapon.offhand
execute \
	if items entity @s container.* minecraft:player_head \
	if items entity @e[tag=fetchr.current_new,distance=0..,limit=1] container.* minecraft:player_head \
	run function fetchr:init/update_lobby/update_entity/update_player_head/container
execute \
	if items entity @s horse.* minecraft:player_head \
	if items entity @e[tag=fetchr.current_new,distance=0..,limit=1] horse.* minecraft:player_head \
	run function fetchr:init/update_lobby/update_entity/update_player_head/horse
execute \
	if items entity @s horse.chest minecraft:player_head \
	if items entity @e[tag=fetchr.current_new,distance=0..,limit=1] horse.chest minecraft:player_head \
	run item replace entity @s horse.chest from entity @e[tag=fetchr.current_new,distance=0..,limit=1] horse.chest
#NEUN_SCRIPT until 63
#execute \
	if items entity @s horse.saddle minecraft:player_head \
	if items entity @e[tag=fetchr.current_new,distance=0..,limit=1] horse.saddle minecraft:player_head \
	run item replace entity @s horse.saddle from entity @e[tag=fetchr.current_new,distance=0..,limit=1] horse.saddle
#NEUN_SCRIPT end
#NEUN_SCRIPT since 63
execute \
	if items entity @s saddle minecraft:player_head \
	if items entity @e[tag=fetchr.current_new,distance=0..,limit=1] saddle minecraft:player_head \
	run item replace entity @s saddle from entity @e[tag=fetchr.current_new,distance=0..,limit=1] saddle
#NEUN_SCRIPT end


tag @s remove fetchr.current_old