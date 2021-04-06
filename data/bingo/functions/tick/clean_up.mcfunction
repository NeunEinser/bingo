#> bingo:tick/clean_up
#
# This function cleans up some temporary data every 5 minutes.
#
# This prevents the tmp scoreboarb from being filled with too much garbage over
# time
#
# @within
# 	function bingo:init/init
# 	function bingo:tick/clean_up

#>
# @private
#declare score_holder $clean_up

scoreboard players set $clean_up bingo.debug_scdl 0

scoreboard players reset * bingo.tmp
schedule function bingo:tick/clean_up 300s

scoreboard players set $clean_up bingo.debug_scdl 1