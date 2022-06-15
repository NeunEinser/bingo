#> bingo:tick/clean_up
#
# This function cleans up some temporary data every 5 minutes.
#
# This prevents the tmp and io scoreboards from being filled with too much
# garbage over time
#
# @within
# 	function bingo:init/init
# 	function bingo:tick/clean_up

scoreboard players reset * bingo.tmp
scoreboard players reset * bingo.io
schedule function bingo:tick/clean_up 300s