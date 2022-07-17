execute unless score $test fetchr.state matches 0.. run scoreboard players set $time fetchr.state 0
execute unless score $test fetchr.state matches 0.. run scoreboard players set $test fetchr.state 999
tellraw @a {"score": {"name": "$test", "objective": "fetchr.state"}}

function neun_einser.timer:start/millis
function fetchr:card_generation/random_card
function neun_einser.timer:read
scoreboard players operation $time fetchr.state += $raw 91.timer.time

scoreboard players remove $test fetchr.state 1
execute unless score $test fetchr.state matches 0.. run scoreboard players operation $time fetchr.state /= 1000 fetchr.const
execute unless score $test fetchr.state matches 0.. run tellraw @a {"score": {"name": "$time","objective": "fetchr.state"}}
execute if score $test fetchr.state matches 0.. run schedule function fetchr:test 1t