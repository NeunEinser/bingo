#> bingo:init/initialize_hud_components/add_unpreferred
#
# @within function bingo:init/initialize_hud_components/add_defaults

#>
# @private
#declare score_holder $init/hud.line

data modify storage tmp.bingo:init/hud unpreferred append from storage tmp.bingo:init/hud cur
data remove storage tmp.bingo:init/hud unpreferred[-1].preferredColumn
data remove storage tmp.bingo:init/hud unpreferred[-1].addByDefault