#> fetchr:preferences/custom_hud/add_disabled/partition_2
#
# Gets the component that is to be added to a column for elements 6 to 9
#
# @within function fetchr:preferences/custom_hud/add_disabled/exec
# @context entity Player who triggered fetchr.pref
#
# @reads score @s fetchr.pref
# @output tmp.fetchr:preferences/hud to_be_added


execute if score @s fetchr.pref matches 24..25 run data modify storage tmp.fetchr:preferences/hud to_be_added set from storage tmp.fetchr:preferences/hud page_elements[6]
execute if score @s fetchr.pref matches 26..27 run data modify storage tmp.fetchr:preferences/hud to_be_added set from storage tmp.fetchr:preferences/hud page_elements[7]
execute if score @s fetchr.pref matches 28..29 run data modify storage tmp.fetchr:preferences/hud to_be_added set from storage tmp.fetchr:preferences/hud page_elements[8]
execute if score @s fetchr.pref matches 30..31 run data modify storage tmp.fetchr:preferences/hud to_be_added set from storage tmp.fetchr:preferences/hud page_elements[9]