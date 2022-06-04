#> bingo:preferences/custom_hud/select_page
#
# Gets the page of disabled hud components the player has currently selected
#
# @within
# 	function bingo:preferences/custom_hud/show_disabled
# 	function bingo:preferences/custom_hud/add_disabled/exec
# 	function bingo:preferences/custom_hud/select_page
# @context entity Player who triggered bingo.pref
#
# @input storage io.bingo:preferences components
# @output storage tmp.bingo:preferences/hud pageElements
#
# @reads
#	score @s bingo.menu_page
# 	storage tmp.bingo:preferences/hud playerComponents
# @writes score $preferences/hud.page bingo.tmp

#>
# @within
# 	function bingo:preferences/custom_hud/show_disabled
# 	function bingo:preferences/custom_hud/add_disabled/*
# 	function bingo:preferences/custom_hud/select_page
#declare score_holder $preferences/hud.element
#>
# @within
# 	function bingo:preferences/custom_hud/show_disabled
# 	function bingo:preferences/custom_hud/add_disabled/*
# 	function bingo:preferences/custom_hud/select_page
#declare score_holder $preferences/hud.page

data modify storage tmp.bingo:preferences/hud playerComponentsCpy set from storage tmp.bingo:preferences/hud playerComponents
function bingo:preferences/custom_hud/check_component

execute if score $preferences/hud.disabled bingo.tmp matches 1 if score $preferences/hud.page bingo.tmp = @s bingo.menu_page run data modify storage tmp.bingo:preferences/hud pageElements append from storage io.bingo:preferences components[-1]
data remove storage io.bingo:preferences components[-1]

execute if score $preferences/hud.disabled bingo.tmp matches 1 run scoreboard players add $preferences/hud.element bingo.tmp 1
execute if score $preferences/hud.element bingo.tmp matches 10 run scoreboard players add $preferences/hud.page bingo.tmp 1
scoreboard players operation $preferences/hud.element bingo.tmp %= 10 bingo.const

execute if score $preferences/hud.page bingo.tmp <= @s bingo.menu_page if data storage io.bingo:preferences components[-1] run function bingo:preferences/custom_hud/select_page