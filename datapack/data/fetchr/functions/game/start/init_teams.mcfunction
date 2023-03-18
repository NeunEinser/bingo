#> fetchr:game/start/init_teams
#
# Sets teams up for playing and skybox
#
# @within function fetchr:game/start/create_skybox/spawn_players
# @context location fetchr:lobby

# Make teammates fully invisible in the skybox
team modify fetchr.aqua seeFriendlyInvisibles false
team modify fetchr.black seeFriendlyInvisibles false
team modify fetchr.blue seeFriendlyInvisibles false
team modify fetchr.dark_aqua seeFriendlyInvisibles false
team modify fetchr.dark_blue seeFriendlyInvisibles false
team modify fetchr.dark_gray seeFriendlyInvisibles false
team modify fetchr.dark_green seeFriendlyInvisibles false
team modify fetchr.dark_purple seeFriendlyInvisibles false
team modify fetchr.dark_red seeFriendlyInvisibles false
team modify fetchr.gold seeFriendlyInvisibles false
team modify fetchr.gray seeFriendlyInvisibles false
team modify fetchr.green seeFriendlyInvisibles false
team modify fetchr.light_purple seeFriendlyInvisibles false
team modify fetchr.red seeFriendlyInvisibles false
team modify fetchr.white seeFriendlyInvisibles false
team modify fetchr.yellow seeFriendlyInvisibles false

scoreboard players set $team_count fetchr.state 0

execute if entity @a[team=fetchr.dark_red,limit=1] run data modify storage fetchr:card teams[{id: "fetchr:dark_red"}].backgroundIndex set value 0b
execute if entity @a[team=fetchr.dark_red,limit=1] run scoreboard players add $team_count fetchr.state 1

execute if entity @a[team=fetchr.red,limit=1] store result storage fetchr:card teams[{id: "fetchr:red"}].backgroundIndex byte 1 run scoreboard players get $team_count fetchr.state
execute if entity @a[team=fetchr.red,limit=1] run scoreboard players add $team_count fetchr.state 1

execute if entity @a[team=fetchr.gold,limit=1] store result storage fetchr:card teams[{id: "fetchr:gold"}].backgroundIndex byte 1 run scoreboard players get $team_count fetchr.state
execute if entity @a[team=fetchr.gold,limit=1] run scoreboard players add $team_count fetchr.state 1

execute if entity @a[team=fetchr.yellow,limit=1] store result storage fetchr:card teams[{id: "fetchr:yellow"}].backgroundIndex byte 1 run scoreboard players get $team_count fetchr.state
execute if entity @a[team=fetchr.yellow,limit=1] run scoreboard players add $team_count fetchr.state 1

execute if entity @a[team=fetchr.green,limit=1] store result storage fetchr:card teams[{id: "fetchr:green"}].backgroundIndex byte 1 run scoreboard players get $team_count fetchr.state
execute if entity @a[team=fetchr.green,limit=1] run scoreboard players add $team_count fetchr.state 1

execute if entity @a[team=fetchr.dark_green,limit=1] store result storage fetchr:card teams[{id: "fetchr:dark_green"}].backgroundIndex byte 1 run scoreboard players get $team_count fetchr.state
execute if entity @a[team=fetchr.dark_green,limit=1] run scoreboard players add $team_count fetchr.state 1

execute if entity @a[team=fetchr.dark_aqua,limit=1] store result storage fetchr:card teams[{id: "fetchr:dark_aqua"}].backgroundIndex byte 1 run scoreboard players get $team_count fetchr.state
execute if entity @a[team=fetchr.dark_aqua,limit=1] run scoreboard players add $team_count fetchr.state 1

execute if entity @a[team=fetchr.aqua,limit=1] store result storage fetchr:card teams[{id: "fetchr:aqua"}].backgroundIndex byte 1 run scoreboard players get $team_count fetchr.state
execute if entity @a[team=fetchr.aqua,limit=1] run scoreboard players add $team_count fetchr.state 1

execute if entity @a[team=fetchr.blue,limit=1] store result storage fetchr:card teams[{id: "fetchr:blue"}].backgroundIndex byte 1 run scoreboard players get $team_count fetchr.state
execute if entity @a[team=fetchr.blue,limit=1] run scoreboard players add $team_count fetchr.state 1

execute if entity @a[team=fetchr.dark_blue,limit=1] store result storage fetchr:card teams[{id: "fetchr:dark_blue"}].backgroundIndex byte 1 run scoreboard players get $team_count fetchr.state
execute if entity @a[team=fetchr.dark_blue,limit=1] run scoreboard players add $team_count fetchr.state 1

execute if entity @a[team=fetchr.dark_purple,limit=1] store result storage fetchr:card teams[{id: "fetchr:dark_purple"}].backgroundIndex byte 1 run scoreboard players get $team_count fetchr.state
execute if entity @a[team=fetchr.dark_purple,limit=1] run scoreboard players add $team_count fetchr.state 1

execute if entity @a[team=fetchr.light_purple,limit=1] store result storage fetchr:card teams[{id: "fetchr:light_purple"}].backgroundIndex byte 1 run scoreboard players get $team_count fetchr.state
execute if entity @a[team=fetchr.light_purple,limit=1] run scoreboard players add $team_count fetchr.state 1

execute if entity @a[team=fetchr.white,limit=1] store result storage fetchr:card teams[{id: "fetchr:white"}].backgroundIndex byte 1 run scoreboard players get $team_count fetchr.state
execute if entity @a[team=fetchr.white,limit=1] run scoreboard players add $team_count fetchr.state 1

execute if entity @a[team=fetchr.gray,limit=1] store result storage fetchr:card teams[{id: "fetchr:gray"}].backgroundIndex byte 1 run scoreboard players get $team_count fetchr.state
execute if entity @a[team=fetchr.gray,limit=1] run scoreboard players add $team_count fetchr.state 1

execute if entity @a[team=fetchr.dark_gray,limit=1] store result storage fetchr:card teams[{id: "fetchr:dark_gray"}].backgroundIndex byte 1 run scoreboard players get $team_count fetchr.state
execute if entity @a[team=fetchr.dark_gray,limit=1] run scoreboard players add $team_count fetchr.state 1

execute if entity @a[team=fetchr.black,limit=1] store result storage fetchr:card teams[{id: "fetchr:black"}].backgroundIndex byte 1 run scoreboard players get $team_count fetchr.state
execute if entity @a[team=fetchr.black,limit=1] run scoreboard players add $team_count fetchr.state 1

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

data modify storage tmp.fetchr:game/start defaultBackground set value []

execute if entity @a[team=fetchr.dark_red,limit=1] run function fetchr:game/start/init_teams/dark_red
execute if entity @a[team=fetchr.red,limit=1] run function fetchr:game/start/init_teams/red
execute if entity @a[team=fetchr.gold,limit=1] run function fetchr:game/start/init_teams/gold
execute if entity @a[team=fetchr.yellow,limit=1] run function fetchr:game/start/init_teams/yellow
execute if entity @a[team=fetchr.green,limit=1] run function fetchr:game/start/init_teams/green
execute if entity @a[team=fetchr.dark_green,limit=1] run function fetchr:game/start/init_teams/dark_green
execute if entity @a[team=fetchr.dark_aqua,limit=1] run function fetchr:game/start/init_teams/dark_aqua
execute if entity @a[team=fetchr.aqua,limit=1] run function fetchr:game/start/init_teams/aqua
execute if entity @a[team=fetchr.blue,limit=1] run function fetchr:game/start/init_teams/blue
execute if entity @a[team=fetchr.dark_blue,limit=1] run function fetchr:game/start/init_teams/dark_blue
execute if entity @a[team=fetchr.dark_purple,limit=1] run function fetchr:game/start/init_teams/dark_purple
execute if entity @a[team=fetchr.light_purple,limit=1] run function fetchr:game/start/init_teams/light_purple
execute if entity @a[team=fetchr.white,limit=1] run function fetchr:game/start/init_teams/white
execute if entity @a[team=fetchr.gray,limit=1] run function fetchr:game/start/init_teams/gray
execute if entity @a[team=fetchr.dark_gray,limit=1] run function fetchr:game/start/init_teams/dark_gray
execute if entity @a[team=fetchr.black,limit=1] run function fetchr:game/start/init_teams/black

data modify storage fetchr:card slots[].background set from storage tmp.fetchr:game/start defaultBackground