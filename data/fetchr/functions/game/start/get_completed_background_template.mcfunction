#> fetchr:game/start/get_completed_background_template
#
# Finds the correct background template for the current number of active teams.
#
# @within
# 	function fetchr:game/start/init_teams
# 	function fetchr:game/start/get_completed_background_template
#
# @input
# 	storage tmp.fetchr:game/start backgroundTemplates
# 	score $game/start.team_count fetchr.tmp
# @output storage tmp.fetchr:game/start backgroundTemplate

data modify storage tmp.fetchr:game/start backgroundTemplate set from storage tmp.fetchr:game/start backgroundTemplates[0]
data remove storage tmp.fetchr:game/start backgroundTemplates[0]

scoreboard players remove $game/start.team_count fetchr.tmp 1
execute if score $game/start.team_count fetchr.tmp matches 1.. run function fetchr:game/start/get_completed_background_template