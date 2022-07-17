#> fetchr:init/initialize_hud_components/fill_default_col0
#
# @within
# 	function fetchr:init/init
# 	function fetchr:init/initialize_hud_components/fill_default_col0

#>
# @private
#declare score_holder $init/hud.slot
execute store result score $init/hud.slot fetchr.tmp run data get storage fetchr:custom_hud default

data modify storage fetchr:custom_hud default append from storage tmp.fetchr:init/hud whereSpace[0]
# Space 91 is coincidentally, this is the actual space availble per column
execute unless data storage tmp.fetchr:init/hud whereSpace[0] run data modify storage fetchr:custom_hud default append value {id: "fetchr:empty", padding: '{"translate": "space.91"}'}
data remove storage tmp.fetchr:init/hud whereSpace[0]

execute store result storage fetchr:custom_hud default[-1].slot_id byte 1 run scoreboard players get $init/hud.slot fetchr.tmp

execute unless data storage fetchr:custom_hud default[4] run function fetchr:init/initialize_hud_components/fill_default_col0