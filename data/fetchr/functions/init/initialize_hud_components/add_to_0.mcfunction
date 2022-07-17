#> fetchr:init/initialize_hud_components/add_to_0
#
# @within function fetchr:init/initialize_hud_components/add_defaults

#>
# @private
#declare score_holder $init/hud.slot
execute store result score $init/hud.slot fetchr.tmp run data get storage tmp.fetchr:init/hud columns[0]

data modify storage tmp.fetchr:init/hud columns[0] append from storage tmp.fetchr:init/hud cur

execute store result storage tmp.fetchr:init/hud columns[0][-1].slot_id byte 1 run scoreboard players get $init/hud.slot fetchr.tmp