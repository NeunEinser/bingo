#> fetchr:init/update_lobby/check
#
# Checks if the lobby needs to be updated
#
# @within
# 	function fetchr:init/update_lobby/run
# 	function fetchr:init/update_lobby/check

execute \
	store result score $init/lobby/update/check.version fetchr.tmp \
	run data get storage tmp.fetchr:init/structures structures[-1].version
execute \
	store result score $init/lobby/update/check.compare_version fetchr.tmp \
	run data get storage tmp.fetchr:init/structures old_structures[-1].version

execute \
	unless score $init/lobby/update/check.version fetchr.tmp = $init/lobby/update/check.compare_version fetchr.tmp \
	run scoreboard players set $init/lobby/update.should_update fetchr.tmp 1

data \
	modify storage tmp.fetchr:init/structures current_id \
	set from storage tmp.fetchr:init/structures structures[-1].id

execute \
	if score $init/lobby/update.should_update fetchr.tmp matches 0 \
	store success score $init/lobby/update.should_update fetchr.tmp \
	run data \
		modify storage tmp.fetchr:init/structures current_id \
		set from storage tmp.fetchr:init/structures old_structures[-1].id

data remove storage tmp.fetchr:init/structures structures[-1]
data remove storage tmp.fetchr:init/structures old_structures[-1]

execute \
	if score $init/lobby/update.should_update fetchr.tmp matches 0 \
	if data storage tmp.fetchr:init/structures structures[0] \
	run function fetchr:init/update_lobby/check