#> bingo:init/initialize_hud_components/fill_default_col0
#
# @within
# 	function bingo:init/init
# 	function bingo:init/initialize_hud_components/fill_default_col0

#>
# @private
#declare score_holder $init/hud.line
execute store result score $init/hud.line bingo.tmp run data get storage bingo:custom_hud default
scoreboard players add $init/hud.line bingo.tmp 5

data modify storage bingo:custom_hud default append from storage tmp.bingo:init/hud whereSpace[0]
# Space 91 is coincidentally, this is the actual space availble per column
execute unless data storage tmp.bingo:init/hud whereSpace[0] run data modify storage bingo:custom_hud default append value {id: "bingo:empty", padding: '{"translate": "space.91"}'}
data remove storage tmp.bingo:init/hud whereSpace[0]

execute store result storage bingo:custom_hud default[-1].line byte 1 run scoreboard players get $init/hud.line bingo.tmp

execute unless data storage bingo:custom_hud default[4] run function bingo:init/initialize_hud_components/fill_default_col0