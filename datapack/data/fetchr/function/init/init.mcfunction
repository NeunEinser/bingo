#> fetchr:init/init
#
# This function is called whenever the datapack is reloaded.
#
# It contains all required declaration and initializes some required values if
# this is the first time this datapack is loaded.
#
# It also contains all Data-Pack Helper Plus' style declarations that are at
# least of visibility @internal.
#
# @within tag/function minecraft:load
# @handles #minecraft:load

setworldspawn 1 0 1
forceload add 0 0

#TODO change to use tmp.fetchr:<name> everywhere
#declare storage fetchr:tmp

#region Storage declarations
	#>
	#
	# @api
	#declare storage fetchr:custom_hud

	#>
	# This storage is used to keep track of all items that are available in Fetchr.
	#
	# The items array contains a list of all items that were registered. The
	# categories array holds all categories. Categories have an items array
	# containing the full item definition, like in the items array.
	#
	# @api
	#declare storage fetchr:items

	#>
	# This is the registry used to register things to Fetchr.
	#
	# To register new things in an extension pack, add your own function to the
	# function tag #fetchr:fill_registries.
	#
	# To execute an action before the registries are processed but after all active
	# extension packs have registered everything, add a function to the function tag
	# #fetchr:post_registration
	#
	# @api
	#declare storage fetchr:registries

	#>
	# This storage holds the current bingo card. It contains information about the
	# currently generated card and about all playing teams' progress.
	#
	# @internal
	#declare storage fetchr:card
#endregion

#region tag declarations
	#>
	# This tag is used for players who enable manual gamemode switching.
	#
	# @internal
	#declare tag fetchr.enable_manual_gamemode_switch
	#>
	# This tag is used to tag the item frames that display the big preview card in
	# the lobby
	#
	# @internal
	#declare tag fetchr.card_frame
	#>
	# Players currently in the skybox.
	#
	# @internal
	#declare tag fetchr.in_skybox
	#>
	# This tag is given to players whose position changed compared to last tick
	# @internal
	#declare tag fetchr.position_changed
	#>
	# This tag is used to automatically make these players join the game when the
	# skybox is ready
	# @internal
	#declare tag fetchr.automatically_join_game
	#>
	# This marks an entity which is used to teleport to a player and read position
	# data. Reading from the the player position directly is super expensive
	# Because MC serializes the entire recipe book.
	# 
	# @internal
	#declare tag fetchr.pos_reader
	#>
	# This tag is given to any player who triggered fetchr.spectator in game.
	#
	# @internal
	#declare tag fetchr.spectator
	#>
	# This tag marks an AEC which may be used for testing wether a string is
	# within a certain set.
	#
	# @internal
	#declare tag fetchr.string_tester
	#>
	# Tag for entities that have been processed by pre-gen.
	#
	# @within function fetchr:game/start/**
	#declare tag fetchr.generated_entity
	#>
	# Tag for entities that were already persistent.
	#
	# @within function fetchr:game/start/**
	#declare tag fetchr.persistance_required
	#>
	# Tag for entities that were already invulnerable.
	#
	# @within function fetchr:game/start/**
	#declare tag fetchr.invulnerable
	#>
	# Tag for chickens that whre already chicken jockeys.
	#
	# @within function fetchr:game/start/**
	#declare tag fetchr.chicken_jockey
	#>
	# This tag is given to players who are currently verifying their resource pack
	#
	# @internal
	#declare tag fetchr.resourcepack_check
	#>
	# @internal
	#declare tag fetchr.chest_generation_marker
	#region slots
		#>
		# This tag marks a player who is in a team that obtained the item in slot 0.
		#
		# @internal
		#declare tag fetchr.has_slot0
		#>
		# This tag marks a player who is in a team that obtained the item in slot 1.
		#
		# @internal
		#declare tag fetchr.has_slot1
		#>
		# This tag marks a player who is in a team that obtained the item in slot 2.
		#
		# @internal
		#declare tag fetchr.has_slot2
		#>
		# This tag marks a player who is in a team that obtained the item in slot 3.
		#
		# @internal
		#declare tag fetchr.has_slot3
		#>
		# This tag marks a player who is in a team that obtained the item in slot 4.
		#
		# @internal
		#declare tag fetchr.has_slot4
		#>
		# This tag marks a player who is in a team that obtained the item in slot 5.
		#
		# @internal
		#declare tag fetchr.has_slot5
		#>
		# This tag marks a player who is in a team that obtained the item in slot 6.
		#
		# @internal
		#declare tag fetchr.has_slot6
		#>
		# This tag marks a player who is in a team that obtained the item in slot 7.
		#
		# @internal
		#declare tag fetchr.has_slot7
		#>
		# This tag marks a player who is in a team that obtained the item in slot 8.
		#
		# @internal
		#declare tag fetchr.has_slot8
		#>
		# This tag marks a player who is in a team that obtained the item in slot 9.
		#
		# @internal
		#declare tag fetchr.has_slot9
		#>
		# This tag marks a player who is in a team that obtained the item in slot 10.
		#
		# @internal
		#declare tag fetchr.has_slot10
		#>
		# This tag marks a player who is in a team that obtained the item in slot 11.
		#
		# @internal
		#declare tag fetchr.has_slot11
		#>
		# This tag marks a player who is in a team that obtained the item in slot 12.
		#
		# @internal
		#declare tag fetchr.has_slot12
		#>
		# This tag marks a player who is in a team that obtained the item in slot 13.
		#
		# @internal
		#declare tag fetchr.has_slot13
		#>
		# This tag marks a player who is in a team that obtained the item in slot 14.
		#
		# @internal
		#declare tag fetchr.has_slot14
		#>
		# This tag marks a player who is in a team that obtained the item in slot 15.
		#
		# @internal
		#declare tag fetchr.has_slot15
		#>
		# This tag marks a player who is in a team that obtained the item in slot 16.
		#
		# @internal
		#declare tag fetchr.has_slot16
		#>
		# This tag marks a player who is in a team that obtained the item in slot 17.
		#
		# @internal
		#declare tag fetchr.has_slot17
		#>
		# This tag marks a player who is in a team that obtained the item in slot 18.
		#
		# @internal
		#declare tag fetchr.has_slot18
		#>
		# This tag marks a player who is in a team that obtained the item in slot 19.
		#
		# @internal
		#declare tag fetchr.has_slot19
		#>
		# This tag marks a player who is in a team that obtained the item in slot 20.
		#
		# @internal
		#declare tag fetchr.has_slot20
		#>
		# This tag marks a player who is in a team that obtained the item in slot 21.
		#
		# @internal
		#declare tag fetchr.has_slot21
		#>
		# This tag marks a player who is in a team that obtained the item in slot 22.
		#
		# @internal
		#declare tag fetchr.has_slot22
		#>
		# This tag marks a player who is in a team that obtained the item in slot 23.
		#
		# @internal
		#declare tag fetchr.has_slot23
		#>
		# This tag marks a player who is in a team that obtained the item in slot 24.
		#
		# @internal
		#declare tag fetchr.has_slot24
	#endregion

	#region lobby blocks
		# TODO: Give markers block id and use 1.20.2 function macro
		#>
		# @within
		# 	function fetchr:init/setup_lobby/start
		# 	function fetchr:init/setup_lobby/end
		# 	function fetchr:lobby/place_indestructible_blocks
		# 	function fetchr:init/setup_lobby/*
		# 	structure fetchr:*
		#declare tag fetchr.lobby_sign
		#>
		# @within
		# 	function fetchr:lobby/*
		# 	function fetchr:init/setup_lobby/*
		# 	structure fetchr:*
		#declare tag fetchr.multiplayer_only
		#>
		# @within
		# 	function fetchr:lobby/*
		# 	function fetchr:init/setup_lobby/*
		# 	structure fetchr:*
		#declare tag fetchr.no_realms
		#>
		# @within
		# 	function fetchr:lobby/*
		# 	function fetchr:init/setup_lobby/*
		# 	structure fetchr:*
		#declare tag fetchr.multiplayer_only_brown
		#>
		# @within
		# 	function fetchr:lobby/*
		# 	function fetchr:init/setup_lobby/*
		# 	structure fetchr:*
		#declare tag fetchr.multiplayer_only_no_replace
		#>
		# @within
		# 	function fetchr:lobby/*
		# 	function fetchr:init/setup_lobby/*
		# 	structure fetchr:*
		#declare tag fetchr.multiplayer_mangrove_button_north
		#>
		# @within
		# 	function fetchr:lobby/*
		# 	function fetchr:init/setup_lobby/*
		# 	structure fetchr:*
		#declare tag fetchr.singleplayer_only
		#>
		# @within
		# 	function fetchr:lobby/*
		# 	function fetchr:init/setup_lobby/*
		# 	structure fetchr:*
		#declare tag fetchr.singleplayer_only_brown
		#>
		# @within
		# 	function fetchr:lobby/*
		# 	function fetchr:init/setup_lobby/*
		# 	structure fetchr:*
		#declare tag fetchr.singleplayer_only_no_replace
		#>
		# @within
		# 	function fetchr:lobby/place_sign
		# 	function fetchr:init/setup_lobby/*
		# 	structure fetchr:*
		#declare tag fetchr.sign_north
		#>
		# @within
		# 	function fetchr:lobby/place_sign
		# 	function fetchr:init/setup_lobby/*
		# 	structure fetchr:*
		#declare tag fetchr.sign_east
		#>
		# @within
		# 	function fetchr:lobby/place_sign
		# 	function fetchr:init/setup_lobby/*
		# 	structure fetchr:*
		#declare tag fetchr.sign_south
		#>
		# @within
		# 	function fetchr:lobby/place_sign
		# 	function fetchr:init/setup_lobby/*
		# 	structure fetchr:*
		#declare tag fetchr.sign_west
		#>
		# @within
		# 	function fetchr:lobby/place_sign
		# 	function fetchr:init/setup_lobby/*
		# 	structure fetchr:*
		#declare tag fetchr.danger_sign_east
		#>
		# @internal
		#declare tag fetchr.join_game_sign
		#>
		# @within
		# 	function fetchr:lobby/settings/toggle_blind_mode
		# 	function fetchr:init/setup_lobby/*
		# 	structure fetchr:card_generation
		#declare tag fetchr.blind_mode_sign
		#>
		# @within
		# 	function fetchr:lobby/settings/toggle_lockout_mode
		# 	function fetchr:init/setup_lobby/*
		# 	structure fetchr:card_generation
		#declare tag fetchr.lockout_mode_sign
		#>
		# @within
		# 	function fetchr:lobby/settings/toggle_timer_method
		# 	function fetchr:init/setup_lobby/*
		# 	structure fetchr:card_generation
		#declare tag fetchr.timer_method_sign
		#>
		# @within
		# 	function fetchr:lobby/settings/toggle_paused_time
		# 	function fetchr:init/setup_lobby/*
		# 	structure fetchr:card_generation
		#declare tag fetchr.paused_time_sign
		#>
		# @within
		# 	function fetchr:lobby/settings/toggle_operator_only
		# 	function fetchr:init/setup_lobby/*
		# 	structure fetchr:card_generation
		#declare tag fetchr.operator_only_sign
		#>
		# @within
		# 	function fetchr:lobby/settings/toggle_gamemode
		# 	function fetchr:init/setup_lobby/*
		# 	structure fetchr:card_generation
		#declare tag fetchr.gamemode_sign
		#>
		# @within
		# 	function fetchr:lobby/settings/set_pre_gen_radius_internal
		# 	function fetchr:init/setup_lobby/*
		# 	structure fetchr:card_generation
		#declare tag fetchr.pre_gen_sign
		#>
		# @within
		# 	function fetchr:lobby/settings/toggle_allow_spectating
		# 	function fetchr:init/setup_lobby/*
		# 	structure fetchr:card_generation
		#declare tag fetchr.allow_spectating_sign
		#>
		# @within
		# 	function fetchr:lobby/settings/toggle_show_seed
		# 	function fetchr:init/setup_lobby/*
		# 	structure fetchr:card_generation
		#declare tag fetchr.show_seed_sign
		#>
		# @within
		# 	function fetchr:lobby/place_indestructible_blocks
		# 	function fetchr:init/setup_lobby/*
		# 	structure fetchr:card_generation
		#declare tag fetchr.multiplayer_door
		#>
		# @within
		# 	function fetchr:lobby/place_indestructible_blocks
		# 	function fetchr:init/setup_lobby/*
		# 	structure fetchr:card_generation
		#declare tag fetchr.mangrove_button_south
		#>
		# @within
		# 	function fetchr:lobby/place_indestructible_blocks
		# 	function fetchr:init/setup_lobby/*
		# 	structure fetchr:card_generation
		#declare tag fetchr.lobby_enderchest
		#>
		# @within
		# 	function fetchr:init/setup_lobby/start
		# 	function fetchr:init/setup_lobby/end
		# 	function fetchr:lobby/place_indestructible_blocks
		# 	function fetchr:init/setup_lobby/*
		# 	structure fetchr:*
		#declare tag fetchr.lobby_lectern
		#>
		# @within
		# 	function fetchr:lobby/place_lectern
		# 	function fetchr:init/setup_lobby/*
		# 	structure fetchr:*
		#declare tag fetchr.lectern_north
		#>
		# @within
		# 	function fetchr:lobby/place_lectern
		# 	function fetchr:init/setup_lobby/*
		# 	structure fetchr:*
		#declare tag fetchr.lectern_east
		#>
		# @within
		# 	function fetchr:lobby/place_lectern
		# 	function fetchr:init/setup_lobby/*
		# 	structure fetchr:*
		#declare tag fetchr.lectern_south
		#>
		# @within
		# 	function fetchr:lobby/place_lectern
		# 	function fetchr:init/setup_lobby/*
		# 	structure fetchr:*
		#declare tag fetchr.lectern_west
		#>
		# @within
		# 	function fetchr:lobby/**
		# 	function fetchr:game/**
		# 	structure fetchr:skybox
		#declare tag fetchr.skybox_button
		#>
		# @within
		# 	function fetchr:game/skybox/**
		# 	structure fetchr:card_generation
		#declare tag fetchr.pressed_button
	#endregion
#endregion

#region setup objectives
	scoreboard objectives remove fetchr.const
	scoreboard objectives remove fetchr.completed_goal_effect_state
	scoreboard objectives remove fetchr.has_item
	scoreboard objectives remove fetchr.last_hud_update
	scoreboard objectives remove fetchr.io
	scoreboard objectives remove fetchr.menu
	scoreboard objectives remove fetchr.menu_page
	scoreboard objectives remove fetchr.pref
	scoreboard objectives remove fetchr.prev_rot
	scoreboard objectives remove fetchr.prev_x_pos
	scoreboard objectives remove fetchr.prev_y_pos
	scoreboard objectives remove fetchr.prev_z_pos
	scoreboard objectives remove fetchr.seed
	scoreboard objectives remove fetchr.resource_pack_check

	#region public objectives
		#>
		# This objective is used to store constants.
		#
		# Sometimes in Minecraft Commands, it is impossible to do a certain operation
		# without using a scoreboard objective and player name.
		#
		# This objective is used to store any constant that is needed for such an
		# operation
		#
		# @public
		scoreboard objectives add fetchr.const dummy

		#>
		# This objective is used for public function's input and output
		#
		# @api
		scoreboard objectives add fetchr.io dummy

		#>
		# This objective holds the game state, such as whether a game is currently
		# running
		#
		# @public
		scoreboard objectives add fetchr.state dummy

		#NEUN_SCRIPT unless realms
		#>
		# This objective is set to 1 for players who confirmed their operator status in
		# strict mode.
		#
		# This uses an objective rather than a tag so that it is possible to remove
		# operators even when they are offline.
		#
		# @public
		scoreboard objectives add fetchr.operator dummy
		#NEUN_SCRIPT end

		#>
		# Whether this player's hud needs to be forcefully updated entirely
		# This is for example set when the player changes hud preferences. 
		#
		# @api
		scoreboard objectives add fetchr.update_hud dummy
		scoreboard players set @a fetchr.update_hud 1
	#endregion

	#region display objectives
		#>
		# Display objective for the black team
		#
		# @internal
		scoreboard objectives add fetchr.neutral_display dummy { "translate": "fetchr.scoreboard.header" }
		
		#>
		# Display objective for the black team
		#
		# @internal
		scoreboard objectives add fetchr.black_display dummy { "translate": "fetchr.scoreboard.header" }
		
		#>
		# Display objective for the blue team
		#
		# @internal
		scoreboard objectives add fetchr.blue_display dummy { "translate": "fetchr.scoreboard.header" }
		
		#>
		# Display objective for the cyan team
		#
		# @internal
		scoreboard objectives add fetchr.cyan_display dummy { "translate": "fetchr.scoreboard.header" }
		
		#>
		# Display objective for the dark blue team
		#
		# @internal
		scoreboard objectives add fetchr.dark_blue_display dummy { "translate": "fetchr.scoreboard.header" }
		
		#>
		# Display objective for the dark gray team
		#
		# @internal
		scoreboard objectives add fetchr.dark_gray_display dummy { "translate": "fetchr.scoreboard.header" }
		
		#>
		# Display objective for the dark red team
		#
		# @internal
		scoreboard objectives add fetchr.dark_red_display dummy { "translate": "fetchr.scoreboard.header" }
		
		#>
		# Display objective for the gray team
		#
		# @internal
		scoreboard objectives add fetchr.gray_display dummy { "translate": "fetchr.scoreboard.header" }
		
		#>
		# Display objective for the green team
		#
		# @internal
		scoreboard objectives add fetchr.green_display dummy { "translate": "fetchr.scoreboard.header" }
		
		#>
		# Display objective for the light blue team
		#
		# @internal
		scoreboard objectives add fetchr.light_blue_display dummy { "translate": "fetchr.scoreboard.header" }
		
		#>
		# Display objective for the lime team
		#
		# @internal
		scoreboard objectives add fetchr.lime_display dummy { "translate": "fetchr.scoreboard.header" }
		
		#>
		# Display objective for the magenta team
		#
		# @internal
		scoreboard objectives add fetchr.magenta_display dummy { "translate": "fetchr.scoreboard.header" }
		
		#>
		# Display objective for the orange team
		#
		# @internal
		scoreboard objectives add fetchr.orange_display dummy { "translate": "fetchr.scoreboard.header" }
		
		#>
		# Display objective for the purple team
		#
		# @internal
		scoreboard objectives add fetchr.purple_display dummy { "translate": "fetchr.scoreboard.header" }
		
		#>
		# Display objective for the red team
		#
		# @internal
		scoreboard objectives add fetchr.red_display dummy { "translate": "fetchr.scoreboard.header" }
		
		#>
		# Display objective for the white team
		#
		# @internal
		scoreboard objectives add fetchr.white_display dummy { "translate": "fetchr.scoreboard.header" }
		
		#>
		# Display objective for the yellow team
		#
		# @internal
		scoreboard objectives add fetchr.yellow_display dummy { "translate": "fetchr.scoreboard.header" }
	#endregion

	#region trigger objectives
		#>
		# Trigger objective for returning to the lobby.
		#
		# @internal
		# @user
		scoreboard objectives add fetchr.lobby trigger

		#>
		# Trigger objective for displaying the Fetchr menu during a game.
		#
		# @internal
		# @user
		scoreboard objectives add fetchr.menu trigger

		#NEUN_SCRIPT unless realms
		#>
		# Trigger objective used to change the pre-generation radius.
		#
		# @internal
		# @user
		scoreboard objectives add fetchr.pre_gen_radius trigger
		#NEUN_SCRIPT end

		#>
		# Trigger objective used to change the announcement time for the points goal.
		#
		# @internal
		# @user
		scoreboard objectives add fetchr.points_race_minutes trigger

		#>
		# Trigger objective used to handle changes / clicks in the preferences menu.
		#
		# @internal
		scoreboard objectives add fetchr.pref trigger

		#NEUN_SCRIPT unless realms
		#>
		# This trigger is used for confirming that the resource pack is active
		#
		# @internal
		scoreboard objectives add fetchr.resource_pack_check trigger
		#NEUN_SCRIPT end

		#>
		# Trigger objective for revealing the card in blind mode.
		#
		# @internal
		# @user
		scoreboard objectives add fetchr.reveal_card trigger

		#>
		# Trigger for teleporting all players back to the lobby.
		#
		# @internal
		# @user
		scoreboard objectives add fetchr.teleport_all trigger

		#>
		# Trigger objective used to generate a bingo card with a set seed.
		#
		# @internal
		# @user
		scoreboard objectives add fetchr.seed trigger

		#>
		# Trigger objective used to switch to spectator mode while in game.
		#
		# @internal
		scoreboard objectives add fetchr.spectator trigger
	#endregion

	#region other internal objectives
		#>
		# This objective holds the position preference of where a player's card should
		# be displayed.
		#
		# @internal
		scoreboard objectives add fetchr.card_position dummy

		#>
		# This objective contains the index for the completed goal effect per player
		#
		# @internal
		scoreboard objectives add fetchr.completed_goal_effect_state dummy

		#>
		# This objective contains unique IDs for the item frames in the lobby.
		#
		# This is needed to identify the correct item frame to use for the current item
		# in card_generation.
		#
		# @internal
		scoreboard objectives add fetchr.lobby_card_frame_id dummy

		#>
		# Setting storage
		#
		# @internal
		scoreboard objectives add fetchr.settings dummy

		#>
		# This objective is used to keep track of the current game id. Players who
		# joined during a different game are teleported back to the lobby.
		#
		# @internal
		scoreboard objectives add fetchr.game_id dummy
		#>
		# The current game id
		#
		# @internal
		#declare score_holder $current_game_id
		scoreboard players add $current_game_id fetchr.game_id 0

		#>
		# This objective is used for item detection to store whether the detect command
		# succeeded for a player.
		#
		# Since this part of item detection uses command blocks, fake players cannot be
		# used here.
		#
		# @internal
		scoreboard objectives add fetchr.has_item dummy

		#>
		# This objective contains unique player IDs, used to identify player-specific
		# data in storage.
		#
		# @internal
		scoreboard objectives add fetchr.player_id dummy

		#>
		# This objective stores the page number of a paginated tellraw
		# a player is currently at.
		#
		# This is for example used for the preferences menu. It would otherwise be
		# impossible to display a generated list with clickable items, as the score
		# values that are used for the trigger need to be hardcoded.
		#
		# This scoreboard holds the page the player currently sees.
		#
		# @internal
		scoreboard objectives add fetchr.menu_page dummy

		#>
		# This objective contains the rotation of entities in the previous tick
		#
		# @internal
		scoreboard objectives add fetchr.prev_rot dummy

		#>
		# This objective contains the x coordinate of entities in the previous tick
		#
		# @internal
		scoreboard objectives add fetchr.prev_x_pos dummy

		#>
		# This objective contains the y coordinate of entities in the previous tick
		#
		# @internal
		scoreboard objectives add fetchr.prev_y_pos dummy

		#>
		# This objective contains the z coordinate of entities in the previous tick
		#
		# @internal
		scoreboard objectives add fetchr.prev_z_pos dummy

		#>
		# This objective is used for temporary calculations.
		#
		# @internal
		scoreboard objectives add fetchr.tmp dummy
	#endregion

	#region private objectives
		#>
		# This objective is used to detect player sleeping for night skipping
		#
		# @within
		#		function fetchr:init/init
		#		function fetchr:game/tick
		#		function fetchr:game/player_tick
		scoreboard objectives add fetchr.bed minecraft.custom:minecraft.sleep_in_bed

		#>
		# The last time the hud was refreshed for each player
		#
		# @within
		#		function fetchr:init/init
		#		function fetchr:custom_hud/*
		scoreboard objectives add fetchr.last_hud_update dummy
		#>
		# This objective is used to detect a player reconnecting
		#
		# @within
		#		function fetchr:init/init
		#		function fetchr:tick/player_tick
		#		function fetchr:tick/handle_player_join
		scoreboard objectives add fetchr.reconnect minecraft.custom:minecraft.leave_game
	#endregion

	#region score holders
		#>
		# The current game state
		# 0 = Lobby / Not in game
		# 1 = Starting / chunk pre-gen
		# 2 = Skybox phase
		# 3 = Countdown phase
		# 4 = Game in progress
		#
		# @public
		#declare score_holder $game_state
		scoreboard players add $game_state fetchr.state 0
		#>
		# Whether this is played on an integrated server (SP or Open to LAN)
		#
		# @public
		#declare score_holder $integrated_server
		scoreboard players set $integrated_server fetchr.state 0
		#>
		# Whether this is multiplayer
		#
		# @public
		#declare score_holder $is_multiplayer
		#NEUN_SCRIPT unless realms
		scoreboard players add $is_multiplayer fetchr.state 0
		#NEUN_SCRIPT end
		#NEUN_SCRIPT if realms
		#scoreboard players set $is_multiplayer fetchr.state 1
		#NEUN_SCRIPT end
		#>
		# The status of chunk pregeneration.
		# 0 = not started
		# 1 = started
		# 2 = completed
		#
		# @public
		#declare score_holder $pregen_status
		scoreboard players add $pregen_status fetchr.state 0
		#>
		# Whether the lobby is already generated.
		#
		# Currently, the lobby only generates once to avoid bugs. This will change in
		# the future though.
		#
		# @public
		#declare score_holder $lobby_generated
		scoreboard players add $lobby_generated fetchr.state 0
		#>
		# Whether the lockout race is determined.
		# 
		# This is used to prevent the lockout goal being announced multiple times.
		# 
		# @public
		#declare score_holder $lockout_race_ended
		scoreboard players add $lockout_race_ended fetchr.state 0
		#>
		# The x location of spawn. Is initialized when players are teleported.
		#
		# @public
		#declare score_holder $spawn_x
		#>
		# The z location of spawn. Is initialized when players are teleported.
		#
		# @public
		#declare score_holder $spawn_z
		#>
		# Whether operator only is turned on
		#
		# @internal
		#declare score_holder $operator_only
		scoreboard players add $operator_only fetchr.settings 0
		#>
		# Which gamemode to use in the lobby.
		#
		# 0 = adventure
		# 1 = survival
		#
		# @internal
		#declare score_holder $lobby_gamemode
		#NEUN_SCRIPT unless realms
		scoreboard players add $lobby_gamemode fetchr.settings 0
		#NEUN_SCRIPT end
		#>
		# The amount of chunks to pre-generate
		#
		# @internal
		#declare score_holder $pregeneration_chunks
		execute \
			unless score $pregeneration_chunks fetchr.settings matches 361.. \
			run scoreboard players set $pregeneration_chunks fetchr.settings 361
		#>
		# Minutes after which the points goal is announced
		# 0 or less means, no announcement
		#
		# @internal
		#declare score_holder $points_goal_announcement_minutes
		scoreboard players add $points_goal_announcement_minutes fetchr.settings 0
		#>
		# Wether the points goal has already been announced this game
		#
		# @internal
		#declare score_holder $points_goal_announced
		scoreboard players add $points_goal_announced fetchr.state 0
		#>
		# Whether spectator mode is enabled during games.
		#
		# @internal
		#declare score_holder $allow_spectating
		execute \
			unless score $allow_spectating fetchr.settings matches 0..1 \
			run scoreboard players set $allow_spectating fetchr.settings 1
		#>
		# Whether you see the seed before the game has ended.
		#
		# @internal
		#declare score_holder $show_seed
		execute \
			unless score $show_seed fetchr.settings matches 0..1 \
			run scoreboard players set $show_seed fetchr.settings 1
		#>
		# Whether in-game time should be used instead if real time.
		#
		# @internal
		#declare score_holder $use_in_game_time
		scoreboard players add $use_in_game_time fetchr.settings 0
		#>
		# Whether blind mode is enabled. In blind mode, players cannot see items on the
		# card until some team has obtained them.
		#
		# @internal
		#declare score_holder $blind_mode
		scoreboard players add $blind_mode fetchr.state 0
		#>
		# Whether lockout mode is enabled. In lockout mode, items can only be obtained
		# once by any team. This also adds a special win condition when a team has
		# obtained an amount of items, no other team can obtain anymore. 
		#
		# @internal
		#declare score_holder $lockout_mode
		scoreboard players add $lockout_mode fetchr.state 0

		#>
		# The current game seed
		#
		# Stored in fetchr.state
		#
		# @internal
		#declare score_holder $seed
		#>
		# The count of currently active teams
		#
		# Stored in fetchr.state
		#
		# @internal
		#declare score_holder $team_count
		#>
		# The current total item weight
		#
		# Stored in fetchr.state
		#
		# @internal
		#declare score_holder $total_item_weight
		#>
		# The weight that is available per category to be split over all items belonging
		# to that category.
		#
		# In the datapack, items define local weights per category. In order to derive
		# a weight for items that works on a global level, there needs to be an
		# available weight per category every category follows, which is derived from
		# lcd values of category's total item weights. 
		#
		# Stored in fetchr.state
		#
		# @internal
		#declare score_holder $available_category_weight
		#>
		# Time from last tick
		#
		# @internal
		#declare score_holder $last_tick_second
		scoreboard players reset $last_tick_second fetchr.state
		#>
		# Whether the card needs to be updated
		#
		# @internal
		#declare score_holder $update_card

		#region constants
			#>
			# @public
			#declare score_holder -2
			scoreboard players set -2 fetchr.const -2
			#>
			# @public
			#declare score_holder -1
			scoreboard players set -1 fetchr.const -1
			#>
			# @public
			#declare score_holder 2
			scoreboard players set 2 fetchr.const 2
			#>
			# @public
			#declare score_holder 3
			scoreboard players set 3 fetchr.const 3
			#>
			# @public
			#declare score_holder 4
			scoreboard players set 4 fetchr.const 4
			#>
			# @public
			#declare score_holder 5
			scoreboard players set 5 fetchr.const 5
			#>
			# @public
			#declare score_holder 6
			scoreboard players set 6 fetchr.const 6
			#>
			# @public
			#declare score_holder 9
			scoreboard players set 9 fetchr.const 9
			#>
			# @public
			#declare score_holder 10
			scoreboard players set 10 fetchr.const 10
			#>
			# @public
			#declare score_holder 16
			scoreboard players set 16 fetchr.const 16
			#>
			# @public
			#declare score_holder 20
			scoreboard players set 20 fetchr.const 20
			#>
			# @public
			#declare score_holder 25
			scoreboard players set 25 fetchr.const 25
			#>
			# @public
			#declare score_holder 32
			scoreboard players set 32 fetchr.const 32
			#>
			# @public
			#declare score_holder 41
			scoreboard players set 41 fetchr.const 41
			#>
			# @public
			#declare score_holder 50
			scoreboard players set 50 fetchr.const 50
			#>
			# @public
			#declare score_holder 60
			scoreboard players set 60 fetchr.const 60
			#>
			# @public
			#declare score_holder 86
			scoreboard players set 86 fetchr.const 86
			#>
			# @public
			#declare score_holder 96
			scoreboard players set 96 fetchr.const 96
			#>
			# @public
			#declare score_holder 100
			scoreboard players set 100 fetchr.const 100
			#>
			# @public
			#declare score_holder 128
			scoreboard players set 128 fetchr.const 128
			#>
			# @public
			#declare score_holder 256
			scoreboard players set 256 fetchr.const 256
			#>
			# @public
			#declare score_holder 762
			scoreboard players set 762 fetchr.const 762
			#>
			# @public
			#declare score_holder 1000
			scoreboard players set 1000 fetchr.const 1000
			#>
			# @public
			#declare score_holder 1376
			scoreboard players set 1376 fetchr.const 1376
			#>
			# @public
			#declare score_holder 65536
			scoreboard players set 65536 fetchr.const 65536
		#endregion
		#region team displays
			#>
			# Black team display
			# @internal
			#declare score_holder $black
			#>
			# Blue team display
			# @internal
			#declare score_holder $blue
			#>
			# Cyan team display
			# @internal
			#declare score_holder $cyan
			#>
			# Dark blue team display
			# @internal
			#declare score_holder $dark_blue
			#>
			# Dark gray team display
			# @internal
			#declare score_holder $dark_gray
			#>
			# Dark red team display
			# @internal
			#declare score_holder $dark_red
			#>
			# Gray team display
			# @internal
			#declare score_holder $gray
			#>
			# Green team display
			# @internal
			#declare score_holder $green
			#>
			# Light blue team display
			# @internal
			#declare score_holder $light_blue
			#>
			# Lime team display
			# @internal
			#declare score_holder $lime
			#>
			# Magenta team display
			# @internal
			#declare score_holder $magenta
			#>
			# Orange team display
			# @internal
			#declare score_holder $orange
			#>
			# Purple team display
			# @internal
			#declare score_holder $purple
			#>
			# Red team display
			# @internal
			#declare score_holder $red
			#>
			# White team display
			# @internal
			#declare score_holder $white
			#>
			# Yellow team display
			# @internal
			#declare score_holder $yellow
		#endregion
	#endregion
	scoreboard objectives setdisplay sidebar fetchr.neutral_display
	scoreboard objectives setdisplay sidebar.team.black fetchr.black_display
	scoreboard objectives setdisplay sidebar.team.blue fetchr.blue_display
	scoreboard objectives setdisplay sidebar.team.dark_aqua fetchr.cyan_display
	scoreboard objectives setdisplay sidebar.team.dark_blue fetchr.dark_blue_display
	scoreboard objectives setdisplay sidebar.team.dark_gray fetchr.dark_gray_display
	scoreboard objectives setdisplay sidebar.team.dark_red fetchr.dark_red_display
	scoreboard objectives setdisplay sidebar.team.gray fetchr.gray_display
	scoreboard objectives setdisplay sidebar.team.dark_green fetchr.green_display
	scoreboard objectives setdisplay sidebar.team.aqua fetchr.light_blue_display
	scoreboard objectives setdisplay sidebar.team.green fetchr.lime_display
	scoreboard objectives setdisplay sidebar.team.light_purple fetchr.magenta_display
	scoreboard objectives setdisplay sidebar.team.gold fetchr.orange_display
	scoreboard objectives setdisplay sidebar.team.dark_purple fetchr.purple_display
	scoreboard objectives setdisplay sidebar.team.red fetchr.red_display
	scoreboard objectives setdisplay sidebar.team.white fetchr.white_display
	scoreboard objectives setdisplay sidebar.team.yellow fetchr.yellow_display
#endregion

# Create overworld resourcepack check
	#NEUN_SCRIPT unless realms
	fill 0 0 0 2 3 2 minecraft:black_concrete outline
	gamerule spawnRadius 0
	#NEUN_SCRIPT end

# Add pregen bossbar
	bossbar add fetchr:start/pre_gen/progress { "translate": "fetchr.game.start.pre_gen_progress" }
	bossbar set fetchr:start/pre_gen/progress color red
	execute \
		unless score $game_state fetchr.state matches 2 \
		run bossbar set fetchr:start/pre_gen/progress visible false

# Set gamerules
	gamerule commandBlockOutput false
	gamerule doWeatherCycle false
	gamerule doInsomnia false
	gamerule doTraderSpawning false
	gamerule disableElytraMovementCheck true
	gamerule doPatrolSpawning false
	gamerule maxCommandChainLength 131072
	difficulty easy

# setup teams
	## add
		team add fetchr.light_blue
		team add fetchr.black
		team add fetchr.blue
		team add fetchr.cyan
		team add fetchr.dark_blue
		team add fetchr.dark_gray
		team add fetchr.green
		team add fetchr.purple
		team add fetchr.dark_red
		team add fetchr.orange
		team add fetchr.gray
		team add fetchr.lime
		team add fetchr.magenta
		team add fetchr.red
		team add fetchr.white
		team add fetchr.yellow

	## set colors
		team modify fetchr.light_blue color aqua
		team modify fetchr.black color black
		team modify fetchr.blue color blue
		team modify fetchr.cyan color dark_aqua
		team modify fetchr.dark_blue color dark_blue
		team modify fetchr.dark_gray color dark_gray
		team modify fetchr.green color dark_green
		team modify fetchr.purple color dark_purple
		team modify fetchr.dark_red color dark_red
		team modify fetchr.orange color gold
		team modify fetchr.gray color gray
		team modify fetchr.lime color green
		team modify fetchr.magenta color light_purple
		team modify fetchr.red color red
		team modify fetchr.white color white
		team modify fetchr.yellow color yellow

	## set completed backgrounds
		#NEUN_SCRIPT until 65
		#data modify storage fetchr:card completedBackgroundTemplates set value []
		#data modify storage fetchr:card completedBackgroundTemplates append value [\
			'"\\uf000"'\
		]
		#data modify storage fetchr:card completedBackgroundTemplates append value [\
			'"\\uf000"', '"\\uf001"'\
		]
		#data modify storage fetchr:card completedBackgroundTemplates append value [\
			'"\\uf000"', '"\\uf001"', '"\\uf002"'\
		]
		#data modify storage fetchr:card completedBackgroundTemplates append value [\
			'"\\uf000"', '"\\uf001"', '"\\uf003"', '"\\uf004"'\
		]
		#data modify storage fetchr:card completedBackgroundTemplates append value [\
			'"\\uf000"', '"\\uf001"', '"\\uf005"', '"\\uf006"', '"\\uf007"'\
		]
		#data modify storage fetchr:card completedBackgroundTemplates append value [\
			'"\\uf000"', '"\\uf001"', '"\\uf008"', '"\\uf002"', '"\\uf004"', '"\\uf009"'\
		]
		#data modify storage fetchr:card completedBackgroundTemplates append value [\
			'"\\uf000"', '"\\uf001"', '"\\uf00a"', '"\\uf00b"', '"\\uf00c"', '"\\uf00d"', '"\\uf00e"'\
		]
		#data modify storage fetchr:card completedBackgroundTemplates append value [\
			'"\\uf000"', '"\\uf001"', '"\\uf00f"', '"\\uf003"', '"\\uf010"', '"\\uf004"', '"\\uf011"', '"\\uf012"'\
		]
		#data modify storage fetchr:card completedBackgroundTemplates append value [\
			'"\\uf000"', '"\\uf001"', '"\\uf013"', '"\\uf014"', '"\\uf002"', '"\\uf015"',\
			'"\\uf016"', '"\\uf009"', '"\\uf017"'\
		]
		#data modify storage fetchr:card completedBackgroundTemplates append value [\
			'"\\uf000"', '"\\uf001"', '"\\uf018"', '"\\uf005"', '"\\uf019"', '"\\uf006"',\
			'"\\uf004"', '"\\uf007"', '"\\uf01a"', '"\\uf01b"'\
		]
		#data modify storage fetchr:card completedBackgroundTemplates append value [\
			'"\\uf000"', '"\\uf001"', '"\\uf01c"', '"\\uf01d"', '"\\uf01e"', '"\\uf01f"',\
			'"\\uf020"', '"\\uf021"', '"\\uf022"', '"\\uf023"', '"\\uf024"'\
		]
		#data modify storage fetchr:card completedBackgroundTemplates append value [\
			'"\\uf000"', '"\\uf001"', '"\\uf025"', '"\\uf008"', '"\\uf003"', '"\\uf002"',\
			'"\\uf026"', '"\\uf004"', '"\\uf027"', '"\\uf009"', '"\\uf012"', '"\\uf028"'\
		]
		#data modify storage fetchr:card completedBackgroundTemplates append value [\
			'"\\uf000"', '"\\uf001"', '"\\uf029"', '"\\uf02a"', '"\\uf02b"', '"\\uf02c"', '"\\uf02d"',\
			'"\\uf02e"', '"\\uf02f"', '"\\uf030"', '"\\uf031"', '"\\uf032"', '"\\uf033"'\
		]
		#data modify storage fetchr:card completedBackgroundTemplates append value [\
			'"\\uf000"', '"\\uf001"', '"\\uf034"', '"\\uf00a"', '"\\uf035"', '"\\uf00b"', '"\\uf036"',\
			'"\\uf00c"', '"\\uf004"', '"\\uf00d"', '"\\uf037"', '"\\uf00e"', '"\\uf038"', '"\\uf039"'\
		]
		#data modify storage fetchr:card completedBackgroundTemplates append value [\
			'"\\uf000"', '"\\uf001"', '"\\uf03a"', '"\\uf03b"', '"\\uf005"', '"\\uf03c"', '"\\uf002"', '"\\uf006"',\
			'"\\uf03d"', '"\\uf03e"', '"\\uf007"', '"\\uf009"', '"\\uf03f"', '"\\uf01b"', '"\\uf040"'\
		]
		#data modify storage fetchr:card completedBackgroundTemplates append value [\
			'"\\uf000"', '"\\uf001"', '"\\uf041"', '"\\uf00f"', '"\\uf042"', '"\\uf003"', '"\\uf043"', '"\\uf010"',\
			'"\\uf044"', '"\\uf004"', '"\\uf045"', '"\\uf011"', '"\\uf046"', '"\\uf012"', '"\\uf047"', '"\\uf048"'\
		]
		#NEUN_SCRIPT end
		#NEUN_SCRIPT until 65
		data modify storage fetchr:card completedBackgroundTemplates set value []
		data modify storage fetchr:card completedBackgroundTemplates append value [\
			"\uf000"\
		]
		data modify storage fetchr:card completedBackgroundTemplates append value [\
			"\uf000", "\uf001"\
		]
		data modify storage fetchr:card completedBackgroundTemplates append value [\
			"\uf000", "\uf001", "\uf002"\
		]
		data modify storage fetchr:card completedBackgroundTemplates append value [\
			"\uf000", "\uf001", "\uf003", "\uf004"\
		]
		data modify storage fetchr:card completedBackgroundTemplates append value [\
			"\uf000", "\uf001", "\uf005", "\uf006", "\uf007"\
		]
		data modify storage fetchr:card completedBackgroundTemplates append value [\
			"\uf000", "\uf001", "\uf008", "\uf002", "\uf004", "\uf009"\
		]
		data modify storage fetchr:card completedBackgroundTemplates append value [\
			"\uf000", "\uf001", "\uf00a", "\uf00b", "\uf00c", "\uf00d", "\uf00e"\
		]
		data modify storage fetchr:card completedBackgroundTemplates append value [\
			"\uf000", "\uf001", "\uf00f", "\uf003", "\uf010", "\uf004", "\uf011", "\uf012"\
		]
		data modify storage fetchr:card completedBackgroundTemplates append value [\
			"\uf000", "\uf001", "\uf013", "\uf014", "\uf002", "\uf015",\
			"\uf016", "\uf009", "\uf017"\
		]
		data modify storage fetchr:card completedBackgroundTemplates append value [\
			"\uf000", "\uf001", "\uf018", "\uf005", "\uf019", "\uf006",\
			"\uf004", "\uf007", "\uf01a", "\uf01b"\
		]
		data modify storage fetchr:card completedBackgroundTemplates append value [\
			"\uf000", "\uf001", "\uf01c", "\uf01d", "\uf01e", "\uf01f",\
			"\uf020", "\uf021", "\uf022", "\uf023", "\uf024"\
		]
		data modify storage fetchr:card completedBackgroundTemplates append value [\
			"\uf000", "\uf001", "\uf025", "\uf008", "\uf003", "\uf002",\
			"\uf026", "\uf004", "\uf027", "\uf009", "\uf012", "\uf028"\
		]
		data modify storage fetchr:card completedBackgroundTemplates append value [\
			"\uf000", "\uf001", "\uf029", "\uf02a", "\uf02b", "\uf02c", "\uf02d",\
			"\uf02e", "\uf02f", "\uf030", "\uf031", "\uf032", "\uf033"\
		]
		data modify storage fetchr:card completedBackgroundTemplates append value [\
			"\uf000", "\uf001", "\uf034", "\uf00a", "\uf035", "\uf00b", "\uf036",\
			"\uf00c", "\uf004", "\uf00d", "\uf037", "\uf00e", "\uf038", "\uf039"\
		]
		data modify storage fetchr:card completedBackgroundTemplates append value [\
			"\uf000", "\uf001", "\uf03a", "\uf03b", "\uf005", "\uf03c", "\uf002", "\uf006",\
			"\uf03d", "\uf03e", "\uf007", "\uf009", "\uf03f", "\uf01b", "\uf040"\
		]
		data modify storage fetchr:card completedBackgroundTemplates append value [\
			"\uf000", "\uf001", "\uf041", "\uf00f", "\uf042", "\uf003", "\uf043", "\uf010",\
			"\uf044", "\uf004", "\uf045", "\uf011", "\uf046", "\uf012", "\uf047", "\uf048"\
		]
		#NEUN_SCRIPT end
#region run registries
	data remove storage fetchr:registries categories
	data remove storage fetchr:registries items
	data remove storage fetchr:registries structures
	data remove storage fetchr:registries hud_components
	data remove storage fetchr:registries preferences
	function #fetchr:fill_registries

	#TODO probably should make a new tag for sanity checking and post-processing
	# here which is called after fill_registries and post_generation.
	#
	# This way we make sure, post_generation only sees valid entries.
	# This would mean moving some logic around for vanilla stuff.
	#
	# The result should be that all registry's entries are in a state they would be
	# after the init function has run through completely, apart from fields that
	# depend on other registries (e.g. the category's items or total_item_weight
	# fields would not be included.)

	#>
	# Function tag for doing actions after the item registration, but before the
	# items are duplicated into the categories array.
	#
	# You may use this function tag for modifing existing items from the default
	# Fetchr item pool or from other extension packs.
	#
	# @api
	#declare tag/function fetchr:post_registration
	function #fetchr:post_registration
#endregion
#region initialize items
	#>
	# @within function fetchr:init/**
	#declare storage tmp.fetchr:init

	execute \
		if score $lobby_generated fetchr.state matches 1 \
		run schedule function fetchr:init/items/exec 1t
#endregion
#region initialize hud components
	#>
	# @within
	# 	function fetchr:init/init
	# 	function fetchr:init/initialize_hud_components/*
	#declare storage tmp.fetchr:init/hud
	data modify storage fetchr:custom_hud components set value []

	data modify storage tmp.fetchr:init/hud columns set value [[], []]
	data modify storage tmp.fetchr:init/hud whereSpace set value []
	data modify storage tmp.fetchr:init/hud unpreferred set value []
	data modify storage tmp.fetchr:init/hud dontAdd set value []
	function fetchr:init/initialize_hud_components/add_defaults
	data modify storage tmp.fetchr:init/hud whereSpace append from storage tmp.fetchr:init/hud unpreferred[]

	data modify storage fetchr:custom_hud components set value []
	data modify storage fetchr:custom_hud components append from storage tmp.fetchr:init/hud columns[0][]
	data modify storage fetchr:custom_hud components append from storage tmp.fetchr:init/hud columns[1][]
	data modify storage fetchr:custom_hud components append from storage tmp.fetchr:init/hud whereSpace[]
	data modify storage fetchr:custom_hud components append from storage tmp.fetchr:init/hud dontAdd[]

	data modify storage fetchr:custom_hud default set value []
	data modify storage fetchr:custom_hud default append from storage tmp.fetchr:init/hud columns[0][0]
	data modify storage fetchr:custom_hud default append from storage tmp.fetchr:init/hud columns[0][1]
	data modify storage fetchr:custom_hud default append from storage tmp.fetchr:init/hud columns[0][2]
	data modify storage fetchr:custom_hud default append from storage tmp.fetchr:init/hud columns[0][3]
	data modify storage fetchr:custom_hud default append from storage tmp.fetchr:init/hud columns[0][4]
	execute \
		unless data storage fetchr:custom_hud default[4] \
		run function fetchr:init/initialize_hud_components/fill_default_col0
	
	#NEUN_SCRIPT until 65
	#execute \
		unless data storage tmp.fetchr:init/hud columns[1][5] \
		run data \
			modify storage fetchr:custom_hud default append value {\
			id: "fetchr:spacer",\
			name: '{ "translate": "fetchr.custom_hud.components.spacer" }',\
			slot_id: 5b\
		}
	#NEUN_SCRIPT end
	#NEUN_SCRIPT since 65
	execute \
		unless data storage tmp.fetchr:init/hud columns[1][5] \
		run data \
			modify storage fetchr:custom_hud default append value {\
			id: "fetchr:spacer",\
			name: { translate: "fetchr.custom_hud.components.spacer" },\
			slot_id: 5b\
		}
	#NEUN_SCRIPT end
	data modify storage fetchr:custom_hud default append from storage tmp.fetchr:init/hud columns[1][0]
	data modify storage fetchr:custom_hud default append from storage tmp.fetchr:init/hud columns[1][1]
	data modify storage fetchr:custom_hud default append from storage tmp.fetchr:init/hud columns[1][2]
	data modify storage fetchr:custom_hud default append from storage tmp.fetchr:init/hud columns[1][3]
	data modify storage fetchr:custom_hud default append from storage tmp.fetchr:init/hud columns[1][4]
	data modify storage fetchr:custom_hud default append from storage tmp.fetchr:init/hud columns[1][5]
	execute \
		unless data storage fetchr:custom_hud default[10] \
		run function fetchr:init/initialize_hud_components/fill_default_col1
	
	data remove storage fetchr:custom_hud default[].addByDefault
	data remove storage fetchr:custom_hud default[].preferredColumn
#endregion

# spawn strcutures
	
	#Temporary forceload to make sure all needed chunks are actually loaded.
	#This forceload is undone at the end of the function fetchr:init/setup_lobby
	execute \
		if score $lobby_generated fetchr.state matches 0 \
		run schedule function fetchr:init/setup_lobby/root 1t
	scoreboard players set $lobby_generated fetchr.state 1

# summon multi noise pos marker
	execute \
		in fetchr:default \
		run forceload add 0 0
