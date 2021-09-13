#> bingo:init/initialize_hud_components/add_where_space
#
# @within function bingo:init/initialize_hud_components/add_defaults

#>
# @private
#declare score_holder $init/hud.line

data modify storage temp:bingo.init/hud whereSpace append from storage temp:bingo.init/hud cur
data remove storage temp:bingo.init/hud whereSpace[-1].preferredColumn
data remove storage temp:bingo.init/hud whereSpace[-1].addByDefault