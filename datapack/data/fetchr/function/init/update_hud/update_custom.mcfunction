#> fetchr:init/update_hud/update_component
#
# Updates custom data of a component
#
# @within tag/function fetchr:fetchr:update_hud_custom


execute \
	if data storage io.fetchr:custom_hud custom.fetchr.iconType \
	run data \
		modify storage io.fetchr:custom_hud custom.fetchr.icon_type \
		set from storage io.fetchr:custom_hud custom.fetchr.iconType

execute \
	if data storage io.fetchr:custom_hud custom.fetchr.onlyShowAfterRun \
	run data \
		modify storage io.fetchr:custom_hud custom.fetchr.only_show_after_run \
		set from storage io.fetchr:custom_hud custom.fetchr.onlyShowAfterRun