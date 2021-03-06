tellraw @a {"translate":"bingo.got_bingo.col", "with": [{"storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@a[tag=bingo.in_current_team]"}, {"score": {"name": "$col", "objective": "bingo.tmp"}}]}

data modify storage bingo:card teams[{selected: true}].hasBingo set value true