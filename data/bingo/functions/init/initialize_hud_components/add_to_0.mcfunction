#> bingo:init/initialize_hud_components/add_to_0
#
# @within function bingo:init/initialize_hud_components/add_defaults

#>
# @private
#declare score_holder $init/hud.slot
execute store result score $init/hud.slot bingo.tmp run data get storage tmp.bingo:init/hud columns[0]

data modify storage tmp.bingo:init/hud columns[0] append from storage tmp.bingo:init/hud cur

execute store result storage tmp.bingo:init/hud columns[0][-1].slot_id byte 1 run scoreboard players get $init/hud.slot bingo.tmp