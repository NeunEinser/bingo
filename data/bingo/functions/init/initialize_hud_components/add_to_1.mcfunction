#> bingo:init/initialize_hud_components/add_to_1
#
# @within function bingo:init/initialize_hud_components/add_defaults

#>
# @private
#declare score_holder $init/hud.slot
execute store result score $init/hud.slot bingo.tmp run data get storage tmp.bingo:init/hud columns[1]
scoreboard players add $init/hud.slot bingo.tmp 6

data modify storage tmp.bingo:init/hud columns[1] append from storage tmp.bingo:init/hud cur

execute store result storage tmp.bingo:init/hud columns[1][-1].slot_id byte 1 run scoreboard players get $init/hud.slot bingo.tmp