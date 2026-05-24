#> fetchr:lobby/place_sign
#
# Places the sign corresponding to the current marker
#
# @within function fetchr:lobby/place_indestructible_blocks
# @context
# 	entity The current sign marker

execute if score $is_multiplayer fetchr.state matches 0 if entity @s[tag=fetchr.multiplayer_only] run return 0
execute if score $is_multiplayer fetchr.state matches 1 if entity @s[tag=fetchr.singleplayer_only] run return 0

execute if entity @s[tag=fetchr.sign_north] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=north]
execute if entity @s[tag=fetchr.sign_east] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=east]
execute if entity @s[tag=fetchr.sign_south] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=south]
execute if entity @s[tag=fetchr.sign_west] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=west]
execute if entity @s[tag=fetchr.standing_sign_south] run setblock ~ ~ ~ minecraft:warped_sign[rotation=0]
execute if entity @s[tag=fetchr.danger_sign_east] run setblock ~ ~ ~ minecraft:crimson_wall_sign[facing=east]

data modify entity @s data.fetchr.pls_send_update set value true
data \
	modify entity @s[tag=fetchr.points_goal_sign] data.front_text.messages[3] \
	set from storage fetchr:settings points_goal
data \
	modify entity @s[tag=fetchr.pre_gen_sign] data.front_text.messages[3] \
	set from storage fetchr:settings pre_gen_radius
data \
	modify entity @s[tag=fetchr.allow_spectating_sign] data.front_text.messages[3] \
	set from storage fetchr:settings allow_spectating
data \
	modify entity @s[tag=fetchr.concealed_card_sign] data.front_text.messages[3] \
	set from storage fetchr:settings concealed_card
data \
	modify entity @s[tag=fetchr.gamemode_sign] data.front_text.messages[3] \
	set from storage fetchr:settings lobby_gamemode
data \
	modify entity @s[tag=fetchr.lockout_mode_sign] data.front_text.messages[3] \
	set from storage fetchr:settings lockout
data \
	modify entity @s[tag=fetchr.operator_only_sign] data.front_text.messages[3] \
	set from storage fetchr:settings operator_only
data \
	modify entity @s[tag=fetchr.paused_time_sign] data.front_text.messages[3] \
	set from storage fetchr:settings count_paused_time
data \
	modify entity @s[tag=fetchr.show_seed_sign] data.front_text.messages[3] \
	set from storage fetchr:settings show_seed
data \
	modify entity @s[tag=fetchr.timer_method_sign] data.front_text.messages[3] \
	set from storage fetchr:settings timer_method

data modify block ~ ~ ~ {} merge from entity @s data