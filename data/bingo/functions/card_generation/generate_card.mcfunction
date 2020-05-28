tag @a remove bingo_got_slot0
tag @a remove bingo_got_slot1
tag @a remove bingo_got_slot2
tag @a remove bingo_got_slot3
tag @a remove bingo_got_slot4

tag @a remove bingo_got_slot5
tag @a remove bingo_got_slot6
tag @a remove bingo_got_slot7
tag @a remove bingo_got_slot8
tag @a remove bingo_got_slot9

tag @a remove bingo_got_slot10
tag @a remove bingo_got_slot11
tag @a remove bingo_got_slot12
tag @a remove bingo_got_slot13
tag @a remove bingo_got_slot14

tag @a remove bingo_got_slot15
tag @a remove bingo_got_slot16
tag @a remove bingo_got_slot17
tag @a remove bingo_got_slot18
tag @a remove bingo_got_slot19

tag @a remove bingo_got_slot20
tag @a remove bingo_got_slot21
tag @a remove bingo_got_slot22
tag @a remove bingo_got_slot23
tag @a remove bingo_got_slot24

tag @e[type=minecraft:area_effect_cloud, tag=bingo_item] add bingo_selectable

scoreboard players reset @e[type=minecraft:area_effect_cloud, tag=bingo_item] bingo_slot_id
scoreboard players set $i bingo_tmp 0
function bingo:card_generation/generate_slot

scoreboard players operation Seed bingo_stats = $seed random_main