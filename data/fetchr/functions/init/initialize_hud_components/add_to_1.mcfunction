#> fetchr:init/initialize_hud_components/add_to_1
#
# @within function fetchr:init/initialize_hud_components/add_defaults

#>
# @private
#declare score_holder $init/hud.slot
execute store result score $init/hud.slot fetchr.tmp run data get storage tmp.fetchr:init/hud columns[1]
scoreboard players add $init/hud.slot fetchr.tmp 6

data modify storage tmp.fetchr:init/hud columns[1] append from storage tmp.fetchr:init/hud cur

execute store result storage tmp.fetchr:init/hud columns[1][-1].slot_id byte 1 run scoreboard players get $init/hud.slot fetchr.tmp