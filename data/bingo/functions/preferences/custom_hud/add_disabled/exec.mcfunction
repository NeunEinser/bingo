#> bingo:preferences/custom_hud/add_disabled/exec
#
# @within function bingo:preferences/custom_hud/show
# @context entity Player who triggered bingo.pref

scoreboard players set $preferences/hud.page bingo.tmp 0
scoreboard players set $preferences/hud.element bingo.tmp 0
data modify storage io.bingo:preferences components set from storage bingo:custom_hud components
function #bingo:preferences/custom_hud/filter_disabled
data modify storage tmp.bingo:preferences/hud pageElements set value []
data modify storage tmp.bingo:preferences/hud playerComponents set from storage bingo:custom_hud currentPlayer.components
data remove storage tmp.bingo:preferences/hud playerComponents[{id: "bingo:empty"}]
function bingo:preferences/custom_hud/select_page

execute if score @s bingo.pref matches 12..17 run function bingo:preferences/custom_hud/add_disabled/partition_0
execute if score @s bingo.pref matches 18..23 run function bingo:preferences/custom_hud/add_disabled/partition_1
execute if score @s bingo.pref matches 24..31 run function bingo:preferences/custom_hud/add_disabled/partition_2

#>
# @private
#declare score_holder $preferences/hud/add.col
scoreboard players operation $preferences/hud/add.col bingo.tmp = @s bingo.pref
scoreboard players operation $preferences/hud/add.col bingo.tmp %= 2 bingo.const

execute if score $preferences/hud/add.col bingo.tmp matches 0 run function bingo:preferences/custom_hud/add_to_col0
execute if score $preferences/hud/add.col bingo.tmp matches 1 run function bingo:preferences/custom_hud/add_to_col1

execute unless data storage tmp.bingo:preferences/hud pageElements[1] run scoreboard players remove @s bingo.menu_page 1

scoreboard players set $preferences.next_page bingo.tmp 5
execute if score @s bingo.menu_page matches 0.. run scoreboard players set $preferences.next_page bingo.tmp 6