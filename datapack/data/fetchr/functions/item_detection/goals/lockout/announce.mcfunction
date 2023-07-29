#> fetchr:item_detection/goals/lockout/announce
#
# This function checks if the lockout goal has been reached.
#
# @within function fetchr:item_detection/goals/lockout/detect

#>
# @within function fetchr:item_detection/goals/lockout/*
#declare tag fetchr.lockout_winner

data modify storage tmp.fetchr:item_detection teams set from storage fetchr:card teams
function fetchr:item_detection/goals/lockout/find_winners

tellraw @a ["[", {"text":"≡", "color":"#00c3ff", "clickEvent":{"action":"run_command", "value":"/trigger fetchr.menu"}, "hoverEvent":{"action":"show_text", "contents":{"translate": "fetchr.game.menu.hover_text"}}}, "] ", {"translate": "fetchr.won_lockout_race", "with": [{"storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@a[tag=fetchr.lockout_winner]"}]}]
execute as @a[tag=fetchr.lockout_winner] run function fetchr:item_detection/goals/completed_goal_effects/init

tag @a[predicate=fetchr:is_in_game] add fetchr.spectator
tag @a remove fetchr.lockout_winner

scoreboard players set $lockout_race_ended fetchr.state 1