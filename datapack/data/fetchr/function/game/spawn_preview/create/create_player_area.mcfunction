#> fetchr:game/spawn_preview/create/create_player_area
#
# Creates the spawn preview room
#
# @within function fetchr:game/spawn_preview/create/internal
# @context
# 	entity Spawn marker
# 	position the lowest non-air block with sky access at spawn

setblock ~-1 ~ ~-1 minecraft:structure_block[mode=load]{ mode: "LOAD", ignoreEntities: false, posY:0, name: "fetchr:spawn_preview" }
setblock ~-1 ~1 ~-1 minecraft:redstone_block
execute \
	if block ~-1 ~ ~-1 minecraft:structure_block \
	run setblock ~-1 ~ ~-1 minecraft:air
execute \
	if block ~-1 ~1 ~-1 minecraft:redstone_block \
	run setblock ~-1 ~1 ~-1 minecraft:air

#NEUN_SCRIPT until 69
#execute \
	if score $is_multiplayer fetchr.state matches 1 \
	run setblock ~ ~2 ~9 minecraft:warped_wall_sign[facing=east]{\
		front_text: {\
			messages: [\
				'{\
					"translate": "fetchr.spawn_preview.teleport_all.sign.line1",\
					"bold": true,\
					"color": "#8eedeb",\
					"clickEvent": { "action": "run_command", "value": "function fetchr:game/spawn_preview/teleport_all" }\
				}',\
				'{ "translate": "fetchr.spawn_preview.teleport_all.sign.line2", "bold": true, "color": "#8eedeb" }',\
				'{ "translate": "fetchr.spawn_preview.teleport_all.sign.line3", "bold": true, "color": "#8eedeb" }',\
				'{ "translate": "fetchr.spawn_preview.teleport_all.sign.line4", "bold": true, "color": "#8eedeb" }'\
			]\
		}\
	}
#execute \
	if score $is_multiplayer fetchr.state matches 1 \
	run setblock ~15 ~2 ~5 minecraft:warped_wall_sign[facing=west]{\
		front_text: {\
			messages: [\
				'{\
					"translate": "fetchr.spawn_preview.teleport_all.sign.line1",\
					"bold": true,\
					"color": "#8eedeb",\
					"clickEvent": { "action": "run_command", "value": "function fetchr:game/spawn_preview/teleport_all" }\
				}',\
				'{ "translate": "fetchr.spawn_preview.teleport_all.sign.line2", "bold": true, "color": "#8eedeb" }',\
				'{ "translate": "fetchr.spawn_preview.teleport_all.sign.line3", "bold": true, "color": "#8eedeb" }',\
				'{ "translate": "fetchr.spawn_preview.teleport_all.sign.line4", "bold": true, "color": "#8eedeb" }'\
			]\
		}\
	}
#NEUN_SCRIPT end
#NEUN_SCRIPT since 69
execute \
	if score $is_multiplayer fetchr.state matches 1 \
	run setblock ~ ~2 ~9 minecraft:warped_wall_sign[facing=east]{\
		front_text: {\
			messages: [\
				{\
					translate: "fetchr.spawn_preview.teleport_all.sign.line1",\
					bold: true,\
					color: "#8eedeb",\
					click_event: { action: "run_command", command: "function fetchr:game/spawn_preview/teleport_all" }\
				},\
				{ translate: "fetchr.spawn_preview.teleport_all.sign.line2", bold: true, color: "#8eedeb" },\
				{ translate: "fetchr.spawn_preview.teleport_all.sign.line3", bold: true, color: "#8eedeb" },\
				{ translate: "fetchr.spawn_preview.teleport_all.sign.line4", bold: true, color: "#8eedeb" }\
			]\
		}\
	}
execute \
	if score $is_multiplayer fetchr.state matches 1 \
	run setblock ~15 ~2 ~5 minecraft:warped_wall_sign[facing=west]{\
		front_text: {\
			messages: [\
				{\
					translate: "fetchr.spawn_preview.teleport_all.sign.line1",\
					bold: true,\
					color: "#8eedeb",\
					click_event: { action: "run_command", command: "function fetchr:game/spawn_preview/teleport_all" }\
				},\
				{ translate: "fetchr.spawn_preview.teleport_all.sign.line2", bold: true, color: "#8eedeb" },\
				{ translate: "fetchr.spawn_preview.teleport_all.sign.line3", bold: true, color: "#8eedeb" },\
				{ translate: "fetchr.spawn_preview.teleport_all.sign.line4", bold: true, color: "#8eedeb" }\
			]\
		}\
	}
#NEUN_SCRIPT end

teleport @s ~7 ~1 ~7
execute \
	as @a[predicate=fetchr:is_in_game] \
	run forceload add ~-1 ~-1 ~1 ~1 
execute \
	at @e[\
		type=minecraft:item_frame,\
		tag=fetchr.card_frame,\
		scores={fetchr.lobby_card_frame_id=0},\
		distance=100..,\
		limit=1\
	] \
	run clone ~ ~-4 ~-1 ~4 ~ ~-1 0 315 0

execute \
	at @e[\
		type=minecraft:item_frame,\
		tag=fetchr.card_frame,\
		scores={fetchr.lobby_card_frame_id=0},\
		distance=100..,\
		limit=1\
	] \
	run setblock ~ ~-4 ~-1 stone
clone 0 315 0 4 319 0 ~5 ~1 ~-1 masked
execute \
	as @a[predicate=fetchr:is_in_game] \
	positioned ~7 ~1 ~7 \
	run function fetchr:game/spawn_preview/join_game

execute \
	as @a[team=fetchr.black,limit=1] \
	run function fetchr:game/spawn_preview/setup_team_display/black
execute \
	as @a[team=fetchr.blue,limit=1] \
	run function fetchr:game/spawn_preview/setup_team_display/blue
execute \
	as @a[team=fetchr.cyan,limit=1] \
	run function fetchr:game/spawn_preview/setup_team_display/cyan
execute \
	as @a[team=fetchr.dark_blue,limit=1] \
	run function fetchr:game/spawn_preview/setup_team_display/dark_blue
execute \
	as @a[team=fetchr.dark_gray,limit=1] \
	run function fetchr:game/spawn_preview/setup_team_display/dark_gray
execute \
	as @a[team=fetchr.dark_red,limit=1] \
	run function fetchr:game/spawn_preview/setup_team_display/dark_red
execute \
	as @a[team=fetchr.gray,limit=1] \
	run function fetchr:game/spawn_preview/setup_team_display/gray
execute \
	as @a[team=fetchr.green,limit=1] \
	run function fetchr:game/spawn_preview/setup_team_display/green
execute \
	as @a[team=fetchr.light_blue,limit=1] \
	run function fetchr:game/spawn_preview/setup_team_display/light_blue
execute \
	as @a[team=fetchr.lime,limit=1] \
	run function fetchr:game/spawn_preview/setup_team_display/lime
execute \
	as @a[team=fetchr.magenta,limit=1] \
	run function fetchr:game/spawn_preview/setup_team_display/magenta
execute \
	as @a[team=fetchr.orange,limit=1] \
	run function fetchr:game/spawn_preview/setup_team_display/orange
execute \
	as @a[team=fetchr.purple,limit=1] \
	run function fetchr:game/spawn_preview/setup_team_display/purple
execute \
	as @a[team=fetchr.red,limit=1] \
	run function fetchr:game/spawn_preview/setup_team_display/red
execute \
	as @a[team=fetchr.white,limit=1] \
	run function fetchr:game/spawn_preview/setup_team_display/white
execute \
	as @a[team=fetchr.yellow,limit=1] \
	run function fetchr:game/spawn_preview/setup_team_display/yellow

execute \
	positioned ~7 ~1 ~7 as @a[predicate=fetchr:is_in_lobby, tag=fetchr.automatically_join_game] \
	run function fetchr:game/spawn_preview/join_game
fill 0 315 0 4 319 0 minecraft:air

function fetchr:card_frames/spawn
execute \
	positioned ~7 ~1 ~7 \
	run function #fetchr:spawn_preview/created
