#> bingo:game/start/get_completed_background_template
#
# Finds the correct background template for the current number of active teams.
#
# @within
# 	function bingo:game/start/init_teams
# 	function bingo:game/start/get_completed_background_template
#
# @input
# 	storage tmp.bingo:game/start backgroundTemplates
# 	score $game/start.team_count bingo.tmp
# @output storage tmp.bingo:game/start backgroundTemplate

data modify storage tmp.bingo:game/start backgroundTemplate set from storage tmp.bingo:game/start backgroundTemplates[0]
data remove storage tmp.bingo:game/start backgroundTemplates[0]

scoreboard players remove $game/start.team_count bingo.tmp 1
execute if score $game/start.team_count bingo.tmp matches 1.. run function bingo:game/start/get_completed_background_template