#> fetchr:preferences/show
#
# Shows the preferences page the player just selected.
#
# @within function fetchr:lobby/player_tick
# @context entity Player who triggered fetchr.pref
# @user
# @reads storage fetchr:registries preferences.custom_hud.main

#>
# This storage contains the menuOptions nbt, which can be modified in functions
# referenced in #fetchr:preferences/* function tags to set disabled and hidden
# attributes on specific entries.
#
# @api
#declare storage io.fetchr:preferences
#>
# @within fetchr:preferences/**
#declare storage tmp.fetchr:preferences

#>
# Used to tag a player if the enable gamemode switch tag was added this tick
#
# @private
#declare tag fetchr.pref.added

tag @s[scores={fetchr.pref=2}, tag=!fetchr.enable_manual_gamemode_switch] add fetchr.pref.added
tag @s[scores={fetchr.pref=2}, tag=!fetchr.enable_manual_gamemode_switch] add fetchr.enable_manual_gamemode_switch
tag @s[scores={fetchr.pref=2}, tag=fetchr.enable_manual_gamemode_switch, tag=!fetchr.pref.added] remove fetchr.enable_manual_gamemode_switch
tag @s remove fetchr.pref.added

execute if score @s fetchr.pref matches 1..2 run data modify storage io.fetchr:preferences menuOptions set from storage fetchr:registries preferences.main
execute if score @s fetchr.pref matches 1..2 run function #fetchr:preferences/main
execute if score @s fetchr.pref matches 1..2 run tellraw @s ["\n\n\n\n\n=== ", {"translate": "fetchr.preferences.title", "bold": true, "color": "green"}, " ===\n\n", {"translate": "fetchr.preferences.description", "color": "gray"}, "\n"]

execute if score @s fetchr.pref matches 5..78 run function fetchr:preferences/custom_hud/show

execute if score @s fetchr.pref matches 1..5 run function fetchr:preferences/print_menu_items
execute if score @s fetchr.pref matches 11 run function fetchr:preferences/print_menu_items
scoreboard players reset @s fetchr.pref

#>
# In case an action happened and in the next tick a different page should be
# shown, this score is set.
#
# @within function fetchr:preferences/**
#declare score_holder $preferences.next_page
execute if score $preferences.next_page fetchr.tmp matches -2147483648.. run scoreboard players operation @s fetchr.pref = $preferences.next_page fetchr.tmp
scoreboard players reset $preferences.next_page fetchr.tmp