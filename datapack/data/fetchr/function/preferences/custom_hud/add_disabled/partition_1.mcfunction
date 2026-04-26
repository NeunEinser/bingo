#> fetchr:preferences/custom_hud/add_disabled/partition_1
#
# Gets the component that is to be added to a column for elements 3 to 5
#
# @within function fetchr:preferences/custom_hud/add_disabled/exec
# @context entity Player who triggered fetchr.pref
#
# @reads score @s fetchr.pref
# @output tmp.fetchr:preferences/hud to_be_added


execute if score @s fetchr.pref matches 18..19 run data modify storage tmp.fetchr:preferences/hud to_be_added set from storage tmp.fetchr:preferences/hud page_elements[3]
execute if score @s fetchr.pref matches 20..21 run data modify storage tmp.fetchr:preferences/hud to_be_added set from storage tmp.fetchr:preferences/hud page_elements[4]
execute if score @s fetchr.pref matches 22..23 run data modify storage tmp.fetchr:preferences/hud to_be_added set from storage tmp.fetchr:preferences/hud page_elements[5]