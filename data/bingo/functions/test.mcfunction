execute unless score $test bingo.state matches 0.. run scoreboard players set $time bingo.state 0
execute unless score $test bingo.state matches 0.. run scoreboard players set $test bingo.state 999
tellraw @a {"score": {"name": "$test", "objective": "bingo.state"}}

function neun_einser.timer:start/millis
function bingo:card_generation/random_card
function neun_einser.timer:read
scoreboard players operation $time bingo.state += $raw 91.timer.time

scoreboard players remove $test bingo.state 1
execute unless score $test bingo.state matches 0.. run scoreboard players operation $time bingo.state /= 1000 bingo.const
execute unless score $test bingo.state matches 0.. run tellraw @a {"score": {"name": "$time","objective": "bingo.state"}}
execute if score $test bingo.state matches 0.. run schedule function bingo:test 1t