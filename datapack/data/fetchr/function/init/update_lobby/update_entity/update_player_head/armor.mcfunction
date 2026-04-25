#> fetchr:init/update_lobby/update_entity/update_player_head/armor
#
# Updates player head properties in armor slots
#
# @within
# 	fetchr:init/update_lobby/update_entity/manipulate_old

execute \
	if items entity @s armor.head minecraft:player_head \
	if items entity @e[tag=fetchr.current_new,distance=0..,limit=1] armor.head minecraft:player_head \
	run item replace entity @s armor.head from entity @e[tag=fetchr.current_new,distance=0..,limit=1] armor.head
execute \
	if items entity @s armor.chest minecraft:player_head \
	if items entity @e[tag=fetchr.current_new,distance=0..,limit=1] armor.chest minecraft:player_head \
	run item replace entity @s armor.chest from entity @e[tag=fetchr.current_new,distance=0..,limit=1] armor.chest
execute \
	if items entity @s armor.body minecraft:player_head \
	if items entity @e[tag=fetchr.current_new,distance=0..,limit=1] armor.body minecraft:player_head \
	run item replace entity @s armor.body from entity @e[tag=fetchr.current_new,distance=0..,limit=1] armor.body
execute \
	if items entity @s armor.legs minecraft:player_head \
	if items entity @e[tag=fetchr.current_new,distance=0..,limit=1] armor.legs minecraft:player_head \
	run item replace entity @s armor.legs from entity @e[tag=fetchr.current_new,distance=0..,limit=1] armor.legs
execute \
	if items entity @s armor.feet minecraft:player_head \
	if items entity @e[tag=fetchr.current_new,distance=0..,limit=1] armor.feet minecraft:player_head \
	run item replace entity @s armor.feet from entity @e[tag=fetchr.current_new,distance=0..,limit=1] armor.feet