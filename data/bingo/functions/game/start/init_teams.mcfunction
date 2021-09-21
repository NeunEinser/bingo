#> bingo:game/start/init_teams
#
# Sets teams up for playing and skybox
#
# @within function bingo:game/start/spawn_skybox
# @context location bingo:lobby 0 0 0
#
# 

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

# Generate needed completed backgrounds
#>
# @within
# 	function bingo:game/start/init_teams
# 	function bingo:game/start/get_completed_background_template
#declare score_holder $game/start.team_count
scoreboard players set $game/start.team_count bingo.tmp 0

data modify storage bingo:card teams[{id: "bingo:dark_red"}].backgroundIndex set value 0b
scoreboard players add $game/start.team_count bingo.tmp 1

execute store result storage bingo:card teams[{id: "bingo:red"}].backgroundIndex byte 1 run scoreboard players get $game/start.team_count bingo.tmp
scoreboard players add $game/start.team_count bingo.tmp 1

execute store result storage bingo:card teams[{id: "bingo:gold"}].backgroundIndex byte 1 run scoreboard players get $game/start.team_count bingo.tmp
scoreboard players add $game/start.team_count bingo.tmp 1

execute store result storage bingo:card teams[{id: "bingo:yellow"}].backgroundIndex byte 1 run scoreboard players get $game/start.team_count bingo.tmp
scoreboard players add $game/start.team_count bingo.tmp 1

execute store result storage bingo:card teams[{id: "bingo:green"}].backgroundIndex byte 1 run scoreboard players get $game/start.team_count bingo.tmp
scoreboard players add $game/start.team_count bingo.tmp 1

execute store result storage bingo:card teams[{id: "bingo:dark_green"}].backgroundIndex byte 1 run scoreboard players get $game/start.team_count bingo.tmp
scoreboard players add $game/start.team_count bingo.tmp 1

execute store result storage bingo:card teams[{id: "bingo:dark_aqua"}].backgroundIndex byte 1 run scoreboard players get $game/start.team_count bingo.tmp
scoreboard players add $game/start.team_count bingo.tmp 1

execute store result storage bingo:card teams[{id: "bingo:aqua"}].backgroundIndex byte 1 run scoreboard players get $game/start.team_count bingo.tmp
scoreboard players add $game/start.team_count bingo.tmp 1

execute store result storage bingo:card teams[{id: "bingo:blue"}].backgroundIndex byte 1 run scoreboard players get $game/start.team_count bingo.tmp
scoreboard players add $game/start.team_count bingo.tmp 1

execute store result storage bingo:card teams[{id: "bingo:dark_blue"}].backgroundIndex byte 1 run scoreboard players get $game/start.team_count bingo.tmp
scoreboard players add $game/start.team_count bingo.tmp 1

execute store result storage bingo:card teams[{id: "bingo:dark_purple"}].backgroundIndex byte 1 run scoreboard players get $game/start.team_count bingo.tmp
scoreboard players add $game/start.team_count bingo.tmp 1

execute store result storage bingo:card teams[{id: "bingo:light_purple"}].backgroundIndex byte 1 run scoreboard players get $game/start.team_count bingo.tmp
scoreboard players add $game/start.team_count bingo.tmp 1

execute store result storage bingo:card teams[{id: "bingo:black"}].backgroundIndex byte 1 run scoreboard players get $game/start.team_count bingo.tmp
scoreboard players add $game/start.team_count bingo.tmp 1

execute store result storage bingo:card teams[{id: "bingo:dark_gray"}].backgroundIndex byte 1 run scoreboard players get $game/start.team_count bingo.tmp
scoreboard players add $game/start.team_count bingo.tmp 1

execute store result storage bingo:card teams[{id: "bingo:gray"}].backgroundIndex byte 1 run scoreboard players get $game/start.team_count bingo.tmp
scoreboard players add $game/start.team_count bingo.tmp 1

execute store result storage bingo:card teams[{id: "bingo:white"}].backgroundIndex byte 1 run scoreboard players get $game/start.team_count bingo.tmp
scoreboard players add $game/start.team_count bingo.tmp 1

#>
# @within function bingo:game/start/**
#declare storage tmp.bingo:game/start
data modify storage tmp.bingo:game/start backgroundTemplates set from storage bingo:card completedBackgroundTemplates
function bingo:game/start/get_completed_background_template

setblock ~ ~ ~ minecraft:oak_sign
data modify storage tmp.bingo:game/start defaultBackground set value []

function bingo:game/start/init_teams/dark_red
function bingo:game/start/init_teams/red
function bingo:game/start/init_teams/gold
function bingo:game/start/init_teams/yellow
function bingo:game/start/init_teams/green
function bingo:game/start/init_teams/dark_green
function bingo:game/start/init_teams/dark_aqua
function bingo:game/start/init_teams/aqua
function bingo:game/start/init_teams/blue
function bingo:game/start/init_teams/dark_blue
function bingo:game/start/init_teams/dark_purple
function bingo:game/start/init_teams/light_purple
function bingo:game/start/init_teams/black
function bingo:game/start/init_teams/dark_gray
function bingo:game/start/init_teams/gray
function bingo:game/start/init_teams/white

setblock ~ ~ ~ minecraft:barrier

data modify storage bingo:card slots[].background set from storage tmp.bingo:game/start defaultBackground