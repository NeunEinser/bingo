#> fetchr:init/update_hud/iter_players
#
# Updates a specific hud component
#
# @within function fetchr:update_hud/iter_players
# @params
# 	id: #[id] string Id of the component
# 	slot_id: byte

$data \
	modify storage tmp.fetchr:init/hud component \
	set from storage tmp.fetchr:init/hud players[-1].components[$(slot_id)]

execute \
	if data storage tmp.fetchr:init/hud component{id: "fetchr:empty"} \
	run return 0

#NEUN_SCRIPT since 69
$execute \
	if data storage tmp.fetchr:init/hud component{id: "fetchr:spacer"} \
	run data \
		modify storage tmp.fetchr:init/hud players[-1].components[$(slot_id)].name \
		set value {translate: "fetchr.custom_hud.components.spacer"}
#NEUN_SCRIPT end

execute \
	if score $init/hud.all_above_empty fetchr.tmp matches 0 \
	if data storage tmp.fetchr:init/hud component{id: "fetchr:spacer"} \
	run return 0

$execute \
	unless data storage fetchr:custom_hud components[{id: "$(id)"}] \
	run return run data remove storage tmp.fetchr:init/hud players[-1].components[$(slot_id)]

scoreboard players set $init/hud.all_above_empty fetchr.tmp 0

data remove storage io.fetchr:custom_hud custom

data \
	modify storage io.fetchr:custom_hud custom \
	set from storage tmp.fetchr:init/hud component.custom
function #fetchr:update_hud_custom

$data \
	modify storage tmp.fetchr:init/hud players[-1].components[$(slot_id)] \
	set from storage fetchr:custom_hud components[{id: "$(id)"}]
$data \
	modify storage tmp.fetchr:init/hud players[-1].components[$(slot_id)].custom \
	set from storage io.fetchr:custom_hud custom