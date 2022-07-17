#> fetchr:preferences/custom_hud/select_page
#
# Gets the page of disabled hud components the player has currently selected
#
# @within
# 	function fetchr:preferences/custom_hud/show_disabled
# 	function fetchr:preferences/custom_hud/add_disabled/exec
# 	function fetchr:preferences/custom_hud/select_page
# @context entity Player who triggered fetchr.pref
#
# @input storage io.fetchr:preferences components
# @output storage tmp.fetchr:preferences/hud pageElements
#
# @reads
#	score @s fetchr.menu_page
# 	storage tmp.fetchr:preferences/hud playerComponents
# @writes score $preferences/hud.page fetchr.tmp

#>
# @within
# 	function fetchr:preferences/custom_hud/show_disabled
# 	function fetchr:preferences/custom_hud/add_disabled/*
# 	function fetchr:preferences/custom_hud/select_page
#declare score_holder $preferences/hud.element
#>
# @within
# 	function fetchr:preferences/custom_hud/show_disabled
# 	function fetchr:preferences/custom_hud/add_disabled/*
# 	function fetchr:preferences/custom_hud/select_page
#declare score_holder $preferences/hud.page

data modify storage tmp.fetchr:preferences/hud playerComponentsCpy set from storage tmp.fetchr:preferences/hud playerComponents
function fetchr:preferences/custom_hud/check_component

execute if score $preferences/hud.disabled fetchr.tmp matches 1 if score $preferences/hud.page fetchr.tmp = @s fetchr.menu_page run data modify storage tmp.fetchr:preferences/hud pageElements append from storage io.fetchr:preferences components[-1]
data remove storage io.fetchr:preferences components[-1]

execute if score $preferences/hud.disabled fetchr.tmp matches 1 run scoreboard players add $preferences/hud.element fetchr.tmp 1
execute if score $preferences/hud.element fetchr.tmp matches 10 run scoreboard players add $preferences/hud.page fetchr.tmp 1
scoreboard players operation $preferences/hud.element fetchr.tmp %= 10 fetchr.const

execute if score $preferences/hud.page fetchr.tmp <= @s fetchr.menu_page if data storage io.fetchr:preferences components[-1] run function fetchr:preferences/custom_hud/select_page