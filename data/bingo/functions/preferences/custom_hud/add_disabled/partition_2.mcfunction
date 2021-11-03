#> bingo:preferences/custom_hud/add_disabled/partition_2
#
# Gets the component that is to be added to a column for elements 6 to 9
#
# @within function bingo:preferences/custom_hud/add_disabled/exec
# @context entity Player who triggered bingo.pref
#
# @reads score @s bingo.pref
# @output tmp.bingo:preferences/hud toBeAdded


execute if score @s bingo.pref matches 24..25 run data modify storage tmp.bingo:preferences/hud toBeAdded set from storage tmp.bingo:preferences/hud pageElements[6]
execute if score @s bingo.pref matches 26..27 run data modify storage tmp.bingo:preferences/hud toBeAdded set from storage tmp.bingo:preferences/hud pageElements[7]
execute if score @s bingo.pref matches 28..29 run data modify storage tmp.bingo:preferences/hud toBeAdded set from storage tmp.bingo:preferences/hud pageElements[8]
execute if score @s bingo.pref matches 30..31 run data modify storage tmp.bingo:preferences/hud toBeAdded set from storage tmp.bingo:preferences/hud pageElements[9]