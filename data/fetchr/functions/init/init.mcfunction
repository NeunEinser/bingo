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
	# Items have the following NBT structure:
	# id: (String) custom namespaced id to uniquely identify the item within Fetchr
	# item: (Compound) Minecraft item data. Should be set in such a way, that an
	# 	item of this type looks exactly the same as the item you require.
	# textComponent: (String) The text component that is used for displaying the
	# 	item name.
	# icon: (String) Parsable text component that holds a character which is re-
	# 	textured to look like the item you require
	# detectCommand: (String) Command for detecting if the player has this item.
	# 	Has to set the player's fetchr.has_item score. The command that is used in
	# 	default Fetchr follows the scheme
	# 	execute as @a store success score @s fetchr.has_item run clear @s <item> 0,
	# 	though, a different command that sets the score would be acceptable, too
	# clearCommand: (String) Command for clearing the item from the player's
	# 	inventory. Should look like this: "clear @a[tag=fetchr.clear] <item> 1
	# categories: (String List) List of category names. All categories referenced
	# 	here should be registered separately.
	# weight: (Integer) Weight of this item for the RNG.
	#
	# Categories have the following structure:
	# name: (String) Namespaced id to uniquely identify the category within Fetchr
	# translatableName: (String) Text component used for displaying the category's
	# 	name
	# items: (Compound List) (readonly) List of all items this category has. Entries
	# 	have the same structure as in the items array. Will be created
	# 	automatically, after #fetchr:post_register_items ran.
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
	# All registries are an array of the type of thing you want to register.
	#
	# Available registries:
	# categories: categories of Fetchr. NBT-Structure see storage definition of
	# 	fetchr:items
	# items: All items that are available. NBT-Structure see storage definition of
	# 	fetchr:items
	# structures: Each entry holds a string representing a namespaced id of a
	# 	structure file to be added to the lobby. The center must be the corridor.
	# 	Add emptiness in case of unsymetric sizes.
	#
	# In order to modify existing items, either added by the default Fetchr datapack,
	# or added by another extension pack, please use a function registered to the
	# function tag #fetchr:post_register_items
	#
	# The items array should be considered read-only from other places.
	#
	# @api
	#declare storage fetchr:registries

	#>
	# This storage is used to store player configurations.
	#
	# Player configurations store the desired initial inventory and potion effects.
	#
	# This is public, to allow for other datapacks that are added ontop of the
	# vanilla Fetchr game to add more default configurations.
	#
	# @public
	#declare storage fetchr:player

	#>
	# This storage holds the current bingo card. It contains information about the
	# currently generated card and about all playing teams' progress.
	#
	# @internal
	#declare storage fetchr:card
#endregion

#region tag declarations
	#>
	# This tag marks a player who is at a location eligible for emerald generation.
	#
	# @internal
	#declare tag fetchr.emerald
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
	# This tag is given to players whose inventory should be checked for item gets
	#
	# This is part of an optimization since checking inventory is unoptimized by Mojang
	#
	# @internal
	#declare tag fetchr.check_inventory
	#>
	# This tag is used during item removal after successfully obtaining an item from
	# the card.
	#
	# @internal
	#declare tag fetchr.clear
	#>
	# This tag is given to players whose inventory should only be checked once, not
	# waiting for a movement action
	#
	# @within
	# 	function fetchr:game/on_inventory_changed
	# 	function fetchr:game/player_tick
	#declare tag fetchr.only_check_inventory_once
	#>
	# This tag is given to players whose position changed compared to last tick
	# @internal
	#declare tag fetchr.position_changed
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
	# Tag for entities that where already persistent.
	#
	# @within
	# 	function fetchr:game/start/pre_gen/handle_entities
	# 	function fetchr:game/start/unfreeze_entities
	#declare tag fetchr.persistance_required
	#>
	# This tag is given to players who are currently verifying their resource pack
	#
	# @internal
	#declare tag fetchr.resourcepack_check
	#region slots
		#>
		# This tag marks a player who is in a team that obtained the item in slot 0.
		#
		# @within
		# 	function fetchr:game/start/create_skybox/spawn_player
		# 	structure fetchr:machinery
		#declare tag fetchr.has_slot0
		#>
		# This tag marks a player who is in a team that obtained the item in slot 1.
		#
		# @within
		# 	function fetchr:game/start/create_skybox/spawn_player
		# 	structure fetchr:machinery
		#declare tag fetchr.has_slot1
		#>
		# This tag marks a player who is in a team that obtained the item in slot 2.
		#
		# @within
		# 	function fetchr:game/start/create_skybox/spawn_player
		# 	structure fetchr:machinery
		#declare tag fetchr.has_slot2
		#>
		# This tag marks a player who is in a team that obtained the item in slot 3.
		#
		# @within
		# 	function fetchr:game/start/create_skybox/spawn_player
		# 	structure fetchr:machinery
		#declare tag fetchr.has_slot3
		#>
		# This tag marks a player who is in a team that obtained the item in slot 4.
		#
		# @within
		# 	function fetchr:game/start/create_skybox/spawn_player
		# 	structure fetchr:machinery
		#declare tag fetchr.has_slot4
		#>
		# This tag marks a player who is in a team that obtained the item in slot 5.
		#
		# @within
		# 	function fetchr:game/start/create_skybox/spawn_player
		# 	structure fetchr:machinery
		#declare tag fetchr.has_slot5
		#>
		# This tag marks a player who is in a team that obtained the item in slot 6.
		#
		# @within
		# 	function fetchr:game/start/create_skybox/spawn_player
		# 	structure fetchr:machinery
		#declare tag fetchr.has_slot6
		#>
		# This tag marks a player who is in a team that obtained the item in slot 7.
		#
		# @within
		# 	function fetchr:game/start/create_skybox/spawn_player
		# 	structure fetchr:machinery
		#declare tag fetchr.has_slot7
		#>
		# This tag marks a player who is in a team that obtained the item in slot 8.
		#
		# @within
		# 	function fetchr:game/start/create_skybox/spawn_player
		# 	structure fetchr:machinery
		#declare tag fetchr.has_slot8
		#>
		# This tag marks a player who is in a team that obtained the item in slot 9.
		#
		# @within
		# 	function fetchr:game/start/create_skybox/spawn_player
		# 	structure fetchr:machinery
		#declare tag fetchr.has_slot9
		#>
		# This tag marks a player who is in a team that obtained the item in slot 10.
		#
		# @within
		# 	function fetchr:game/start/create_skybox/spawn_player
		# 	structure fetchr:machinery
		#declare tag fetchr.has_slot10
		#>
		# This tag marks a player who is in a team that obtained the item in slot 11.
		#
		# @within
		# 	function fetchr:game/start/create_skybox/spawn_player
		# 	structure fetchr:machinery
		#declare tag fetchr.has_slot11
		#>
		# This tag marks a player who is in a team that obtained the item in slot 12.
		#
		# @within
		# 	function fetchr:game/start/create_skybox/spawn_player
		# 	structure fetchr:machinery
		#declare tag fetchr.has_slot12
		#>
		# This tag marks a player who is in a team that obtained the item in slot 13.
		#
		# @within
		# 	function fetchr:game/start/create_skybox/spawn_player
		# 	structure fetchr:machinery
		#declare tag fetchr.has_slot13
		#>
		# This tag marks a player who is in a team that obtained the item in slot 14.
		#
		# @within
		# 	function fetchr:game/start/create_skybox/spawn_player
		# 	structure fetchr:machinery
		#declare tag fetchr.has_slot14
		#>
		# This tag marks a player who is in a team that obtained the item in slot 15.
		#
		# @within
		# 	function fetchr:game/start/create_skybox/spawn_player
		# 	structure fetchr:machinery
		#declare tag fetchr.has_slot15
		#>
		# This tag marks a player who is in a team that obtained the item in slot 16.
		#
		# @within
		# 	function fetchr:game/start/create_skybox/spawn_player
		# 	structure fetchr:machinery
		#declare tag fetchr.has_slot16
		#>
		# This tag marks a player who is in a team that obtained the item in slot 17.
		#
		# @within
		# 	function fetchr:game/start/create_skybox/spawn_player
		# 	structure fetchr:machinery
		#declare tag fetchr.has_slot17
		#>
		# This tag marks a player who is in a team that obtained the item in slot 18.
		#
		# @within
		# 	function fetchr:game/start/create_skybox/spawn_player
		# 	structure fetchr:machinery
		#declare tag fetchr.has_slot18
		#>
		# This tag marks a player who is in a team that obtained the item in slot 19.
		#
		# @within
		# 	function fetchr:game/start/create_skybox/spawn_player
		# 	structure fetchr:machinery
		#declare tag fetchr.has_slot19
		#>
		# This tag marks a player who is in a team that obtained the item in slot 20.
		#
		# @within
		# 	function fetchr:game/start/create_skybox/spawn_player
		# 	structure fetchr:machinery
		#declare tag fetchr.has_slot20
		#>
		# This tag marks a player who is in a team that obtained the item in slot 21.
		#
		# @within
		# 	function fetchr:game/start/create_skybox/spawn_player
		# 	structure fetchr:machinery
		#declare tag fetchr.has_slot21
		#>
		# This tag marks a player who is in a team that obtained the item in slot 22.
		#
		# @within
		# 	function fetchr:game/start/create_skybox/spawn_player
		# 	structure fetchr:machinery
		#declare tag fetchr.has_slot22
		#>
		# This tag marks a player who is in a team that obtained the item in slot 23.
		#
		# @within
		# 	function fetchr:game/start/create_skybox/spawn_player
		# 	structure fetchr:machinery
		#declare tag fetchr.has_slot23
		#>
		# This tag marks a player who is in a team that obtained the item in slot 24.
		#
		# @within
		# 	function fetchr:game/start/create_skybox/spawn_player
		# 	structure fetchr:machinery
		#declare tag fetchr.has_slot24
	#endregion

	#region lobby signs
		#>
		# @within
		# 	function fetchr:init/setup_lobby/start
		# 	function fetchr:init/setup_lobby/end
		# 	function fetchr:lobby/place_indestructible_blocks
		# 	structure fetchr:*
		#declare tag fetchr.lobby_sign
		#>
		# @within
		# 	function fetchr:lobby/place_sign
		# 	structure fetchr:*
		#declare tag fetchr.sign_north
		#>
		# @within
		# 	function fetchr:lobby/place_sign
		# 	structure fetchr:*
		#declare tag fetchr.sign_east
		#>
		# @within
		# 	function fetchr:lobby/place_sign
		# 	structure fetchr:*
		#declare tag fetchr.sign_south
		#>
		# @within
		# 	function fetchr:lobby/place_sign
		# 	function fetchr:init/setup_lobby/end
		# 	structure fetchr:*
		#declare tag fetchr.sign_west
		#>
		# @within
		# 	function fetchr:lobby/player_tick
		# 	structure fetchr:tutorial
		#declare tag fetchr.sign_automatically_pregen
		#>
		# @within
		# 	function fetchr:lobby/place_sign
		# 	structure fetchr:tutorial
		#declare tag fetchr.sign_strict_mode
	#endregion

	#region lobby buttons
		#>
		# @within
		# 	function fetchr:lobby/place_indestructible_blocks
		# 	structure fetchr:card_generation
		#declare tag fetchr.lobby_button
		#>
		# @within
		# 	function fetchr:lobby/place_indestructible_blocks
		# 	structure fetchr:card_generation
		#declare tag fetchr.button_red
		#>
		# @within
		# 	function fetchr:lobby/place_indestructible_blocks
		# 	structure fetchr:card_generation
		#declare tag fetchr.button_orange
		#>
		# @within
		# 	function fetchr:lobby/place_indestructible_blocks
		# 	structure fetchr:card_generation
		#declare tag fetchr.button_yellow
		#>
		# @within
		# 	function fetchr:lobby/place_indestructible_blocks
		# 	structure fetchr:card_generation
		#declare tag fetchr.button_lime
		#>
		# @within
		# 	function fetchr:lobby/place_indestructible_blocks
		# 	structure fetchr:card_generation
		#declare tag fetchr.button_green
		#>
		# @within
		# 	function fetchr:lobby/place_indestructible_blocks
		# 	structure fetchr:card_generation
		#declare tag fetchr.button_cyan
		#>
		# @within
		# 	function fetchr:lobby/place_indestructible_blocks
		# 	structure fetchr:card_generation
		#declare tag fetchr.button_light_blue
		#>
		# @within
		# 	function fetchr:lobby/place_indestructible_blocks
		# 	structure fetchr:card_generation
		#declare tag fetchr.button_blue
		#>
		# @within
		# 	function fetchr:lobby/place_indestructible_blocks
		# 	structure fetchr:card_generation
		#declare tag fetchr.button_purple
		#>
		# @within
		# 	function fetchr:lobby/place_indestructible_blocks
		# 	structure fetchr:card_generation
		#declare tag fetchr.button_magenta
	#endregion
#endregion

#region setup objectives
	scoreboard objectives remove fetchr.barrel
	scoreboard objectives remove fetchr.brewing
	scoreboard objectives remove fetchr.b_furnace
	scoreboard objectives remove fetchr.chest
	scoreboard objectives remove fetchr.chicken_timer_cache
	scoreboard objectives remove fetchr.const
	scoreboard objectives remove fetchr.completed_goal_effect_state
	scoreboard objectives remove fetchr.crafting
	scoreboard objectives remove fetchr.enderchest
	scoreboard objectives remove fetchr.furnace
	scoreboard objectives remove fetchr.grindstone
	scoreboard objectives remove fetchr.has_item
	scoreboard objectives remove fetchr.hud_update
	scoreboard objectives remove fetchr.io
	scoreboard objectives remove fetchr.lobby
	scoreboard objectives remove fetchr.menu
	scoreboard objectives remove fetchr.menu_page
	scoreboard objectives remove fetchr.pref
	scoreboard objectives remove fetchr.prev_rot
	scoreboard objectives remove fetchr.prev_x_pos
	scoreboard objectives remove fetchr.prev_y_pos
	scoreboard objectives remove fetchr.prev_z_pos
	scoreboard objectives remove fetchr.seed
	scoreboard objectives remove fetchr.spectator
	scoreboard objectives remove fetchr.resource_pack_check
	scoreboard objectives remove fetchr.shulkerbox
	scoreboard objectives remove fetchr.stonecut
	scoreboard objectives remove fetchr.smoker
	scoreboard objectives remove fetchr.tmp

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

		#>
		# This objective is set to 1 for players who confirmed their operator status in
		# strict mode.
		#
		# This uses an objective rather than a tag so that it is possible to remove
		# operators even when they are offline.
		#
		# @public
		scoreboard objectives add fetchr.operator dummy

		#>
		# Whether this player's hud needs to be forcefully updated entirely
		# This is for example set when the player changes hud preferences. 
		#
		# @api
		scoreboard objectives add fetchr.update_hud dummy
		scoreboard players set @a fetchr.update_hud 1
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

		#>
		# Trigger objective used to handle changes / clicks in the preferences menu.
		#
		# @internal
		scoreboard objectives add fetchr.pref trigger

		#>
		# Trigger objective used to switch to spectator mode while in game.
		#
		# @internal
		scoreboard objectives add fetchr.spectator trigger

		#>
		# Trigger objective used in the player configuration dialogs.
		#
		# @internal
		#scoreboard objectives add fetchr.player_config trigger

		#>
		# This trigger is used for confirming that the resource pack is active
		#
		# @internal
		scoreboard objectives add fetchr.resource_pack_check trigger

		#>
		# Trigger objective used to generate a bingo card with a set seed.
		#
		# @internal
		# @user
		scoreboard objectives add fetchr.seed trigger

		#>
		# Trigger objective used to load certain setting pages.
		#
		# @internal
		# @user
		scoreboard objectives add fetchr.settings trigger
	#endregion

	#region other internal objectives
		#>
		# Used to store chicken egg timers during pre-gen
		#
		# @internal
		scoreboard objectives add fetchr.chicken_timer_cache dummy
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
		# The last time the hud was refreshed for each player
		# #TODO rename to something like "last_hud_update" in 1.18 when the stupid
		# # length limit is gone.
		#
		# @within
		#		function fetchr:init/init
		#		function fetchr:custom_hud/*
		scoreboard objectives add fetchr.hud_update dummy

		#>
		# This objective is used to detect a player reconnecting
		#
		# @within
		#		function fetchr:init/init
		#		function fetchr:tick/player_tick
		#		function fetchr:tick/handle_player_join
		scoreboard objectives add fetchr.reconnect minecraft.custom:minecraft.leave_game

		#region interaction
			#>
			# This objective is used to detect a player reconnecting
			#
			# @within
			#		function fetchr:init/init
			#		function fetchr:game/player_tick
			#		function fetchr:game/on_inventory_changed
			scoreboard objectives add fetchr.inv_change dummy

			#>
			# This objective is used to detect a player reconnecting
			#
			# @within
			#		function fetchr:init/init
			#		function fetchr:game/player_tick
			scoreboard objectives add fetchr.chest minecraft.custom:minecraft.open_chest
			#>
			# This objective is used to detect a player reconnecting
			#
			# @within
			#		function fetchr:init/init
			#		function fetchr:game/player_tick
			scoreboard objectives add fetchr.barrel minecraft.custom:minecraft.open_barrel
			#>
			# This objective is used to detect player sleeping for night skipping
			#
			# @within
			#		function fetchr:init/init
			#		function fetchr:game/tick
			#		function fetchr:game/player_tick
			scoreboard objectives add fetchr.bed minecraft.custom:minecraft.sleep_in_bed
			#>
			# This objective is used to detect a player reconnecting
			#
			# @within
			#		function fetchr:init/init
			#		function fetchr:game/player_tick
			scoreboard objectives add fetchr.enderchest minecraft.custom:minecraft.open_enderchest
			#>
			# This objective is used to detect a player reconnecting
			#
			# @within
			#		function fetchr:init/init
			#		function fetchr:game/player_tick
			scoreboard objectives add fetchr.shulkerbox minecraft.custom:minecraft.open_shulker_box

			#>
			# This objective is used to detect a player reconnecting
			#
			# @within
			#		function fetchr:init/init
			#		function fetchr:game/player_tick
			scoreboard objectives add fetchr.crafting minecraft.custom:minecraft.interact_with_crafting_table
			#>
			# This objective is used to detect a player reconnecting
			#
			# @within
			#		function fetchr:init/init
			#		function fetchr:game/player_tick
			scoreboard objectives add fetchr.furnace minecraft.custom:minecraft.interact_with_furnace
			#>
			# This objective is used to detect a player reconnecting
			#
			# @within
			#		function fetchr:init/init
			#		function fetchr:game/player_tick
			scoreboard objectives add fetchr.b_furnace minecraft.custom:minecraft.interact_with_blast_furnace
			#>
			# This objective is used to detect a player reconnecting
			#
			# @within
			#		function fetchr:init/init
			#		function fetchr:game/player_tick
			scoreboard objectives add fetchr.smoker minecraft.custom:minecraft.interact_with_smoker
			#>
			# This objective is used to detect a player reconnecting
			#
			# @within
			#		function fetchr:init/init
			#		function fetchr:game/player_tick
			scoreboard objectives add fetchr.grindstone minecraft.custom:minecraft.interact_with_grindstone
			#>
			# This objective is used to detect a player reconnecting
			#
			# @within
			#		function fetchr:init/init
			#		function fetchr:game/player_tick
			scoreboard objectives add fetchr.stonecut minecraft.custom:minecraft.interact_with_stonecutter
			#>
			# This objective is used to detect a player reconnecting
			#
			# @within
			#		function fetchr:init/init
			#		function fetchr:game/player_tick
			scoreboard objectives add fetchr.brewing minecraft.custom:minecraft.interact_with_brewingstand
		#endregion
	#endregion

	#region score holders
		#>
		# Whether command blocks are enabled
		#
		# @internal
		#declare score_holder $commandblocks_enabled
		scoreboard players set $commandblocks_enabled fetchr.state -1
		setblock 0 4 0 minecraft:air
		setblock 0 4 0 minecraft:command_block{auto: true, Command: "scoreboard players set $commandblocks_enabled fetchr.state 1"}

		#>
		# The current game state
		# 0 = Lobby / Not in game
		# 1 = Starting / chunk pre-gen
		# 2 = Skybox phase
		# 3 = Game started
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
		scoreboard players add $is_multiplayer fetchr.state 0
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
		# Whether pregen should automatically start after generating a new card.
		#
		# @internal
		#declare score_holder $automatically_pregen
		scoreboard players add $automatically_pregen fetchr.settings 0
		#>
		# Whether strict mode is turned on
		#
		# @internal
		#declare score_holder $strict_mode
		execute unless score $strict_mode fetchr.settings matches 0..2 run scoreboard players set $strict_mode fetchr.settings 2

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
		#declare score_holder 1000
		scoreboard players set 1000 fetchr.const 1000
		#>
		# @public
		#declare score_holder 65536
		scoreboard players set 65536 fetchr.const 65536
	#endregion
#endregion

# Create overworld resourcepack check
	fill 0 0 0 2 3 2 minecraft:black_concrete outline
	gamerule spawnRadius 0

# Add pregen bossbar
	bossbar add fetchr:start/pre_gen/progress {"translate": "fetchr.game.start.pre_gen_progress"}
	bossbar set fetchr:start/pre_gen/progress color red
	execute unless score $game_state fetchr.state matches 1 run bossbar set fetchr:start/pre_gen/progress visible false

# Set gamerules
	gamerule commandBlockOutput false
	gamerule doWeatherCycle false
	gamerule doInsomnia false
	gamerule doTraderSpawning false
	gamerule disableElytraMovementCheck true
	gamerule doPatrolSpawning false
	difficulty easy

# setup default player configurations
	#data remove storage fetchr:player configurations
	#data modify storage fetchr:player configurations append value {name: '{"translate": "fetchr.lobby.settings.player.configuration.empty"}', inventory: [], effects: [], fixed: true}
	#data modify storage fetchr:player configurations append value {name: '{"translate": "fetchr.lobby.settings.player.configuration.night_vision"}', inventory: [], effects: [{Id:16b, Amplifier: 0b, Duration: 2147483647, Ambient: 0b, ShowParticles: 0b, ShowIcon:0b}], selected: true}
	#data modify storage fetchr:player configurations append value {name: '{"translate": "fetchr.lobby.settings.player.configuration.boats"}', inventory: [{Slot: 8b, id: "minecraft:oak_boat", Count: 1b}, {Slot: 17b, id: "minecraft:oak_boat", Count: 1b}, {Slot: 26b, id: "minecraft:oak_boat", Count: 1b}, {Slot: 35b, id: "minecraft:oak_boat", Count: 1b}], effects: [{Id:16b, Amplifier: 0b, Duration: 2147483647, Ambient: 0b, ShowParticles: 0b, ShowIcon:0b}]}
	#data modify storage fetchr:player configurations append value {name: '{"translate": "fetchr.lobby.settings.player.configuration.elytra"}', inventory: [{Slot: 8b, id: "minecraft:firework_rocket", Count: 64b}, {Slot: 102b, id: "minecraft:elytra", Count: 1b, tag: {Unbreakable: true}}], effects: [{Id:16b, Amplifier: 0b, Duration: 2147483647, Ambient: 0b, ShowParticles: 0b, ShowIcon:0b}]}
	#data modify storage fetchr:player configurations append value {name: '{"translate": "fetchr.lobby.settings.player.configuration.frostwalker"}', inventory: [{Slot: 100b, id: "minecraft:leather_boots", Count: 1b, tag: {Unbreakable: true, Enchantments:[{lvl: 2s, id: "minecraft:frost_walker"}]}}], effects: [{Id:16b, Amplifier: 0b, Duration: 2147483647, Ambient: 0b, ShowParticles: 0b, ShowIcon:0b}]}
	#data modify storage fetchr:player configurations append value {name: '{"translate": "fetchr.lobby.settings.player.configuration.underwater"}', inventory: [{Slot: 100b, id: "minecraft:leather_boots", Count: 1b, tag: {Unbreakable: true, Enchantments:[{lvl: 3s, id: "minecraft:depth_strider"}]}}], effects: [{Id:13b, Amplifier: 0b, Duration: 2147483647, Ambient: 0b, ShowParticles: 0b, ShowIcon:0b}, {Id:16b, Amplifier: 0b, Duration: 2147483647, Ambient: 0b, ShowParticles: 0b, ShowIcon:0b}]}

# setup teams
	## add
		team add fetchr.aqua
		team add fetchr.black
		team add fetchr.blue
		team add fetchr.dark_aqua
		team add fetchr.dark_blue
		team add fetchr.dark_gray
		team add fetchr.dark_green
		team add fetchr.dark_purple
		team add fetchr.dark_red
		team add fetchr.gold
		team add fetchr.gray
		team add fetchr.green
		team add fetchr.light_purple
		team add fetchr.red
		team add fetchr.white
		team add fetchr.yellow

	## set colors
		team modify fetchr.aqua color aqua
		team modify fetchr.black color black
		team modify fetchr.blue color blue
		team modify fetchr.dark_aqua color dark_aqua
		team modify fetchr.dark_blue color dark_blue
		team modify fetchr.dark_gray color dark_gray
		team modify fetchr.dark_green color dark_green
		team modify fetchr.dark_purple color dark_purple
		team modify fetchr.dark_red color dark_red
		team modify fetchr.gold color gold
		team modify fetchr.gray color gray
		team modify fetchr.green color green
		team modify fetchr.light_purple color light_purple
		team modify fetchr.red color red
		team modify fetchr.white color white
		team modify fetchr.yellow color yellow

	## set completed backgrounds
		data modify storage fetchr:card completedBackgroundTemplates set value []
		data modify storage fetchr:card completedBackgroundTemplates append value ['"\\uf000"']
		data modify storage fetchr:card completedBackgroundTemplates append value ['"\\uf000"','"\\uf001"']
		data modify storage fetchr:card completedBackgroundTemplates append value ['"\\uf000"','"\\uf001"','"\\uf002"']
		data modify storage fetchr:card completedBackgroundTemplates append value ['"\\uf000"','"\\uf001"','"\\uf003"','"\\uf004"']
		data modify storage fetchr:card completedBackgroundTemplates append value ['"\\uf000"','"\\uf001"','"\\uf005"','"\\uf006"','"\\uf007"']
		data modify storage fetchr:card completedBackgroundTemplates append value ['"\\uf000"','"\\uf001"','"\\uf008"','"\\uf002"','"\\uf004"','"\\uf009"']
		data modify storage fetchr:card completedBackgroundTemplates append value ['"\\uf000"','"\\uf001"','"\\uf00a"','"\\uf00b"','"\\uf00c"','"\\uf00d"','"\\uf00e"']
		data modify storage fetchr:card completedBackgroundTemplates append value ['"\\uf000"','"\\uf001"','"\\uf00f"','"\\uf003"','"\\uf010"','"\\uf004"','"\\uf011"','"\\uf012"']
		data modify storage fetchr:card completedBackgroundTemplates append value ['"\\uf000"','"\\uf001"','"\\uf013"','"\\uf014"','"\\uf002"','"\\uf015"','"\\uf016"','"\\uf009"','"\\uf017"']
		data modify storage fetchr:card completedBackgroundTemplates append value ['"\\uf000"','"\\uf001"','"\\uf018"','"\\uf005"','"\\uf019"','"\\uf006"','"\\uf004"','"\\uf007"','"\\uf01a"','"\\uf01b"']
		data modify storage fetchr:card completedBackgroundTemplates append value ['"\\uf000"','"\\uf001"','"\\uf01c"','"\\uf01d"','"\\uf01e"','"\\uf01f"','"\\uf020"','"\\uf021"','"\\uf022"','"\\uf023"','"\\uf024"']
		data modify storage fetchr:card completedBackgroundTemplates append value ['"\\uf000"','"\\uf001"','"\\uf025"','"\\uf008"','"\\uf003"','"\\uf002"','"\\uf026"','"\\uf004"','"\\uf027"','"\\uf009"','"\\uf012"','"\\uf028"']
		data modify storage fetchr:card completedBackgroundTemplates append value ['"\\uf000"','"\\uf001"','"\\uf029"','"\\uf02a"','"\\uf02b"','"\\uf02c"','"\\uf02d"','"\\uf02e"','"\\uf02f"','"\\uf030"','"\\uf031"','"\\uf032"','"\\uf033"']
		data modify storage fetchr:card completedBackgroundTemplates append value ['"\\uf000"','"\\uf001"','"\\uf034"','"\\uf00a"','"\\uf035"','"\\uf00b"','"\\uf036"','"\\uf00c"','"\\uf004"','"\\uf00d"','"\\uf037"','"\\uf00e"','"\\uf038"','"\\uf039"']
		data modify storage fetchr:card completedBackgroundTemplates append value ['"\\uf000"','"\\uf001"','"\\uf03a"','"\\uf03b"','"\\uf005"','"\\uf03c"','"\\uf002"','"\\uf006"','"\\uf03d"','"\\uf03e"','"\\uf007"','"\\uf009"','"\\uf03f"','"\\uf01b"','"\\uf040"']
		data modify storage fetchr:card completedBackgroundTemplates append value ['"\\uf000"','"\\uf001"','"\\uf041"','"\\uf00f"','"\\uf042"','"\\uf003"','"\\uf043"','"\\uf010"','"\\uf044"','"\\uf004"','"\\uf045"','"\\uf011"','"\\uf046"','"\\uf012"','"\\uf047"','"\\uf048"']
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
	# depend on other registries (e.g. the category's items or totalItemWeight
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

	schedule function fetchr:init/items/exec 1t
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
	execute unless data storage fetchr:custom_hud default[4] run function fetchr:init/initialize_hud_components/fill_default_col0
	
	execute unless data storage tmp.fetchr:init/hud columns[1][5] run data modify storage fetchr:custom_hud default append value {id: "fetchr:spacer", name: '{"translate": "fetchr.custom_hud.components.spacer"}', slot_id: 5b}
	data modify storage fetchr:custom_hud default append from storage tmp.fetchr:init/hud columns[1][0]
	data modify storage fetchr:custom_hud default append from storage tmp.fetchr:init/hud columns[1][1]
	data modify storage fetchr:custom_hud default append from storage tmp.fetchr:init/hud columns[1][2]
	data modify storage fetchr:custom_hud default append from storage tmp.fetchr:init/hud columns[1][3]
	data modify storage fetchr:custom_hud default append from storage tmp.fetchr:init/hud columns[1][4]
	data modify storage fetchr:custom_hud default append from storage tmp.fetchr:init/hud columns[1][5]
	execute unless data storage fetchr:custom_hud default[10] run function fetchr:init/initialize_hud_components/fill_default_col1
	
	data remove storage fetchr:custom_hud default[].addByDefault
	data remove storage fetchr:custom_hud default[].preferredColumn
#endregion

# spawn strcutures
	
	#Temporary forceload to make sure all needed chunks are actually loaded.
	#This forceload is undone at the end of the function fetchr:init/setup_lobby
	execute if score $lobby_generated fetchr.state matches 0 in fetchr:lobby run forceload add -16 -17 47 31
	execute if score $lobby_generated fetchr.state matches 0 run schedule function fetchr:init/setup_lobby/root 1t
	scoreboard players set $lobby_generated fetchr.state 1

# summon multi noise pos marker
	execute in fetchr:default run forceload add 0 0