#> fetchr:init/update_hud/iter_players
#
# Iterates over all players and updates their hud
#
# @within function fetchr:init/init

scoreboard players set $init/hud.all_above_empty fetchr.tmp 1
function fetchr:init/update_hud/update_component \
	with storage tmp.fetchr:init/hud players[-1].components[10]
execute \
	unless data storage tmp.fetchr:init/hud players[-1].components[10] \
	run data modify storage tmp.fetchr:init/hud players[-1].components append value {id:"fetchr:empty",slot_id:10b}

function fetchr:init/update_hud/update_component \
	with storage tmp.fetchr:init/hud players[-1].components[9]
execute \
	unless data storage tmp.fetchr:init/hud players[-1].components[10] \
	run data modify storage tmp.fetchr:init/hud players[-1].components append value {id:"fetchr:empty",slot_id:10b}

function fetchr:init/update_hud/update_component \
	with storage tmp.fetchr:init/hud players[-1].components[8]
execute \
	unless data storage tmp.fetchr:init/hud players[-1].components[10] \
	run data modify storage tmp.fetchr:init/hud players[-1].components append value {id:"fetchr:empty",slot_id:10b}

function fetchr:init/update_hud/update_component \
	with storage tmp.fetchr:init/hud players[-1].components[7]
execute \
	unless data storage tmp.fetchr:init/hud players[-1].components[10] \
	run data modify storage tmp.fetchr:init/hud players[-1].components append value {id:"fetchr:empty",slot_id:10b}

function fetchr:init/update_hud/update_component \
	with storage tmp.fetchr:init/hud players[-1].components[6]
execute \
	unless data storage tmp.fetchr:init/hud players[-1].components[10] \
	run data modify storage tmp.fetchr:init/hud players[-1].components append value {id:"fetchr:empty",slot_id:10b}

function fetchr:init/update_hud/update_component \
	with storage tmp.fetchr:init/hud players[-1].components[5]
execute \
	unless data storage tmp.fetchr:init/hud players[-1].components[10] \
	run data modify storage tmp.fetchr:init/hud players[-1].components append value {id:"fetchr:empty",slot_id:10b}

scoreboard players set $init/hud.all_above_empty fetchr.tmp 1
function fetchr:init/update_hud/update_component \
	with storage tmp.fetchr:init/hud players[-1].components[4]
execute \
	unless data storage tmp.fetchr:init/hud players[-1].components[10] \
	run data modify storage tmp.fetchr:init/hud players[-1].components insert 4 value {id:"fetchr:empty",slot_id:4b}

function fetchr:init/update_hud/update_component \
	with storage tmp.fetchr:init/hud players[-1].components[3]
execute \
	unless data storage tmp.fetchr:init/hud players[-1].components[10] \
	run data modify storage tmp.fetchr:init/hud players[-1].components insert 4 value {id:"fetchr:empty",slot_id:4b}

function fetchr:init/update_hud/update_component \
	with storage tmp.fetchr:init/hud players[-1].components[2]
execute \
	unless data storage tmp.fetchr:init/hud players[-1].components[10] \
	run data modify storage tmp.fetchr:init/hud players[-1].components insert 4 value {id:"fetchr:empty",slot_id:4b}

function fetchr:init/update_hud/update_component \
	with storage tmp.fetchr:init/hud players[-1].components[1]
execute \
	unless data storage tmp.fetchr:init/hud players[-1].components[10] \
	run data modify storage tmp.fetchr:init/hud players[-1].components insert 4 value {id:"fetchr:empty",slot_id:4b}

function fetchr:init/update_hud/update_component \
	with storage tmp.fetchr:init/hud players[-1].components[0]
execute \
	unless data storage tmp.fetchr:init/hud players[-1].components[10] \
	run data modify storage tmp.fetchr:init/hud players[-1].components insert 4 value {id:"fetchr:empty",slot_id:4b}

data modify storage tmp.fetchr:init/hud players[-1].components[0].slot_id set value 0b
data modify storage tmp.fetchr:init/hud players[-1].components[1].slot_id set value 1b
data modify storage tmp.fetchr:init/hud players[-1].components[2].slot_id set value 2b
data modify storage tmp.fetchr:init/hud players[-1].components[3].slot_id set value 3b
data modify storage tmp.fetchr:init/hud players[-1].components[5].slot_id set value 5b
data modify storage tmp.fetchr:init/hud players[-1].components[6].slot_id set value 6b
data modify storage tmp.fetchr:init/hud players[-1].components[7].slot_id set value 7b
data modify storage tmp.fetchr:init/hud players[-1].components[8].slot_id set value 8b
data modify storage tmp.fetchr:init/hud players[-1].components[9].slot_id set value 9b

data \
	modify storage fetchr:custom_hud players \
	append from storage tmp.fetchr:init/hud players[-1]
data remove storage tmp.fetchr:init/hud players[-1]

execute \
	if data storage tmp.fetchr:init/hud players[0] \
	run function fetchr:init/update_hud/iter_players