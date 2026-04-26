#> fetchr:preferences/custom_hud/add_disabled/partition_0
#
# Gets the component that is to be added to a column for elements 0 to 2
#
# @within function fetchr:preferences/custom_hud/add_disabled/exec
# @context entity Player who triggered fetchr.pref
#
# @reads score @s fetchr.pref
# @output tmp.fetchr:preferences/hud to_be_added

execute if score @s fetchr.pref matches 12..13 run data modify storage tmp.fetchr:preferences/hud to_be_added set from storage tmp.fetchr:preferences/hud page_elements[0]
execute if score @s fetchr.pref matches 14..15 run data modify storage tmp.fetchr:preferences/hud to_be_added set from storage tmp.fetchr:preferences/hud page_elements[1]
execute if score @s fetchr.pref matches 16..17 run data modify storage tmp.fetchr:preferences/hud to_be_added set from storage tmp.fetchr:preferences/hud page_elements[2]