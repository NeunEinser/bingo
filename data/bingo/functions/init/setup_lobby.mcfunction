forceload add ~ ~
setblock ~ ~ ~ minecraft:command_block[facing=east]{Command: "data merge block ~ ~ ~ {auto: false}"}

# setup teams
## add
team add bingo_aqua
team add bingo_black
team add bingo_blue
team add bingo_dark_aqua
team add bingo_dark_blue
team add bingo_dark_gray
team add bingo_dark_green
team add bingo_dark_purpl
team add bingo_dark_red
team add bingo_gold
team add bingo_gray
team add bingo_green
team add bingo_light_purp
team add bingo_red
team add bingo_white
team add bingo_yellow

## set colors
team modify bingo_aqua color aqua
team modify bingo_black color black
team modify bingo_blue color blue
team modify bingo_dark_aqua color dark_aqua
team modify bingo_dark_blue color dark_blue
team modify bingo_dark_gray color dark_gray
team modify bingo_dark_green color dark_green
team modify bingo_dark_purpl color dark_purple
team modify bingo_dark_red color dark_red
team modify bingo_gold color gold
team modify bingo_gray color gray
team modify bingo_green color green
team modify bingo_light_purp color light_purple
team modify bingo_red color red
team modify bingo_white color white
team modify bingo_yellow color yellow

## spawn aecs
kill @e[type=minecraft:area_effect_cloud, tag=bingo_item_border]

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '{"text": "\\uFFFE", "color": "aqua"}', Tags: ["bingo_item_border", "bingo_completed_item", "bingo_aqua"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '{"text": "\\uFFFE", "color": "black"}', Tags: ["bingo_item_border", "bingo_completed_item", "bingo_black"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '{"text": "\\uFFFE", "color": "blue"}', Tags: ["bingo_item_border", "bingo_completed_item", "bingo_blue"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '{"text": "\\uFFFE", "color": "dark_aqua"}', Tags: ["bingo_item_border", "bingo_completed_item", "bingo_dark_aqua"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '{"text": "\\uFFFE", "color": "dark_blue"}', Tags: ["bingo_item_border", "bingo_completed_item", "bingo_dark_blue"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '{"text": "\\uFFFE", "color": "dark_gray"}', Tags: ["bingo_item_border", "bingo_completed_item", "bingo_dark_gray"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '{"text": "\\uFFFE", "color": "dark_green"}', Tags: ["bingo_item_border", "bingo_completed_item", "bingo_dark_green"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '{"text": "\\uFFFE", "color": "dark_purple"}', Tags: ["bingo_item_border", "bingo_completed_item", "bingo_dark_purple"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '{"text": "\\uFFFE", "color": "dark_red"}', Tags: ["bingo_item_border", "bingo_completed_item", "bingo_dark_red"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '{"text": "\\uFFFE", "color": "gold"}', Tags: ["bingo_item_border", "bingo_completed_item", "bingo_gold"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '{"text": "\\uFFFE", "color": "gray"}', Tags: ["bingo_item_border", "bingo_completed_item", "bingo_gray"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '{"text": "\\uFFFE", "color": "green"}', Tags: ["bingo_item_border", "bingo_completed_item", "bingo_green"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '{"text": "\\uFFFE", "color": "light_purple"}', Tags: ["bingo_item_border", "bingo_completed_item", "bingo_light_purple"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '{"text": "\\uFFFE", "color": "red"}', Tags: ["bingo_item_border", "bingo_completed_item", "bingo_red"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '{"text": "\\uFFFE", "color": "white"}', Tags: ["bingo_item_border", "bingo_completed_item", "bingo_white"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '{"text": "\\uFFFE", "color": "yellow"}', Tags: ["bingo_item_border", "bingo_completed_item", "bingo_yellow"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\uFFFF"', Tags: ["bingo_item_border", "bingo_current_team", "bingo_uncompleted_item", "bingo_got_slot0", "bingo_got_slot1", "bingo_got_slot2", "bingo_got_slot3", "bingo_got_slot4", "bingo_got_slot5", "bingo_got_slot6", "bingo_got_slot7", "bingo_got_slot8", "bingo_got_slot9", "bingo_got_slot10", "bingo_got_slot11", "bingo_got_slot12", "bingo_got_slot13", "bingo_got_slot14", "bingo_got_slot15", "bingo_got_slot16", "bingo_got_slot17", "bingo_got_slot18", "bingo_got_slot19", "bingo_got_slot20", "bingo_got_slot21", "bingo_got_slot22", "bingo_got_slot23", "bingo_got_slot24"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}