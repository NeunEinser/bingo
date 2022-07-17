#> fetchr:tick/clean_up
#
# This function cleans up some temporary data every 5 minutes.
#
# This prevents the tmp and io scoreboards from being filled with too much
# garbage over time
#
# @within
# 	function fetchr:init/init
# 	function fetchr:tick/clean_up

scoreboard players reset * fetchr.tmp
scoreboard players reset * fetchr.io
schedule function fetchr:tick/clean_up 300s