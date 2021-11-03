#> bingo:preferences/custom_hud/add_disabled/partition_1
#
# Gets the component that is to be added to a column for elements 3 to 5
#
# @within function bingo:preferences/custom_hud/add_disabled/exec
# @context entity Player who triggered bingo.pref
#
# @reads score @s bingo.pref
# @output tmp.bingo:preferences/hud toBeAdded


execute if score @s bingo.pref matches 18..19 run data modify storage tmp.bingo:preferences/hud toBeAdded set from storage tmp.bingo:preferences/hud pageElements[3]
execute if score @s bingo.pref matches 20..21 run data modify storage tmp.bingo:preferences/hud toBeAdded set from storage tmp.bingo:preferences/hud pageElements[4]
execute if score @s bingo.pref matches 22..23 run data modify storage tmp.bingo:preferences/hud toBeAdded set from storage tmp.bingo:preferences/hud pageElements[5]