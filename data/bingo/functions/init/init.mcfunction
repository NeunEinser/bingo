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

#TODO change everywhere
#declare storage bingo:tmp

#region Storage declarations
#>
# This storage is used to keep track of all items that are available in
# Minecraft: Bingo.
#
# The items array contains a list of all items that were registered. The
# categories array holds all categories. Categories have an items array
# containing the full item definition, like in the items array.
#
# Items have the following NBT structure:
# id: (String) custom namespaced id to uniquly identify the item within bingo
# item: (Compound) Minecraft item data. Should be set in such a way, that an
# 	item of this type looks exactly the same as the item you require.
# textComponent: (String) The text component that is used for displaying the
# 	item name.
# icon: (String) Parsable text component that holds a charcter which is re-
# 	textured to look like the item you require
# detectCommand: (String) Command for detecting if the player has this item.
# 	Has to set the player's bingo.has_item score. The command that is used in
# 	default bingo follows the scheme
# 	execute as @a store success score @s bingo.has_item run clear @s <item> 0,
# 	though, a different command that sets the score would be acceptable, too
# clearCommand: (String) Command for clearing the item from the player's
# 	inventory. Should look like this: "clear @a[tag=bingo.clear] <item> 1
# categories: (String List) List of category names. All categories referenced
# 	here should be registered seperately.
# weight: (Integer) Weight of this item for the rng.
#
# Categories have the following structure:
# name: (String) Namespaced id to uniquly identify the category within bingo
# translateableName: (String) Text component used for displaying the category's
# 	name
# items: (Compund List) (readonly) List of all items this category has. Entries
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

#TODO move to temp:bingo
#declare storage bingo:card_generation
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
#endregion

#region setup objectives
scoreboard objectives remove bingo.const
scoreboard objectives remove bingo.has_item
scoreboard objectives remove bingo.lobby
scoreboard objectives remove bingo.menu_page
scoreboard objectives remove bingo.seed
scoreboard objectives remove bingo.tmp
scoreboard objectives remove bingo.pref

#>
# This objective contains unique player IDs, used to identify player-specific
# data in storage.
#
# @internal
scoreboard objectives add bingo.id dummy

#>
# This objective contains unique IDs for the item frames in the lobby.
#
# This is needed to identify the correct item frame to use for the current item
# in card_generation.
#
# @internal
scoreboard objectives add bingo.frame_id dummy

#>
# This objective contains unique IDs for the item frames in the lobby.
#
# This is needed to identify the correct item frame to use for the current item
# in card_generation.
#
# @internal
scoreboard objectives add bingo.frame_id dummy

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
# This objective is used for temporary calculations.
#
# @internal
scoreboard objectives add bingo.tmp dummy

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
# This objective is used to store information for scheduled events
#
# @internal
scoreboard objectives add bingo.schedule dummy

#>
# This objective holds the game state, such as whether a game is currently
# running
#
# @internal
scoreboard objectives add bingo.state dummy

#>
# The current game state
# 0 = Lobby / Not in game
# 1 = Starting / pre-game (i.e chunks generating or skybox phase)
# 2 = Game started
#
# @internal
#declare score_holder $game_state
scoreboard players add $game_state bingo.state 0
#>
# The status of pregeneration.
# 0 = not started
# 1 = started
# 2 = completed
#
# @internal
#declare score_holder $pregen_status
scoreboard players add $pregen_status bingo.state 0
#>
# Whether the lobby is already generated.
#
# Currently, the lobby only generates once to avoid bugs. This will change in
# the future though.
#
# @internal
#declare score_holder $lobby_generated
scoreboard players add $lobby_generated bingo.state 0


#>
# This objective stores the page of a paginated tellraw a player is currently
# at.
#
# This is used for the player configurations menu. It is impossible to display
# an arbitary amount of configurations due to some limitations with text
# components.
#
# Thus, we use an arbitary amount of pages with a fixed amount of entries
# instead.
#
# This scoreboard holds the page any specific player currently sees.
#
# @internal
scoreboard objectives add bingo.menu_page dummy

#>
# Trigger objective for returning to the lobby.
#
# @internal
# @user
scoreboard objectives add bingo.lobby trigger

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
#>
# Whether pregen should automatically start after generating a new card.
#
# @internal
#declare score_holder $automatically_pregen
scoreboard players add $automatically_pregen bingo.settings 0

#>
# This objective holds the position preference of where a player's card should
# be displayed.
#
# @internal
scoreboard objectives add bingo.card_pos trigger

#>
# Trigger objective used to handle changes / clicks in the preferences menu.
#
# @internal
scoreboard objectives add bingo.pref trigger

#>
# Trigger objective used in the player configuration dialogs.
#
# @internal
scoreboard objectives add bingo.player_con trigger

#>
# The current game seed
#
# Stored in bingo.state
#
# @internal
#declare score_holder $seed
#>
# @internal
#declare score_holder -2
scoreboard players set -2 bingo.const -2
#>
# @internal
#declare score_holder -1
scoreboard players set -1 bingo.const -1
#>
# @internal
#declare score_holder 2
scoreboard players set 2 bingo.const 2
#>
# @internal
#declare score_holder 3
scoreboard players set 3 bingo.const 3
#>
# @internal
#declare score_holder 4
scoreboard players set 4 bingo.const 4
#>
# @internal
#declare score_holder 5
scoreboard players set 5 bingo.const 5
#>
# @internal
#declare score_holder 6
scoreboard players set 6 bingo.const 6
#>
# @internal
#declare score_holder 7
scoreboard players set 7 bingo.const 7
#>
# @internal
#declare score_holder 9
scoreboard players set 9 bingo.const 9
#>
# @internal
#declare score_holder 10
scoreboard players set 10 bingo.const 10
#>
# @internal
#declare score_holder 16
scoreboard players set 16 bingo.const 16
#>
# @internal
#declare score_holder 35
scoreboard players set 35 bingo.const 35
#>
# @internal
#declare score_holder 41
scoreboard players set 41 bingo.const 41
#>
# @internal
#declare score_holder 65536
scoreboard players set 65536 bingo.const 65536

#>
# It is impossible to add this to a score, because Mojang thought you shouldn't
# Add a negative score using scoreboard players add, and max int is 2147483647,
# so you can't use remove either in this case.
#
# Why even differentiate between add and remove? Literally makes no sense at all
#
# @internal
#declare score_holder -2147483648
scoreboard players set -2147483648 bingo.const -2147483648
#endregion

bossbar add bingo:start/pre_gen/progress {"translate": "bingo.game.start.pre_gen_progress"}
bossbar set bingo:start/pre_gen/progress color red
bossbar set bingo:start/pre_gen/progress visible false

gamerule commandBlockOutput false
gamerule doWeatherCycle false
gamerule doInsomnia false
gamerule doTraderSpawning false
gamerule disableElytraMovementCheck true
gamerule doPatrolSpawning false
difficulty easy
function bingo:actionbar_display/display_card_schedule
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

# register items
data remove storage bingo:items categories
data remove storage bingo:items registry
function #bingo:fill_registries

#>
# Function tag for doing actions after the item registration, but before the
# items are duplicated into the categories array.
#
# You may use this function tag for modifing existing items from the default
# bingo item pool or from other extensio packs.
#
# @api
#declare tag/function bingo:post_registration
function #bingo:post_registration

#>
# @within function bingo:init/*
#declare storage temp:bingo.init

# initialize items
data modify storage temp:bingo.init items set from storage bingo:registries items
data modify storage bingo:items categories set from storage bingo:registries categories
data remove storage bingo:registries categories
data remove storage bingo:registries items
data remove storage bingo:items items

function bingo:init/initialize_items

# spawn strcutures
execute if score $lobby_generated bingo.state matches 0 in bingo:lobby run function bingo:init/setup_lobby
scoreboard players set $lobby_generated bingo.state 1