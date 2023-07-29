#> fetchr:game/start/init_teams
#
# Sets teams up for playing and skybox
#
# @within function fetchr:game/start/initialize_game_start
# @context location fetchr:lobby

# Make teammates fully invisible in the skybox
team modify fetchr.light_blue seeFriendlyInvisibles false
team modify fetchr.black seeFriendlyInvisibles false
team modify fetchr.blue seeFriendlyInvisibles false
team modify fetchr.cyan seeFriendlyInvisibles false
team modify fetchr.dark_blue seeFriendlyInvisibles false
team modify fetchr.dark_gray seeFriendlyInvisibles false
team modify fetchr.green seeFriendlyInvisibles false
team modify fetchr.purple seeFriendlyInvisibles false
team modify fetchr.dark_red seeFriendlyInvisibles false
team modify fetchr.orange seeFriendlyInvisibles false
team modify fetchr.gray seeFriendlyInvisibles false
team modify fetchr.lime seeFriendlyInvisibles false
team modify fetchr.magenta seeFriendlyInvisibles false
team modify fetchr.red seeFriendlyInvisibles false
team modify fetchr.white seeFriendlyInvisibles false
team modify fetchr.yellow seeFriendlyInvisibles false

scoreboard players set $team_count fetchr.state 0

execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.dark_red,limit=1] run data modify storage fetchr:card teams[{id: "fetchr:dark_red"}].backgroundIndex set value 0b
execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.dark_red,limit=1] run scoreboard players add $team_count fetchr.state 1

execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.red,limit=1] store result storage fetchr:card teams[{id: "fetchr:red"}].backgroundIndex byte 1 run scoreboard players get $team_count fetchr.state
execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.red,limit=1] run scoreboard players add $team_count fetchr.state 1

execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.orange,limit=1] store result storage fetchr:card teams[{id: "fetchr:orange"}].backgroundIndex byte 1 run scoreboard players get $team_count fetchr.state
execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.orange,limit=1] run scoreboard players add $team_count fetchr.state 1

execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.yellow,limit=1] store result storage fetchr:card teams[{id: "fetchr:yellow"}].backgroundIndex byte 1 run scoreboard players get $team_count fetchr.state
execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.yellow,limit=1] run scoreboard players add $team_count fetchr.state 1

execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.lime,limit=1] store result storage fetchr:card teams[{id: "fetchr:lime"}].backgroundIndex byte 1 run scoreboard players get $team_count fetchr.state
execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.lime,limit=1] run scoreboard players add $team_count fetchr.state 1

execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.green,limit=1] store result storage fetchr:card teams[{id: "fetchr:green"}].backgroundIndex byte 1 run scoreboard players get $team_count fetchr.state
execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.green,limit=1] run scoreboard players add $team_count fetchr.state 1

execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.cyan,limit=1] store result storage fetchr:card teams[{id: "fetchr:cyan"}].backgroundIndex byte 1 run scoreboard players get $team_count fetchr.state
execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.cyan,limit=1] run scoreboard players add $team_count fetchr.state 1

execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.light_blue,limit=1] store result storage fetchr:card teams[{id: "fetchr:light_blue"}].backgroundIndex byte 1 run scoreboard players get $team_count fetchr.state
execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.light_blue,limit=1] run scoreboard players add $team_count fetchr.state 1

execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.blue,limit=1] store result storage fetchr:card teams[{id: "fetchr:blue"}].backgroundIndex byte 1 run scoreboard players get $team_count fetchr.state
execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.blue,limit=1] run scoreboard players add $team_count fetchr.state 1

execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.dark_blue,limit=1] store result storage fetchr:card teams[{id: "fetchr:dark_blue"}].backgroundIndex byte 1 run scoreboard players get $team_count fetchr.state
execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.dark_blue,limit=1] run scoreboard players add $team_count fetchr.state 1

execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.purple,limit=1] store result storage fetchr:card teams[{id: "fetchr:purple"}].backgroundIndex byte 1 run scoreboard players get $team_count fetchr.state
execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.purple,limit=1] run scoreboard players add $team_count fetchr.state 1

execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.magenta,limit=1] store result storage fetchr:card teams[{id: "fetchr:magenta"}].backgroundIndex byte 1 run scoreboard players get $team_count fetchr.state
execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.magenta,limit=1] run scoreboard players add $team_count fetchr.state 1

execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.white,limit=1] store result storage fetchr:card teams[{id: "fetchr:white"}].backgroundIndex byte 1 run scoreboard players get $team_count fetchr.state
execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.white,limit=1] run scoreboard players add $team_count fetchr.state 1

execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.gray,limit=1] store result storage fetchr:card teams[{id: "fetchr:gray"}].backgroundIndex byte 1 run scoreboard players get $team_count fetchr.state
execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.gray,limit=1] run scoreboard players add $team_count fetchr.state 1

execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.dark_gray,limit=1] store result storage fetchr:card teams[{id: "fetchr:dark_gray"}].backgroundIndex byte 1 run scoreboard players get $team_count fetchr.state
execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.dark_gray,limit=1] run scoreboard players add $team_count fetchr.state 1

execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.black,limit=1] store result storage fetchr:card teams[{id: "fetchr:black"}].backgroundIndex byte 1 run scoreboard players get $team_count fetchr.state
execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.black,limit=1] run scoreboard players add $team_count fetchr.state 1

#>
# @within function fetchr:game/start/**
#declare storage tmp.fetchr:game/start
data modify storage tmp.fetchr:game/start backgroundTemplates set from storage fetchr:card completedBackgroundTemplates
#>
# @within
# 	function fetchr:game/start/init_teams
# 	function fetchr:game/start/get_completed_background_template
#declare score_holder $game/start.team_count
scoreboard players operation $game/start.team_count fetchr.tmp = $team_count fetchr.state
function fetchr:game/start/get_completed_background_template
execute if score $lockout_mode fetchr.settings matches 1 run data modify storage tmp.fetchr:game/start backgroundTemplate[] set value '"\\uf000"'

data modify storage tmp.fetchr:game/start defaultBackground set value []

execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.dark_red,limit=1] run function fetchr:game/start/init_teams/dark_red
execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.red,limit=1] run function fetchr:game/start/init_teams/red
execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.orange,limit=1] run function fetchr:game/start/init_teams/orange
execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.yellow,limit=1] run function fetchr:game/start/init_teams/yellow
execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.lime,limit=1] run function fetchr:game/start/init_teams/lime
execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.green,limit=1] run function fetchr:game/start/init_teams/green
execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.cyan,limit=1] run function fetchr:game/start/init_teams/cyan
execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.light_blue,limit=1] run function fetchr:game/start/init_teams/light_blue
execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.blue,limit=1] run function fetchr:game/start/init_teams/blue
execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.dark_blue,limit=1] run function fetchr:game/start/init_teams/dark_blue
execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.purple,limit=1] run function fetchr:game/start/init_teams/purple
execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.magenta,limit=1] run function fetchr:game/start/init_teams/magenta
execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.white,limit=1] run function fetchr:game/start/init_teams/white
execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.gray,limit=1] run function fetchr:game/start/init_teams/gray
execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.dark_gray,limit=1] run function fetchr:game/start/init_teams/dark_gray
execute if entity @a[predicate=fetchr:is_in_game, team=fetchr.black,limit=1] run function fetchr:game/start/init_teams/black

execute unless score $lockout_mode fetchr.settings matches 1 run data modify storage fetchr:card slots[].background set from storage tmp.fetchr:game/start defaultBackground