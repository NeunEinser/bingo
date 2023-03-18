#> fetchr:preferences/custom_hud/check_component
#
# Checks if the currently selected hud component is enabled or disabled for the
# player.
#
# @within
# 	function fetchr:preferences/custom_hud/select_page
# 	function fetchr:preferences/custom_hud/check_component
# @context entity Player who triggered fetchr.pref
#
# @reads storage io.fetchr:preferences components[-1]
# @input storage tmp.fetchr:preferences/hud playerComponentsCpy
# @output score $preferences/hud.disabled fetchr.tmp

#>
# 1 if the current hud component is disabled, 0 if it is enabled.
#
# @within
# 	function fetchr:preferences/custom_hud/select_page
# 	function fetchr:preferences/custom_hud/check_component
#declare score_holder $preferences/hud.disabled

data modify storage tmp.fetchr:preferences/hud idCheck set from storage io.fetchr:preferences components[-1].id
execute store success score $preferences/hud.disabled fetchr.tmp run data modify storage tmp.fetchr:preferences/hud idCheck set from storage tmp.fetchr:preferences/hud playerComponentsCpy[-1].id

data remove storage tmp.fetchr:preferences/hud playerComponentsCpy[-1]
execute if data storage tmp.fetchr:preferences/hud playerComponentsCpy[0] if score $preferences/hud.disabled fetchr.tmp matches 1 run function fetchr:preferences/custom_hud/check_component