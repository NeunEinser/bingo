#> bingo:init/init
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

#TODO change to use tmp.bingo:<name> everywhere
#declare storage bingo:tmp

#region Storage declarations
	#>
	#
	# @api
	#declare storage bingo:custom_hud

	#>
	# This storage is used to keep track of all items that are available in
	# Minecraft: Bingo.
	#
	# The items array contains a list of all items that were registered. The
	# categories array holds all categories. Categories have an items array
	# containing the full item definition, like in the items array.
	#
	# Items have the following NBT structure:
	# id: (String) custom namespaced id to uniquely identify the item within bingo
	# item: (Compound) Minecraft item data. Should be set in such a way, that an
	# 	item of this type looks exactly the same as the item you require.
	# textComponent: (String) The text component that is used for displaying the
	# 	item name.
	# icon: (String) Parsable text component that holds a character which is re-
	# 	textured to look like the item you require
	# detectCommand: (String) Command for detecting if the player has this item.
	# 	Has to set the player's bingo.has_item score. The command that is used in
	# 	default bingo follows the scheme
	# 	execute as @a store success score @s bingo.has_item run clear @s <item> 0,
	# 	though, a different command that sets the score would be acceptable, too
	# clearCommand: (String) Command for clearing the item from the player's
	# 	inventory. Should look like this: "clear @a[tag=bingo.clear] <item> 1
	# categories: (String List) List of category names. All categories referenced
	# 	here should be registered separately.
	# weight: (Integer) Weight of this item for the RNG.
	#
	# Categories have the following structure:
	# name: (String) Namespaced id to uniquely identify the category within bingo
	# translatableName: (String) Text component used for displaying the category's
	# 	name
	# items: (Compound List) (read-only) List of all items this category has. Entries
	# 	have the same structure as in the items array. Will be created
	# 	automatically, after #bingo:post_register_items ran.
	#
	# @api
	#declare storage bingo:items

	#>
	# This is the registry used to register things to Minecraft Bingo.
	#
	# To register new things in an extension pack, add your own function to the
	# function tag #bingo:fill_registries.
	#
	# To execute an action before the registries are processed but after all active
	# extension packs have registered everything, add a function to the function tag
	# #bingo:post_registration
	#
	# All registries are an array of the type of thing you want to register.
	#
	# Available registries:
	# categories: categories of Minecraft Bingo. NBT-Structure see storage
	# 	 definition of bingo:items
	# items: All items that are available. NBT-Structure see storage definition of
	# 	bingo:items
	# structures: Each entry holds a string representing a namespaced id of a
	# 	structure file to be added to the lobby. The center must be the corridor.
	# 	Add emptiness in case of unsymetric sizes.
	#
	# In order to modify existing items, either added by the default bingo datapack,
	# or added by another extension pack, please use a function registered to the
	# function tag #bingo:post_register_items
	#
	# The items array should be considered read-only from other places.
	#
	# @api
	#declare storage bingo:registries

	#>
	# This storage is used to store player configurations.
	#
	# Player configurations store the desired initial inventory and potion effects.
	#
	# This is public, to allow for other datapacks that are added ontop of the
	# vanilla Minecraft: Bingo game to add more default configurations.
	#
	# @public
	#declare storage bingo:player

	#>
	# This storage holds the current Bingo card. It contains information about the
	# currently generated card and about all playing teams' progress.
	#
	# @internal
	#declare storage bingo:card
#endregion

#region tag declarations
	#>
	# This tag is used to tag the item frames that display the big preview card in
	# the lobby
	#
	# @internal
	#declare tag bingo.card_frame
	#>
	# This tag is used during item removal after successfully obtaining an item from
	# the card.
	#
	# @internal
	#declare tag bingo.clear
	#>
	# This tag marks a player who is at a location eligible for emerald generation.
	#
	# @internal
	#declare tag bingo.emerald
	#>
	# This tag is used for the area effect cloud marking the location for the skybox
	#
	# @internal
	#declare tag bingo.skybox_cloud
	#>
	# This tag is given to players who are currently verifying their resource pack
	#
	# @internal
	#declare tag bingo.resourcepack_check
	#>
	# This tag is given to any player who triggered bingo.spectator in game.
	#
	# @internal
	#declare tag bingo.spectator
	#>
	# This tag is used for players who enable manual gamemode switching.
	#
	# @internal
	#declare tag bingo.enable_manual_gamemode_switch
	#region slots
		#>
		# This tag marks a player who is in a team that obtained the item in slot 0.
		#
		# @within
		# 	function bingo:game/start/spawn_players
		# 	structure bingo:machinery
		#declare tag bingo.has_slot0
		#>
		# This tag marks a player who is in a team that obtained the item in slot 1.
		#
		# @within
		# 	function bingo:game/start/spawn_players
		# 	structure bingo:machinery
		#declare tag bingo.has_slot1
		#>
		# This tag marks a player who is in a team that obtained the item in slot 2.
		#
		# @within
		# 	function bingo:game/start/spawn_players
		# 	structure bingo:machinery
		#declare tag bingo.has_slot2
		#>
		# This tag marks a player who is in a team that obtained the item in slot 3.
		#
		# @within
		# 	function bingo:game/start/spawn_players
		# 	structure bingo:machinery
		#declare tag bingo.has_slot3
		#>
		# This tag marks a player who is in a team that obtained the item in slot 4.
		#
		# @within
		# 	function bingo:game/start/spawn_players
		# 	structure bingo:machinery
		#declare tag bingo.has_slot4
		#>
		# This tag marks a player who is in a team that obtained the item in slot 5.
		#
		# @within
		# 	function bingo:game/start/spawn_players
		# 	structure bingo:machinery
		#declare tag bingo.has_slot5
		#>
		# This tag marks a player who is in a team that obtained the item in slot 6.
		#
		# @within
		# 	function bingo:game/start/spawn_players
		# 	structure bingo:machinery
		#declare tag bingo.has_slot6
		#>
		# This tag marks a player who is in a team that obtained the item in slot 7.
		#
		# @within
		# 	function bingo:game/start/spawn_players
		# 	structure bingo:machinery
		#declare tag bingo.has_slot7
		#>
		# This tag marks a player who is in a team that obtained the item in slot 8.
		#
		# @within
		# 	function bingo:game/start/spawn_players
		# 	structure bingo:machinery
		#declare tag bingo.has_slot8
		#>
		# This tag marks a player who is in a team that obtained the item in slot 9.
		#
		# @within
		# 	function bingo:game/start/spawn_players
		# 	structure bingo:machinery
		#declare tag bingo.has_slot9
		#>
		# This tag marks a player who is in a team that obtained the item in slot 10.
		#
		# @within
		# 	function bingo:game/start/spawn_players
		# 	structure bingo:machinery
		#declare tag bingo.has_slot10
		#>
		# This tag marks a player who is in a team that obtained the item in slot 11.
		#
		# @within
		# 	function bingo:game/start/spawn_players
		# 	structure bingo:machinery
		#declare tag bingo.has_slot11
		#>
		# This tag marks a player who is in a team that obtained the item in slot 12.
		#
		# @within
		# 	function bingo:game/start/spawn_players
		# 	structure bingo:machinery
		#declare tag bingo.has_slot12
		#>
		# This tag marks a player who is in a team that obtained the item in slot 13.
		#
		# @within
		# 	function bingo:game/start/spawn_players
		# 	structure bingo:machinery
		#declare tag bingo.has_slot13
		#>
		# This tag marks a player who is in a team that obtained the item in slot 14.
		#
		# @within
		# 	function bingo:game/start/spawn_players
		# 	structure bingo:machinery
		#declare tag bingo.has_slot14
		#>
		# This tag marks a player who is in a team that obtained the item in slot 15.
		#
		# @within
		# 	function bingo:game/start/spawn_players
		# 	structure bingo:machinery
		#declare tag bingo.has_slot15
		#>
		# This tag marks a player who is in a team that obtained the item in slot 16.
		#
		# @within
		# 	function bingo:game/start/spawn_players
		# 	structure bingo:machinery
		#declare tag bingo.has_slot16
		#>
		# This tag marks a player who is in a team that obtained the item in slot 17.
		#
		# @within
		# 	function bingo:game/start/spawn_players
		# 	structure bingo:machinery
		#declare tag bingo.has_slot17
		#>
		# This tag marks a player who is in a team that obtained the item in slot 18.
		#
		# @within
		# 	function bingo:game/start/spawn_players
		# 	structure bingo:machinery
		#declare tag bingo.has_slot18
		#>
		# This tag marks a player who is in a team that obtained the item in slot 19.
		#
		# @within
		# 	function bingo:game/start/spawn_players
		# 	structure bingo:machinery
		#declare tag bingo.has_slot19
		#>
		# This tag marks a player who is in a team that obtained the item in slot 20.
		#
		# @within
		# 	function bingo:game/start/spawn_players
		# 	structure bingo:machinery
		#declare tag bingo.has_slot20
		#>
		# This tag marks a player who is in a team that obtained the item in slot 21.
		#
		# @within
		# 	function bingo:game/start/spawn_players
		# 	structure bingo:machinery
		#declare tag bingo.has_slot21
		#>
		# This tag marks a player who is in a team that obtained the item in slot 22.
		#
		# @within
		# 	function bingo:game/start/spawn_players
		# 	structure bingo:machinery
		#declare tag bingo.has_slot22
		#>
		# This tag marks a player who is in a team that obtained the item in slot 23.
		#
		# @within
		# 	function bingo:game/start/spawn_players
		# 	structure bingo:machinery
		#declare tag bingo.has_slot23
		#>
		# This tag marks a player who is in a team that obtained the item in slot 24.
		#
		# @within
		# 	function bingo:game/start/spawn_players
		# 	structure bingo:machinery
		#declare tag bingo.has_slot24
	#endregion

	#region lobby signs
		#region machinery
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	function bingo:init/setup_lobby
			#declare tag bingo.sign_machinery
		#endregion

		#region credits
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:credits
			#declare tag bingo.sign_credits_neun_einser
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:credits
			#declare tag bingo.sign_credits_kristof
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:credits
			#declare tag bingo.sign_credits_gbegerow
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:credits
			#declare tag bingo.sign_credits_amber_wat
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:credits
			#declare tag bingo.sign_credits_nope_name
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:credits
			#declare tag bingo.sign_credits_dr_brian_lorgon111
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:credits
			#declare tag bingo.sign_credits_community_and_support
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:credits
			#declare tag bingo.sign_credits_playtesters
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:credits
			#declare tag bingo.sign_credits_silentrob
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:credits
			#declare tag bingo.sign_credits_muffinshire
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:credits
			#declare tag bingo.sign_credits_gothfaerie
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:credits
			#declare tag bingo.sign_credits_zampone
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:credits
			#declare tag bingo.sign_credits_thomas_to_space
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:credits
			#declare tag bingo.sign_credits_craca_croes_gazyy
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:credits
			#declare tag bingo.sign_credits_lifeofchrome
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:credits
			#declare tag bingo.sign_credits_tod_nl
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:credits
			#declare tag bingo.sign_credits_no_leaf_clover

			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:credits
			#declare tag bingo.sign_credits_tools
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:credits
			#declare tag bingo.sign_credits_tools_vscode
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:credits
			#declare tag bingo.sign_credits_tools_datapackhelperplus
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:credits
			#declare tag bingo.sign_credits_tools_multinoise
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:credits
			#declare tag bingo.sign_credits_tools_nbtexplorer
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:credits
			#declare tag bingo.sign_credits_tools_nbtstudio
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:credits
			#declare tag bingo.sign_credits_tools_nbtviewer
		#endregion

		#region card generation
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:card_generation
			#declare tag bingo.sign_team_selection
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:card_generation
			#declare tag bingo.sign_card_generation_crafting_table
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:card_generation
			#declare tag bingo.sign_card_generation_furnace
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:card_generation
			#declare tag bingo.sign_card_generation_random_card
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:card_generation
			#declare tag bingo.sign_card_generation_from_seed
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:card_generation
			#declare tag bingo.sign_card_generation_start_game
		#endregion

		#region tutorial & settings
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:tutorial
			#declare tag bingo.sign_settings_more_coming
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:tutorial
			#declare tag bingo.sign_settings_automatic_pregen
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:tutorial
			#declare tag bingo.sign_settings_strict_mode
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:tutorial
			#declare tag bingo.sign_settings_preferences
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:tutorial
			#declare tag bingo.sign_tutorial_generate_chests
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:tutorial
			#declare tag bingo.sign_tutorial_generate_chests
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:tutorial
			#declare tag bingo.sign_tutorial_basics
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:tutorial
			#declare tag bingo.sign_tutorial_basics1
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:tutorial
			#declare tag bingo.sign_tutorial_basics2
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:tutorial
			#declare tag bingo.sign_tutorial_basics3
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:tutorial
			#declare tag bingo.sign_tutorial_basics4
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:tutorial
			#declare tag bingo.sign_tutorial_basics5
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:tutorial
			#declare tag bingo.sign_tutorial_basics6
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:tutorial
			#declare tag bingo.sign_tutorial_skybox
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:tutorial
			#declare tag bingo.sign_tutorial_get_tools
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:tutorial
			#declare tag bingo.sign_tutorial_game_info
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:tutorial
			#declare tag bingo.sign_tutorial_goal_lectern
			#>
			# @within
			# 	function bingo:lobby/place_indestructible_blocks
			# 	structure bingo:tutorial
			#declare tag bingo.sign_tutorial_game_info_lectern
		#endregion
	#endregion

	#region lobby buttons
		#>
		# @within
		# 	function bingo:lobby/place_indestructible_blocks
		# 	structure bingo:card_generation
		#declare tag bingo.lobby_button
		#>
		# @within
		# 	function bingo:lobby/place_indestructible_blocks
		# 	function bingo:lobby/press_button
		# 	structure bingo:card_generation
		#declare tag bingo.button_red
		#>
		# @within
		# 	function bingo:lobby/place_indestructible_blocks
		# 	function bingo:lobby/press_button
		# 	structure bingo:card_generation
		#declare tag bingo.button_orange
		#>
		# @within
		# 	function bingo:lobby/place_indestructible_blocks
		# 	function bingo:lobby/press_button
		# 	structure bingo:card_generation
		#declare tag bingo.button_yellow
		#>
		# @within
		# 	function bingo:lobby/place_indestructible_blocks
		# 	function bingo:lobby/press_button
		# 	structure bingo:card_generation
		#declare tag bingo.button_lime
		#>
		# @within
		# 	function bingo:lobby/place_indestructible_blocks
		# 	function bingo:lobby/press_button
		# 	structure bingo:card_generation
		#declare tag bingo.button_green
		#>
		# @within
		# 	function bingo:lobby/place_indestructible_blocks
		# 	function bingo:lobby/press_button
		# 	structure bingo:card_generation
		#declare tag bingo.button_cyan
		#>
		# @within
		# 	function bingo:lobby/place_indestructible_blocks
		# 	function bingo:lobby/press_button
		# 	structure bingo:card_generation
		#declare tag bingo.button_light_blue
		#>
		# @within
		# 	function bingo:lobby/place_indestructible_blocks
		# 	function bingo:lobby/press_button
		# 	structure bingo:card_generation
		#declare tag bingo.button_blue
		#>
		# @within
		# 	function bingo:lobby/place_indestructible_blocks
		# 	function bingo:lobby/press_button
		# 	structure bingo:card_generation
		#declare tag bingo.button_purple
		#>
		# @within
		# 	function bingo:lobby/place_indestructible_blocks
		# 	function bingo:lobby/press_button
		# 	structure bingo:card_generation
		#declare tag bingo.button_magenta
	#endregion
#endregion

#region setup objectives
	scoreboard objectives remove bingo.const
	scoreboard objectives remove bingo.has_item
	scoreboard objectives remove bingo.hud_update
	scoreboard objectives remove bingo.io
	scoreboard objectives remove bingo.lobby
	scoreboard objectives remove bingo.menu_page
	scoreboard objectives remove bingo.pos_hash
	scoreboard objectives remove bingo.seed
	scoreboard objectives remove bingo.spectator
	scoreboard objectives remove bingo.resources
	scoreboard objectives remove bingo.tmp
	scoreboard objectives remove bingo.pref

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
		scoreboard objectives add bingo.const dummy

		#>
		# This objective is used for public function's input and output
		#
		# @api
		scoreboard objectives add bingo.io dummy

		#>
		# This objective holds the game state, such as whether a game is currently
		# running
		#
		# @public
		scoreboard objectives add bingo.state dummy

		#>
		# This objective is set to 1 for players who confirmed their operator status in
		# strict mode.
		#
		# This uses an objective rather than a tag so that it is possible to remove
		# operators even when they are offline.
		#
		# @public
		scoreboard objectives add bingo.operator dummy

		#>
		# Whether this player's hud needs to be forcefully updated entirely
		# This is for example set when the player changes hud preferences. 
		#
		# @api
		scoreboard objectives add bingo.update_hud dummy
		scoreboard players set @a bingo.update_hud 1
	#endregion

	#region trigger objectives
		#>
		# Trigger objective for returning to the lobby.
		#
		# @internal
		# @user
		scoreboard objectives add bingo.lobby trigger

		#>
		# Trigger objective used to handle changes / clicks in the preferences menu.
		#
		# @internal
		scoreboard objectives add bingo.pref trigger

		#>
		# Trigger objective used to switch to spectator mode while in game.
		#
		# @internal
		scoreboard objectives add bingo.spectator trigger

		#>
		# Trigger objective used in the player configuration dialogs.
		#
		# @internal
		#scoreboard objectives add bingo.player_con trigger

		#>
		# This trigger is used for confirming that the resource pack is active
		#
		# @internal
		scoreboard objectives add bingo.resources trigger

		#>
		# Trigger objective used to generate a bingo card with a set seed.
		#
		# @internal
		# @user
		scoreboard objectives add bingo.seed trigger

		#>
		# Trigger objective used to load certain setting pages.
		#
		# @internal
		# @user
		scoreboard objectives add bingo.settings trigger
	#endregion

	#region other internal objectives
		#>
		# This objective holds the position preference of where a player's card should
		# be displayed.
		#
		# @internal
		scoreboard objectives add bingo.card_pos dummy

		#>
		# This objective contains unique IDs for the item frames in the lobby.
		#
		# This is needed to identify the correct item frame to use for the current item
		# in card_generation.
		#
		# @internal
		scoreboard objectives add bingo.frame_id dummy

		#>
		# This objective is used to keep track of the current game id. Players who
		# joined during a different game are teleported back to the lobby.
		#
		# @internal
		scoreboard objectives add bingo.game_id dummy
		#>
		# The current game id
		#
		# @internal
		#declare score_holder $current_game_id
		scoreboard players add $current_game_id bingo.game_id 0

		#>
		# This objective is used for item detection to store whether the detect command
		# succeeded for a player.
		#
		# Since this part of item detection uses command blocks, fake players cannot be
		# used here.
		#
		# @internal
		scoreboard objectives add bingo.has_item dummy

		#>
		# This objective contains unique player IDs, used to identify player-specific
		# data in storage.
		#
		# @internal
		scoreboard objectives add bingo.id dummy

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
		scoreboard objectives add bingo.menu_page dummy

		#>
		# This objective is used to store information for scheduled events
		#
		# @internal
		scoreboard objectives add bingo.schedule dummy

		#>
		# This objective is used for temporary calculations.
		#
		# @internal
		scoreboard objectives add bingo.tmp dummy
	#endregion

	#region private objectives
		#>
		# This objective is used to store the player's position hash, which in turn
		# is used to determine whether the player position display needs updating
		# @within
		#		function bingo:init/init
		#		function bingo:custom_hud/components/player_position/*
		scoreboard objectives add bingo.pos_hash dummy

		#>
		# The last time the hud was refreshed for each player
		# #TODO rename to something like "last_hud_update" in 1.18 when the stupid
		# # length limit is gone.
		#
		# @within
		#		function bingo:init/init
		#		function bingo:custom_hud/*
		scoreboard objectives add bingo.hud_update dummy

		#>
		# This objective is used to detect a player reconnecting
		#
		# @within
		#		function bingo:init/init
		#		function bingo:tick/tick
		#		function bingo:tick/handle_player_join
		scoreboard objectives add bingo.reconnect minecraft.custom:minecraft.leave_game

	#endregion

	#region score holders
		#>
		# Whether command blocks are enabled
		#
		# @internal
		#declare score_holder $commandblocks_enabled
		scoreboard players set $commandblocks_enabled bingo.state 0
		setblock 0 4 0 minecraft:air
		setblock 0 4 0 minecraft:command_block{auto: true, Command: "scoreboard players set $commandblocks_enabled bingo.state 1"}

		#>
		# The current game state
		# 0 = Lobby / Not in game
		# 1 = Starting / chunk pre-gen
		# 2 = Skybox phase
		# 3 = Game started
		#
		# @public
		#declare score_holder $game_state
		scoreboard players add $game_state bingo.state 0
		#>
		# Whether this is multiplayer
		#
		# @public
		#declare score_holder $is_multiplayer
		scoreboard players add $is_multiplayer bingo.state 0
		#>
		# The status of chunk pregeneration.
		# 0 = not started
		# 1 = started / during the process
		# 2 = completed
		#
		# @public
		#declare score_holder $pregen_status
		scoreboard players add $pregen_status bingo.state 0
		#>
		# Whether the lobby is already generated.
		#
		# Currently, the lobby only generates once to avoid bugs. This will change in
		# the future though.
		#
		# @public
		#declare score_holder $lobby_generated
		scoreboard players add $lobby_generated bingo.state 0
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
		scoreboard players add $automatically_pregen bingo.settings 0
		#>
		# Whether strict mode is turned on
		#
		# @internal
		#declare score_holder $strict_mode
		scoreboard players add $strict_mode bingo.settings 0

		#>
		# The current game seed
		#
		# Stored in bingo.state
		#
		# @internal
		#declare score_holder $seed
		#>
		# The current total item weight
		#
		# Stored in bingo.state
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
		# Stored in bingo.state
		#
		# @internal
		#declare score_holder $available_category_weight
		#>
		# Time from last tick
		#
		# @internal
		#declare score_holder $last_tick
		scoreboard players reset $last_tick bingo.state
		#>
		# Whether the card needs to be updated
		#
		# @internal
		#declare score_holder $update_card
		#>
		# @public
		#declare score_holder -2
		scoreboard players set -2 bingo.const -2
		#>
		# @public
		#declare score_holder -1
		scoreboard players set -1 bingo.const -1
		#>
		# @public
		#declare score_holder 2
		scoreboard players set 2 bingo.const 2
		#>
		# @public
		#declare score_holder 3
		scoreboard players set 3 bingo.const 3
		#>
		# @public
		#declare score_holder 4
		scoreboard players set 4 bingo.const 4
		#>
		# @public
		#declare score_holder 5
		scoreboard players set 5 bingo.const 5
		#>
		# @public
		#declare score_holder 6
		scoreboard players set 6 bingo.const 6
		#>
		# @public
		#declare score_holder 8
		scoreboard players set 8 bingo.const 8
		#>
		# @public
		#declare score_holder 9
		scoreboard players set 9 bingo.const 9
		#>
		# @public
		#declare score_holder 10
		scoreboard players set 10 bingo.const 10
		#>
		# @public
		#declare score_holder 16
		scoreboard players set 16 bingo.const 16
		#>
		# @public
		#declare score_holder 32
		scoreboard players set 32 bingo.const 32
		#>
		# @public
		#declare score_holder 40
		scoreboard players set 40 bingo.const 40
		#>
		# @public
		#declare score_holder 41
		scoreboard players set 41 bingo.const 41
		#>
		# @public
		#declare score_holder 100
		scoreboard players set 100 bingo.const 100
		#>
		# @public
		#declare score_holder 256
		scoreboard players set 256 bingo.const 256
		#>
		# @public
		#declare score_holder 512
		scoreboard players set 512 bingo.const 512
		#>
		# @public
		#declare score_holder 1000
		scoreboard players set 1000 bingo.const 1000
		#>
		# @public
		#declare score_holder 65536
		scoreboard players set 65536 bingo.const 65536
	#endregion
#endregion

# Create overworld resourcepack check
	#>
	# @private
	#declare tag bingo.detect_mp_aec

	kill @e[type=minecraft:area_effect_cloud, tag=bingo.detect_mp_aec, limit=1]
	summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:'{"translate": "bingo.technical.detect_multiplayer"}', Age: -2147483648, Duration: -1, WaitTime: -2147483648, Tags: ["bingo.detect_mp_aec"]}
	fill 0 0 0 2 3 2 minecraft:black_concrete outline
	setworldspawn 1 0 1
	gamerule spawnRadius 0

# Add pregen bossbar
	bossbar add bingo:start/pre_gen/progress {"translate": "bingo.game.start.pre_gen_progress"}
	bossbar set bingo:start/pre_gen/progress color red
	execute unless score $game_state bingo.state matches 1 run bossbar set bingo:start/pre_gen/progress visible false

# Set gamerules
	gamerule commandBlockOutput false
	gamerule doWeatherCycle false
	gamerule doInsomnia false
	gamerule doTraderSpawning false
	gamerule disableElytraMovementCheck true
	gamerule doPatrolSpawning false
	gamerule maxCommandChainLength 262144
	difficulty easy

# Init slow loops
	function bingo:tick/clean_up

# setup default player configurations
	#data remove storage bingo:player configurations
	#data modify storage bingo:player configurations append value {name: '{"translate": "bingo.lobby.settings.player.configuration.empty"}', inventory: [], effects: [], fixed: true}
	#data modify storage bingo:player configurations append value {name: '{"translate": "bingo.lobby.settings.player.configuration.night_vision"}', inventory: [], effects: [{Id:16b, Amplifier: 0b, Duration: 2147483647, Ambient: 0b, ShowParticles: 0b, ShowIcon:0b}], selected: true}
	#data modify storage bingo:player configurations append value {name: '{"translate": "bingo.lobby.settings.player.configuration.boats"}', inventory: [{Slot: 8b, id: "minecraft:oak_boat", Count: 1b}, {Slot: 17b, id: "minecraft:oak_boat", Count: 1b}, {Slot: 26b, id: "minecraft:oak_boat", Count: 1b}, {Slot: 35b, id: "minecraft:oak_boat", Count: 1b}], effects: [{Id:16b, Amplifier: 0b, Duration: 2147483647, Ambient: 0b, ShowParticles: 0b, ShowIcon:0b}]}
	#data modify storage bingo:player configurations append value {name: '{"translate": "bingo.lobby.settings.player.configuration.elytra"}', inventory: [{Slot: 8b, id: "minecraft:firework_rocket", Count: 64b}, {Slot: 102b, id: "minecraft:elytra", Count: 1b, tag: {Unbreakable: true}}], effects: [{Id:16b, Amplifier: 0b, Duration: 2147483647, Ambient: 0b, ShowParticles: 0b, ShowIcon:0b}]}
	#data modify storage bingo:player configurations append value {name: '{"translate": "bingo.lobby.settings.player.configuration.frostwalker"}', inventory: [{Slot: 100b, id: "minecraft:leather_boots", Count: 1b, tag: {Unbreakable: true, Enchantments:[{lvl: 2s, id: "minecraft:frost_walker"}]}}], effects: [{Id:16b, Amplifier: 0b, Duration: 2147483647, Ambient: 0b, ShowParticles: 0b, ShowIcon:0b}]}
	#data modify storage bingo:player configurations append value {name: '{"translate": "bingo.lobby.settings.player.configuration.underwater"}', inventory: [{Slot: 100b, id: "minecraft:leather_boots", Count: 1b, tag: {Unbreakable: true, Enchantments:[{lvl: 3s, id: "minecraft:depth_strider"}]}}], effects: [{Id:13b, Amplifier: 0b, Duration: 2147483647, Ambient: 0b, ShowParticles: 0b, ShowIcon:0b}, {Id:16b, Amplifier: 0b, Duration: 2147483647, Ambient: 0b, ShowParticles: 0b, ShowIcon:0b}]}

# setup teams
	## add
		team add bingo.aqua
		team add bingo.black
		team add bingo.blue
		team add bingo.dark_aqua
		team add bingo.dark_blue
		team add bingo.dark_gray
		team add bingo.dark_green
		team add bingo.dark_purpl
		team add bingo.dark_red
		team add bingo.gold
		team add bingo.gray
		team add bingo.green
		team add bingo.light_purp
		team add bingo.red
		team add bingo.white
		team add bingo.yellow

	## set colors
		team modify bingo.aqua color aqua
		team modify bingo.black color black
		team modify bingo.blue color blue
		team modify bingo.dark_aqua color dark_aqua
		team modify bingo.dark_blue color dark_blue
		team modify bingo.dark_gray color dark_gray
		team modify bingo.dark_green color dark_green
		team modify bingo.dark_purpl color dark_purple
		team modify bingo.dark_red color dark_red
		team modify bingo.gold color gold
		team modify bingo.gray color gray
		team modify bingo.green color green
		team modify bingo.light_purp color light_purple
		team modify bingo.red color red
		team modify bingo.white color white
		team modify bingo.yellow color yellow

	## set completed backgrounds
		data modify storage bingo:card completedBackgroundTemplates set value []
		data modify storage bingo:card completedBackgroundTemplates append value ['"\\uf000"']
		data modify storage bingo:card completedBackgroundTemplates append value ['"\\uf000"','"\\uf001"']
		data modify storage bingo:card completedBackgroundTemplates append value ['"\\uf000"','"\\uf001"','"\\uf002"']
		data modify storage bingo:card completedBackgroundTemplates append value ['"\\uf000"','"\\uf001"','"\\uf003"','"\\uf004"']
		data modify storage bingo:card completedBackgroundTemplates append value ['"\\uf000"','"\\uf001"','"\\uf005"','"\\uf006"','"\\uf007"']
		data modify storage bingo:card completedBackgroundTemplates append value ['"\\uf000"','"\\uf001"','"\\uf008"','"\\uf002"','"\\uf004"','"\\uf009"']
		data modify storage bingo:card completedBackgroundTemplates append value ['"\\uf000"','"\\uf001"','"\\uf00a"','"\\uf00b"','"\\uf00c"','"\\uf00d"','"\\uf00e"']
		data modify storage bingo:card completedBackgroundTemplates append value ['"\\uf000"','"\\uf001"','"\\uf00f"','"\\uf003"','"\\uf010"','"\\uf004"','"\\uf011"','"\\uf012"']
		data modify storage bingo:card completedBackgroundTemplates append value ['"\\uf000"','"\\uf001"','"\\uf013"','"\\uf014"','"\\uf002"','"\\uf015"','"\\uf016"','"\\uf009"','"\\uf017"']
		data modify storage bingo:card completedBackgroundTemplates append value ['"\\uf000"','"\\uf001"','"\\uf018"','"\\uf005"','"\\uf019"','"\\uf006"','"\\uf004"','"\\uf007"','"\\uf01a"','"\\uf01b"']
		data modify storage bingo:card completedBackgroundTemplates append value ['"\\uf000"','"\\uf001"','"\\uf01c"','"\\uf01d"','"\\uf01e"','"\\uf01f"','"\\uf020"','"\\uf021"','"\\uf022"','"\\uf023"','"\\uf024"']
		data modify storage bingo:card completedBackgroundTemplates append value ['"\\uf000"','"\\uf001"','"\\uf025"','"\\uf008"','"\\uf003"','"\\uf002"','"\\uf026"','"\\uf004"','"\\uf027"','"\\uf009"','"\\uf012"','"\\uf028"']
		data modify storage bingo:card completedBackgroundTemplates append value ['"\\uf000"','"\\uf001"','"\\uf029"','"\\uf02a"','"\\uf02b"','"\\uf02c"','"\\uf02d"','"\\uf02e"','"\\uf02f"','"\\uf030"','"\\uf031"','"\\uf032"','"\\uf033"']
		data modify storage bingo:card completedBackgroundTemplates append value ['"\\uf000"','"\\uf001"','"\\uf034"','"\\uf00a"','"\\uf035"','"\\uf00b"','"\\uf036"','"\\uf00c"','"\\uf004"','"\\uf00d"','"\\uf037"','"\\uf00e"','"\\uf038"','"\\uf039"']
		data modify storage bingo:card completedBackgroundTemplates append value ['"\\uf000"','"\\uf001"','"\\uf03a"','"\\uf03b"','"\\uf005"','"\\uf03c"','"\\uf002"','"\\uf006"','"\\uf03d"','"\\uf03e"','"\\uf007"','"\\uf009"','"\\uf03f"','"\\uf01b"','"\\uf040"']
		data modify storage bingo:card completedBackgroundTemplates append value ['"\\uf000"','"\\uf001"','"\\uf041"','"\\uf00f"','"\\uf042"','"\\uf003"','"\\uf043"','"\\uf010"','"\\uf044"','"\\uf004"','"\\uf045"','"\\uf011"','"\\uf046"','"\\uf012"','"\\uf047"','"\\uf048"']
#region run registries
	data remove storage bingo:registries categories
	data remove storage bingo:registries items
	data remove storage bingo:registries structures
	data remove storage bingo:registries hud_components
	data remove storage bingo:registries preferences
	function #bingo:fill_registries

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
	# bingo item pool or from other extension packs.
	#
	# @api
	#declare tag/function bingo:post_registration
	function #bingo:post_registration
#endregion
#region initialize items
	#>
	# @within function bingo:init/**
	#declare storage tmp.bingo:init

	# initialize items
	data modify storage tmp.bingo:init items set from storage bingo:registries items
	data modify storage bingo:items categories set from storage bingo:registries categories
	data remove storage bingo:items items

	function bingo:init/items/first_pass
	function bingo:init/items/second_pass
	
	execute unless data storage bingo:items activeTags run data modify storage bingo:items activeTags set value ["bingo:default"]
	# Schedule to avoid maxCommandChainLength being hit (setting it in init doesn't work the first time)
	schedule function bingo:util/apply_active_item_tags 1t
#endregion

#region initialize hud components
	#>
	# @within
	# 	function bingo:init/init
	# 	function bingo:init/initialize_hud_components/*
	#declare storage tmp.bingo:init/hud
	data modify storage bingo:custom_hud components set value []

	data modify storage tmp.bingo:init/hud columns set value [[], []]
	data modify storage tmp.bingo:init/hud whereSpace set value []
	data modify storage tmp.bingo:init/hud unpreferred set value []
	function bingo:init/initialize_hud_components/add_defaults
	data modify storage tmp.bingo:init/hud whereSpace append from storage tmp.bingo:init/hud unpreferred[]

	data modify storage bingo:custom_hud components set value []
	data modify storage bingo:custom_hud components append from storage tmp.bingo:init/hud columns[0][]
	data modify storage bingo:custom_hud components append from storage tmp.bingo:init/hud columns[1][]
	data modify storage bingo:custom_hud components append from storage tmp.bingo:init/hud whereSpace[]

	data modify storage bingo:custom_hud default set value []
	data modify storage bingo:custom_hud default append from storage tmp.bingo:init/hud columns[0][0]
	data modify storage bingo:custom_hud default append from storage tmp.bingo:init/hud columns[0][1]
	data modify storage bingo:custom_hud default append from storage tmp.bingo:init/hud columns[0][2]
	data modify storage bingo:custom_hud default append from storage tmp.bingo:init/hud columns[0][3]
	data modify storage bingo:custom_hud default append from storage tmp.bingo:init/hud columns[0][4]
	execute unless data storage bingo:custom_hud default[4] run function bingo:init/initialize_hud_components/fill_default_col0
	
	execute unless data storage tmp.bingo:init/hud columns[1][5] run data modify storage bingo:custom_hud default append value {id: "bingo:spacer", name: '{"translate": "bingo.custom_hud.components.spacer"}', padding: '{"translate": "space.91"}'}
	data modify storage bingo:custom_hud default append from storage tmp.bingo:init/hud columns[1][0]
	data modify storage bingo:custom_hud default append from storage tmp.bingo:init/hud columns[1][1]
	data modify storage bingo:custom_hud default append from storage tmp.bingo:init/hud columns[1][2]
	data modify storage bingo:custom_hud default append from storage tmp.bingo:init/hud columns[1][3]
	data modify storage bingo:custom_hud default append from storage tmp.bingo:init/hud columns[1][4]
	data modify storage bingo:custom_hud default append from storage tmp.bingo:init/hud columns[1][5]
	execute unless data storage bingo:custom_hud default[10] run function bingo:init/initialize_hud_components/fill_default_col1
	
	data remove storage bingo:custom_hud default[].addByDefault
	data remove storage bingo:custom_hud default[].preferredColumn
#endregion

# spawn strcutures
	execute if score $lobby_generated bingo.state matches 0 in bingo:lobby run function bingo:init/setup_lobby
	scoreboard players set $lobby_generated bingo.state 1