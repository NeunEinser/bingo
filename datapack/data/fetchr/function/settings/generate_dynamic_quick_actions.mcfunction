#> fetchr:settings/generate_dynamic_quick_actions
#
# Generates a quick dynamic actions dialog for the current state
#
# @within function fetchr:settings/handle_settings

#NEUN_SCRIPT since 77
$data modify storage io.fetchr:dialog dialog set value {\
	type: "minecraft:multi_action",\
	pause: false,\
	title: { translate: "menu.quick_actions.title" },\
	actions: [\
		{\
			label: { translate: "fetchr.lobby.card_generation.random_card.dialog.title" },\
			action: {\
				type: "minecraft:run_command",\
				command: "trigger fetchr.settings set 16",\
			},\
			on_click: {\
				action: "run_command",\
				command: "trigger fetchr.settings set 16",\
			},\
		},\
		{\
			label: { translate: "fetchr.lobby.card_generation.from_seed.dialog.title" },\
			action: {\
				type: "minecraft:run_command",\
				command: "trigger fetchr.settings set 18",\
			},\
			on_click: {\
				action: "run_command",\
				command: "trigger fetchr.settings set 18",\
			},\
		},\
	],\
	after_action: "none",\
	exit_action: {\
		label: { translate: "gui.$(cancel_button_translate)" },\
		action: { type: "minecraft:run_command", command: "trigger fetchr.settings set $(exit_callback_setting_trigger)" },\
	},\
	on_cancel: { action: "run_command", command: "trigger fetchr.settings set $(exit_callback_setting_trigger)" },\
}

execute \
	if predicate fetchr:is_in_lobby \
	run data modify storage io.fetchr:dialog dialog.actions append value {\
		label: { translate: "fetchr.quick_actions.lobby.join_game" },\
		action: {\
			type: "minecraft:run_command",\
			command: "trigger fetchr.settings set 21",\
		},\
		on_click: {\
			action: "run_command",\
			command: "trigger fetchr.settings set 21",\
		},\
	}

execute \
	if predicate fetchr:is_in_game \
	run data modify storage io.fetchr:dialog dialog.actions append value {\
		label: { translate: "fetchr.quick_actions.game.return_to_lobby" },\
		action: {\
			type: "minecraft:run_command",\
			command: "trigger fetchr.lobby",\
		},\
		on_click: {\
			action: "run_command",\
			command: "trigger fetchr.lobby",\
		},\
	}

execute \
	if score $game_state fetchr.state matches 0..2 \
	if score $is_multiplayer fetchr.state matches 1 \
	run data modify storage io.fetchr:dialog dialog.actions append value {\
		label: { translate: "fetchr.quick_actions.lobby.teleport_all" },\
		action: {\
			type: "minecraft:run_command",\
			command: "trigger fetchr.settings set 22",\
		},\
		on_click: {\
			action: "run_command",\
			command: "trigger fetchr.settings set 22",\
		},\
	}

execute \
	if predicate fetchr:is_in_lobby \
	if score $game_state fetchr.state matches 4 \
	if score $is_multiplayer fetchr.state matches 1 \
	run data modify storage io.fetchr:dialog dialog.actions append value {\
		label: { translate: "fetchr.quick_actions.game.teleport_all" },\
		action: {\
			type: "minecraft:run_command",\
			command: "trigger fetchr.settings set 22",\
		},\
		on_click: {\
			action: "run_command",\
			command: "trigger fetchr.settings set 22",\
		},\
	}

execute \
	if score $game_state fetchr.state matches 4 \
	if score $concealed_card fetchr.state matches 1 \
	run data modify storage io.fetchr:dialog dialog.actions append value {\
		label: { translate: "fetchr.quick_actions.reveal_card" },\
		action: {\
			type: "minecraft:run_command",\
			command: "trigger fetchr.reveal_card",\
		},\
		on_click: {\
			action: "run_command",\
			command: "trigger fetchr.reveal_card",\
		},\
	}

function #fetchr:dialog/add_to_quick_actions

execute \
	in fetchr:lobby \
	run data \
		modify block 7 0 7 front_text.messages[0] \
		set value { storage: "io.fetchr:dialog", nbt: "dialog" }
execute \
	in fetchr:lobby \
	run data \
		modify storage tmp.fetchr:settings/dialog quick_actions.dialog \
		set from block 7 0 7 front_text.messages[0]

function fetchr:settings/show_dynamic_dialog with storage tmp.fetchr:settings/dialog quick_actions
#NEUN_SCRIPT end