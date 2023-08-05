#> fetchr:game/reveal_card
#
#
# This function checks whether strict mode is active and the player clicking is
# a confirmed operator, and the either asks the player to confirm their op
# status or reveals the bingo card
#
# @within
# 	function fetchr:game/reveal_card
# 	function fetchr:game/reveal_card_strict_mode_check
# @context entity Player changing the setting


data modify block 7 0 7 front_text.messages[0] set value '["", {"storage": "fetchr:card", "nbt": "slots[0].background[]", "interpret": true, "separator":""}, {"text": "\\u0002", "font": "fetchr:space"}, {"storage": "fetchr:card", "nbt": "slots[0].item.icon", "interpret": true}]'
data modify storage fetchr:card slots[0].display set from block 7 0 7 front_text.messages[0]

data modify block 7 0 7 front_text.messages[0] set value '["", {"storage": "fetchr:card", "nbt": "slots[1].background[]", "interpret": true, "separator":""}, {"text": "\\u0002", "font": "fetchr:space"}, {"storage": "fetchr:card", "nbt": "slots[1].item.icon", "interpret": true}]'
data modify storage fetchr:card slots[1].display set from block 7 0 7 front_text.messages[0]

data modify block 7 0 7 front_text.messages[0] set value '["", {"storage": "fetchr:card", "nbt": "slots[2].background[]", "interpret": true, "separator":""}, {"text": "\\u0002", "font": "fetchr:space"}, {"storage": "fetchr:card", "nbt": "slots[2].item.icon", "interpret": true}]'
data modify storage fetchr:card slots[2].display set from block 7 0 7 front_text.messages[0]

data modify block 7 0 7 front_text.messages[0] set value '["", {"storage": "fetchr:card", "nbt": "slots[3].background[]", "interpret": true, "separator":""}, {"text": "\\u0002", "font": "fetchr:space"}, {"storage": "fetchr:card", "nbt": "slots[3].item.icon", "interpret": true}]'
data modify storage fetchr:card slots[3].display set from block 7 0 7 front_text.messages[0]

data modify block 7 0 7 front_text.messages[0] set value '["", {"storage": "fetchr:card", "nbt": "slots[4].background[]", "interpret": true, "separator":""}, {"text": "\\u0002", "font": "fetchr:space"}, {"storage": "fetchr:card", "nbt": "slots[4].item.icon", "interpret": true}]'
data modify storage fetchr:card slots[4].display set from block 7 0 7 front_text.messages[0]

data modify block 7 0 7 front_text.messages[0] set value '["", {"storage": "fetchr:card", "nbt": "slots[5].background[]", "interpret": true, "separator":""}, {"text": "\\u0002", "font": "fetchr:space"}, {"storage": "fetchr:card", "nbt": "slots[5].item.icon", "interpret": true}]'
data modify storage fetchr:card slots[5].display set from block 7 0 7 front_text.messages[0]

data modify block 7 0 7 front_text.messages[0] set value '["", {"storage": "fetchr:card", "nbt": "slots[6].background[]", "interpret": true, "separator":""}, {"text": "\\u0002", "font": "fetchr:space"}, {"storage": "fetchr:card", "nbt": "slots[6].item.icon", "interpret": true}]'
data modify storage fetchr:card slots[6].display set from block 7 0 7 front_text.messages[0]

data modify block 7 0 7 front_text.messages[0] set value '["", {"storage": "fetchr:card", "nbt": "slots[7].background[]", "interpret": true, "separator":""}, {"text": "\\u0002", "font": "fetchr:space"}, {"storage": "fetchr:card", "nbt": "slots[7].item.icon", "interpret": true}]'
data modify storage fetchr:card slots[7].display set from block 7 0 7 front_text.messages[0]

data modify block 7 0 7 front_text.messages[0] set value '["", {"storage": "fetchr:card", "nbt": "slots[8].background[]", "interpret": true, "separator":""}, {"text": "\\u0002", "font": "fetchr:space"}, {"storage": "fetchr:card", "nbt": "slots[8].item.icon", "interpret": true}]'
data modify storage fetchr:card slots[8].display set from block 7 0 7 front_text.messages[0]

data modify block 7 0 7 front_text.messages[0] set value '["", {"storage": "fetchr:card", "nbt": "slots[9].background[]", "interpret": true, "separator":""}, {"text": "\\u0002", "font": "fetchr:space"}, {"storage": "fetchr:card", "nbt": "slots[9].item.icon", "interpret": true}]'
data modify storage fetchr:card slots[9].display set from block 7 0 7 front_text.messages[0]

data modify block 7 0 7 front_text.messages[0] set value '["", {"storage": "fetchr:card", "nbt": "slots[10].background[]", "interpret": true, "separator":""}, {"text": "\\u0002", "font": "fetchr:space"}, {"storage": "fetchr:card", "nbt": "slots[10].item.icon", "interpret": true}]'
data modify storage fetchr:card slots[10].display set from block 7 0 7 front_text.messages[0]

data modify block 7 0 7 front_text.messages[0] set value '["", {"storage": "fetchr:card", "nbt": "slots[11].background[]", "interpret": true, "separator":""}, {"text": "\\u0002", "font": "fetchr:space"}, {"storage": "fetchr:card", "nbt": "slots[11].item.icon", "interpret": true}]'
data modify storage fetchr:card slots[11].display set from block 7 0 7 front_text.messages[0]

data modify block 7 0 7 front_text.messages[0] set value '["", {"storage": "fetchr:card", "nbt": "slots[12].background[]", "interpret": true, "separator":""}, {"text": "\\u0002", "font": "fetchr:space"}, {"storage": "fetchr:card", "nbt": "slots[12].item.icon", "interpret": true}]'
data modify storage fetchr:card slots[12].display set from block 7 0 7 front_text.messages[0]

data modify block 7 0 7 front_text.messages[0] set value '["", {"storage": "fetchr:card", "nbt": "slots[13].background[]", "interpret": true, "separator":""}, {"text": "\\u0002", "font": "fetchr:space"}, {"storage": "fetchr:card", "nbt": "slots[13].item.icon", "interpret": true}]'
data modify storage fetchr:card slots[13].display set from block 7 0 7 front_text.messages[0]

data modify block 7 0 7 front_text.messages[0] set value '["", {"storage": "fetchr:card", "nbt": "slots[14].background[]", "interpret": true, "separator":""}, {"text": "\\u0002", "font": "fetchr:space"}, {"storage": "fetchr:card", "nbt": "slots[14].item.icon", "interpret": true}]'
data modify storage fetchr:card slots[14].display set from block 7 0 7 front_text.messages[0]

data modify block 7 0 7 front_text.messages[0] set value '["", {"storage": "fetchr:card", "nbt": "slots[15].background[]", "interpret": true, "separator":""}, {"text": "\\u0002", "font": "fetchr:space"}, {"storage": "fetchr:card", "nbt": "slots[15].item.icon", "interpret": true}]'
data modify storage fetchr:card slots[15].display set from block 7 0 7 front_text.messages[0]

data modify block 7 0 7 front_text.messages[0] set value '["", {"storage": "fetchr:card", "nbt": "slots[16].background[]", "interpret": true, "separator":""}, {"text": "\\u0002", "font": "fetchr:space"}, {"storage": "fetchr:card", "nbt": "slots[16].item.icon", "interpret": true}]'
data modify storage fetchr:card slots[16].display set from block 7 0 7 front_text.messages[0]

data modify block 7 0 7 front_text.messages[0] set value '["", {"storage": "fetchr:card", "nbt": "slots[17].background[]", "interpret": true, "separator":""}, {"text": "\\u0002", "font": "fetchr:space"}, {"storage": "fetchr:card", "nbt": "slots[17].item.icon", "interpret": true}]'
data modify storage fetchr:card slots[17].display set from block 7 0 7 front_text.messages[0]

data modify block 7 0 7 front_text.messages[0] set value '["", {"storage": "fetchr:card", "nbt": "slots[18].background[]", "interpret": true, "separator":""}, {"text": "\\u0002", "font": "fetchr:space"}, {"storage": "fetchr:card", "nbt": "slots[18].item.icon", "interpret": true}]'
data modify storage fetchr:card slots[18].display set from block 7 0 7 front_text.messages[0]

data modify block 7 0 7 front_text.messages[0] set value '["", {"storage": "fetchr:card", "nbt": "slots[19].background[]", "interpret": true, "separator":""}, {"text": "\\u0002", "font": "fetchr:space"}, {"storage": "fetchr:card", "nbt": "slots[19].item.icon", "interpret": true}]'
data modify storage fetchr:card slots[19].display set from block 7 0 7 front_text.messages[0]

data modify block 7 0 7 front_text.messages[0] set value '["", {"storage": "fetchr:card", "nbt": "slots[20].background[]", "interpret": true, "separator":""}, {"text": "\\u0002", "font": "fetchr:space"}, {"storage": "fetchr:card", "nbt": "slots[20].item.icon", "interpret": true}]'
data modify storage fetchr:card slots[20].display set from block 7 0 7 front_text.messages[0]

data modify block 7 0 7 front_text.messages[0] set value '["", {"storage": "fetchr:card", "nbt": "slots[21].background[]", "interpret": true, "separator":""}, {"text": "\\u0002", "font": "fetchr:space"}, {"storage": "fetchr:card", "nbt": "slots[21].item.icon", "interpret": true}]'
data modify storage fetchr:card slots[21].display set from block 7 0 7 front_text.messages[0]

data modify block 7 0 7 front_text.messages[0] set value '["", {"storage": "fetchr:card", "nbt": "slots[22].background[]", "interpret": true, "separator":""}, {"text": "\\u0002", "font": "fetchr:space"}, {"storage": "fetchr:card", "nbt": "slots[22].item.icon", "interpret": true}]'
data modify storage fetchr:card slots[22].display set from block 7 0 7 front_text.messages[0]

data modify block 7 0 7 front_text.messages[0] set value '["", {"storage": "fetchr:card", "nbt": "slots[23].background[]", "interpret": true, "separator":""}, {"text": "\\u0002", "font": "fetchr:space"}, {"storage": "fetchr:card", "nbt": "slots[23].item.icon", "interpret": true}]'
data modify storage fetchr:card slots[23].display set from block 7 0 7 front_text.messages[0]

data modify block 7 0 7 front_text.messages[0] set value '["", {"storage": "fetchr:card", "nbt": "slots[24].background[]", "interpret": true, "separator":""}, {"text": "\\u0002", "font": "fetchr:space"}, {"storage": "fetchr:card", "nbt": "slots[24].item.icon", "interpret": true}]'
data modify storage fetchr:card slots[24].display set from block 7 0 7 front_text.messages[0]

scoreboard players set $blind_mode fetchr.state 0
scoreboard players reset @a fetchr.reveal_card
function fetchr:card_frames/spawn
function fetchr:util/update_card