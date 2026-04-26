#> fetchr:preferences/custom_hud/component_settings/only_show_seed_after_completion
#
# This makes the Fetchr seed always show
#
# @within function fetchr:preferences/custom_hud/show


data \
	modify \
		storage fetchr:custom_hud \
		current_player.components[{ id: "fetchr:seed" }].custom.fetchr.only_show_after_run \
	set value true

scoreboard players set @s fetchr.update_hud 1
scoreboard players set $preferences.next_page fetchr.tmp 74