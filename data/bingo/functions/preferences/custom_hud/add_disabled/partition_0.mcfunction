#> bingo:preferences/custom_hud/add_disabled/partition_0
#
# Gets the component that is to be added to a column for elements 0 to 2
#
# @within function bingo:preferences/custom_hud/add_disabled/exec
# @context entity Player who triggered bingo.pref
#
# @reads score @s bingo.pref
# @output tmp.bingo:preferences/hud toBeAdded

execute if score @s bingo.pref matches 12..13 run data modify storage tmp.bingo:preferences/hud toBeAdded set from storage tmp.bingo:preferences/hud pageElements[0]
execute if score @s bingo.pref matches 14..15 run data modify storage tmp.bingo:preferences/hud toBeAdded set from storage tmp.bingo:preferences/hud pageElements[1]
execute if score @s bingo.pref matches 16..17 run data modify storage tmp.bingo:preferences/hud toBeAdded set from storage tmp.bingo:preferences/hud pageElements[2]