tellraw @a {"translate":"bingo.got_bingo.row", "with": [{"storage": "timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@a[tag=bingo.in_current_team]"}, {"score": {"name": "$row", "objective": "bingo.tmp"}}]}

data modify storage bingo:card teams[{selected: true}].hasBingo set value true