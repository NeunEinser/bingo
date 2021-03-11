function bingo:util/find_player_team

function bingo:item_detection/helper/set_border
execute if score $success bingo.tmp matches 1 run function bingo:item_detection/helper/announce

data modify storage bingo:card slots[{selected: true}].selected set value false