#> bingo:preferences/custom_hud/check_component
#
# Checks if the currently selected hud component is enabled or disabled for the
# player.
#
# @within
# 	function bingo:preferences/custom_hud/select_page
# 	function bingo:preferences/custom_hud/check_component
# @context entity Player who triggered bingo.pref
#
# @reads storage io.bingo:preferences components[-1]
# @input storage tmp.bingo:preferences/hud playerComponentsCpy
# @output score $preferences/hud.disabled bingo.tmp

#>
# 1 if the current hud component is disabled, 0 if it is enabled.
#
# @within
# 	function bingo:preferences/custom_hud/select_page
# 	function bingo:preferences/custom_hud/check_component
#declare score_holder $preferences/hud.disabled

data modify storage tmp.bingo:preferences/hud idCheck set from storage io.bingo:preferences components[-1].id
execute store success score $preferences/hud.disabled bingo.tmp run data modify storage tmp.bingo:preferences/hud idCheck set from storage tmp.bingo:preferences/hud playerComponentsCpy[-1].id

data remove storage tmp.bingo:preferences/hud playerComponentsCpy[-1]
execute if data storage tmp.bingo:preferences/hud playerComponentsCpy[0] if score $preferences/hud.disabled bingo.tmp matches 1 run function bingo:preferences/custom_hud/check_component