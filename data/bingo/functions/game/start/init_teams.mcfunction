#> bingo:game/start/init_teams
#
# Sets teams up for playing and skybox
#
# @within function bingo:game/start/spawn_skybox
# @context location bingo:lobby

# Make teammates fully invisible in the skybox
team modify bingo.aqua seeFriendlyInvisibles false
team modify bingo.black seeFriendlyInvisibles false
team modify bingo.blue seeFriendlyInvisibles false
team modify bingo.dark_aqua seeFriendlyInvisibles false
team modify bingo.dark_blue seeFriendlyInvisibles false
team modify bingo.dark_gray seeFriendlyInvisibles false
team modify bingo.dark_green seeFriendlyInvisibles false
team modify bingo.dark_purpl seeFriendlyInvisibles false
team modify bingo.dark_red seeFriendlyInvisibles false
team modify bingo.gold seeFriendlyInvisibles false
team modify bingo.gray seeFriendlyInvisibles false
team modify bingo.green seeFriendlyInvisibles false
team modify bingo.light_purp seeFriendlyInvisibles false
team modify bingo.red seeFriendlyInvisibles false
team modify bingo.white seeFriendlyInvisibles false
team modify bingo.yellow seeFriendlyInvisibles false

scoreboard players set $team_count bingo.state 0

execute if entity @a[team=bingo.dark_red,limit=1] run data modify storage bingo:card teams[{id: "bingo:dark_red"}].backgroundIndex set value 0b
execute if entity @a[team=bingo.dark_red,limit=1] run scoreboard players add $team_count bingo.state 1

execute if entity @a[team=bingo.red,limit=1] store result storage bingo:card teams[{id: "bingo:red"}].backgroundIndex byte 1 run scoreboard players get $team_count bingo.state
execute if entity @a[team=bingo.red,limit=1] run scoreboard players add $team_count bingo.state 1

execute if entity @a[team=bingo.gold,limit=1] store result storage bingo:card teams[{id: "bingo:gold"}].backgroundIndex byte 1 run scoreboard players get $team_count bingo.state
execute if entity @a[team=bingo.gold,limit=1] run scoreboard players add $team_count bingo.state 1

execute if entity @a[team=bingo.yellow,limit=1] store result storage bingo:card teams[{id: "bingo:yellow"}].backgroundIndex byte 1 run scoreboard players get $team_count bingo.state
execute if entity @a[team=bingo.yellow,limit=1] run scoreboard players add $team_count bingo.state 1

execute if entity @a[team=bingo.green,limit=1] store result storage bingo:card teams[{id: "bingo:green"}].backgroundIndex byte 1 run scoreboard players get $team_count bingo.state
execute if entity @a[team=bingo.green,limit=1] run scoreboard players add $team_count bingo.state 1

execute if entity @a[team=bingo.dark_green,limit=1] store result storage bingo:card teams[{id: "bingo:dark_green"}].backgroundIndex byte 1 run scoreboard players get $team_count bingo.state
execute if entity @a[team=bingo.dark_green,limit=1] run scoreboard players add $team_count bingo.state 1

execute if entity @a[team=bingo.dark_aqua,limit=1] store result storage bingo:card teams[{id: "bingo:dark_aqua"}].backgroundIndex byte 1 run scoreboard players get $team_count bingo.state
execute if entity @a[team=bingo.dark_aqua,limit=1] run scoreboard players add $team_count bingo.state 1

execute if entity @a[team=bingo.aqua,limit=1] store result storage bingo:card teams[{id: "bingo:aqua"}].backgroundIndex byte 1 run scoreboard players get $team_count bingo.state
execute if entity @a[team=bingo.aqua,limit=1] run scoreboard players add $team_count bingo.state 1

execute if entity @a[team=bingo.blue,limit=1] store result storage bingo:card teams[{id: "bingo:blue"}].backgroundIndex byte 1 run scoreboard players get $team_count bingo.state
execute if entity @a[team=bingo.blue,limit=1] run scoreboard players add $team_count bingo.state 1

execute if entity @a[team=bingo.dark_blue,limit=1] store result storage bingo:card teams[{id: "bingo:dark_blue"}].backgroundIndex byte 1 run scoreboard players get $team_count bingo.state
execute if entity @a[team=bingo.dark_blue,limit=1] run scoreboard players add $team_count bingo.state 1

execute if entity @a[team=bingo.dark_purpl,limit=1] store result storage bingo:card teams[{id: "bingo:dark_purple"}].backgroundIndex byte 1 run scoreboard players get $team_count bingo.state
execute if entity @a[team=bingo.dark_purpl,limit=1] run scoreboard players add $team_count bingo.state 1

execute if entity @a[team=bingo.light_purp,limit=1] store result storage bingo:card teams[{id: "bingo:light_purple"}].backgroundIndex byte 1 run scoreboard players get $team_count bingo.state
execute if entity @a[team=bingo.light_purp,limit=1] run scoreboard players add $team_count bingo.state 1

execute if entity @a[team=bingo.white,limit=1] store result storage bingo:card teams[{id: "bingo:white"}].backgroundIndex byte 1 run scoreboard players get $team_count bingo.state
execute if entity @a[team=bingo.white,limit=1] run scoreboard players add $team_count bingo.state 1

execute if entity @a[team=bingo.gray,limit=1] store result storage bingo:card teams[{id: "bingo:gray"}].backgroundIndex byte 1 run scoreboard players get $team_count bingo.state
execute if entity @a[team=bingo.gray,limit=1] run scoreboard players add $team_count bingo.state 1

execute if entity @a[team=bingo.dark_gray,limit=1] store result storage bingo:card teams[{id: "bingo:dark_gray"}].backgroundIndex byte 1 run scoreboard players get $team_count bingo.state
execute if entity @a[team=bingo.dark_gray,limit=1] run scoreboard players add $team_count bingo.state 1

execute if entity @a[team=bingo.black,limit=1] store result storage bingo:card teams[{id: "bingo:black"}].backgroundIndex byte 1 run scoreboard players get $team_count bingo.state
execute if entity @a[team=bingo.black,limit=1] run scoreboard players add $team_count bingo.state 1

#>
# @within function bingo:game/start/**
#declare storage tmp.bingo:game/start
data modify storage tmp.bingo:game/start backgroundTemplates set from storage bingo:card completedBackgroundTemplates
#>
# @within
# 	function bingo:game/start/init_teams
# 	function bingo:game/start/get_completed_background_template
#declare score_holder $game/start.team_count
scoreboard players operation $game/start.team_count bingo.tmp = $team_count bingo.state
function bingo:game/start/get_completed_background_template

data modify storage tmp.bingo:game/start defaultBackground set value []

execute if entity @a[team=bingo.dark_red,limit=1] run function bingo:game/start/init_teams/dark_red
execute if entity @a[team=bingo.red,limit=1] run function bingo:game/start/init_teams/red
execute if entity @a[team=bingo.gold,limit=1] run function bingo:game/start/init_teams/gold
execute if entity @a[team=bingo.yellow,limit=1] run function bingo:game/start/init_teams/yellow
execute if entity @a[team=bingo.green,limit=1] run function bingo:game/start/init_teams/green
execute if entity @a[team=bingo.dark_green,limit=1] run function bingo:game/start/init_teams/dark_green
execute if entity @a[team=bingo.dark_aqua,limit=1] run function bingo:game/start/init_teams/dark_aqua
execute if entity @a[team=bingo.aqua,limit=1] run function bingo:game/start/init_teams/aqua
execute if entity @a[team=bingo.blue,limit=1] run function bingo:game/start/init_teams/blue
execute if entity @a[team=bingo.dark_blue,limit=1] run function bingo:game/start/init_teams/dark_blue
execute if entity @a[team=bingo.dark_purpl,limit=1] run function bingo:game/start/init_teams/dark_purple
execute if entity @a[team=bingo.light_purp,limit=1] run function bingo:game/start/init_teams/light_purple
execute if entity @a[team=bingo.white,limit=1] run function bingo:game/start/init_teams/white
execute if entity @a[team=bingo.gray,limit=1] run function bingo:game/start/init_teams/gray
execute if entity @a[team=bingo.dark_gray,limit=1] run function bingo:game/start/init_teams/dark_gray
execute if entity @a[team=bingo.black,limit=1] run function bingo:game/start/init_teams/black

data modify storage bingo:card slots[].background set from storage tmp.bingo:game/start defaultBackground