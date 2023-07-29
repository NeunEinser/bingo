#> fetchr:item_detection/goals/lockout/tag_team_members
#
# This function tags the members of the current team as winner
#
# @within function fetchr:item_detection/goals/lockout/find_winners

# Work around for """WAI""" https://bugs.mojang.com/browse/MC-139625 :mad_neun:
data modify storage tmp.fetchr:item_detection team set from storage tmp.fetchr:item_detection teams[-1]

execute if data storage tmp.fetchr:item_detection team{id: "fetchr:aqua"} run tag @a[team=fetchr.aqua] add fetchr.lockout_winner
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:black"} run tag @a[team=fetchr.black] add fetchr.lockout_winner
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:blue"} run tag @a[team=fetchr.blue] add fetchr.lockout_winner
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:dark_aqua"} run tag @a[team=fetchr.dark_aqua] add fetchr.lockout_winner
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:dark_blue"} run tag @a[team=fetchr.dark_blue] add fetchr.lockout_winner
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:dark_gray"} run tag @a[team=fetchr.dark_gray] add fetchr.lockout_winner
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:dark_green"} run tag @a[team=fetchr.dark_green] add fetchr.lockout_winner
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:dark_purple"} run tag @a[team=fetchr.dark_purple] add fetchr.lockout_winner
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:dark_red"} run tag @a[team=fetchr.dark_red] add fetchr.lockout_winner
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:gold"} run tag @a[team=fetchr.gold] add fetchr.lockout_winner
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:gray"} run tag @a[team=fetchr.gray] add fetchr.lockout_winner
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:green"} run tag @a[team=fetchr.green] add fetchr.lockout_winner
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:light_purple"} run tag @a[team=fetchr.light_purple] add fetchr.lockout_winner
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:red"} run tag @a[team=fetchr.red] add fetchr.lockout_winner
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:white"} run tag @a[team=fetchr.white] add fetchr.lockout_winner
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:yellow"} run tag @a[team=fetchr.yellow] add fetchr.lockout_winner