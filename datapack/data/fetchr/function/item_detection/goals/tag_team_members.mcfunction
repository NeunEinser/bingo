#> fetchr:item_detection/goals/tag_team_members
#
# This function tags the members of the current team as winner
#
# @within function fetchr:item_detection/goals/**/*

#>
# @within function fetchr:item_detection/goals/**/*
#declare tag fetchr.in_team

# Work around for """WAI""" https://bugs.mojang.com/browse/MC-139625 :mad_neun:
data modify storage tmp.fetchr:item_detection team set from storage tmp.fetchr:item_detection teams[-1]

execute if data storage tmp.fetchr:item_detection team{id: "fetchr:light_blue"} run tag @a[team=fetchr.light_blue] add fetchr.in_team
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:black"} run tag @a[team=fetchr.black] add fetchr.in_team
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:blue"} run tag @a[team=fetchr.blue] add fetchr.in_team
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:cyan"} run tag @a[team=fetchr.cyan] add fetchr.in_team
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:dark_blue"} run tag @a[team=fetchr.dark_blue] add fetchr.in_team
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:dark_gray"} run tag @a[team=fetchr.dark_gray] add fetchr.in_team
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:green"} run tag @a[team=fetchr.green] add fetchr.in_team
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:purple"} run tag @a[team=fetchr.purple] add fetchr.in_team
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:dark_red"} run tag @a[team=fetchr.dark_red] add fetchr.in_team
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:orange"} run tag @a[team=fetchr.orange] add fetchr.in_team
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:gray"} run tag @a[team=fetchr.gray] add fetchr.in_team
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:lime"} run tag @a[team=fetchr.lime] add fetchr.in_team
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:magenta"} run tag @a[team=fetchr.magenta] add fetchr.in_team
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:red"} run tag @a[team=fetchr.red] add fetchr.in_team
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:white"} run tag @a[team=fetchr.white] add fetchr.in_team
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:yellow"} run tag @a[team=fetchr.yellow] add fetchr.in_team
