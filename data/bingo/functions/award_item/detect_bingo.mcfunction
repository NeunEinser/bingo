# rows
execute if entity @s[tag=bingo_got_slot0, tag=bingo_got_slot1, tag=bingo_got_slot2, tag=bingo_got_slot3, tag=bingo_got_slot4] run tag @s add bingo_new_bingo
execute if entity @s[tag=bingo_got_slot5, tag=bingo_got_slot6, tag=bingo_got_slot7, tag=bingo_got_slot8, tag=bingo_got_slot9] run tag @s add bingo_new_bingo
execute if entity @s[tag=bingo_got_slot10, tag=bingo_got_slot11, tag=bingo_got_slot12, tag=bingo_got_slot13, tag=bingo_got_slot14] run tag @s add bingo_new_bingo
execute if entity @s[tag=bingo_got_slot15, tag=bingo_got_slot16, tag=bingo_got_slot17, tag=bingo_got_slot18, tag=bingo_got_slot19] run tag @s add bingo_new_bingo
execute if entity @s[tag=bingo_got_slot20, tag=bingo_got_slot21, tag=bingo_got_slot22, tag=bingo_got_slot23, tag=bingo_got_slot24] run tag @s add bingo_new_bingo

# columns
execute if entity @s[tag=bingo_got_slot0, tag=bingo_got_slot5, tag=bingo_got_slot10, tag=bingo_got_slot15, tag=bingo_got_slot20] run tag @s add bingo_new_bingo
execute if entity @s[tag=bingo_got_slot1, tag=bingo_got_slot6, tag=bingo_got_slot11, tag=bingo_got_slot16, tag=bingo_got_slot21] run tag @s add bingo_new_bingo
execute if entity @s[tag=bingo_got_slot2, tag=bingo_got_slot7, tag=bingo_got_slot12, tag=bingo_got_slot17, tag=bingo_got_slot22] run tag @s add bingo_new_bingo
execute if entity @s[tag=bingo_got_slot3, tag=bingo_got_slot8, tag=bingo_got_slot13, tag=bingo_got_slot18, tag=bingo_got_slot23] run tag @s add bingo_new_bingo
execute if entity @s[tag=bingo_got_slot4, tag=bingo_got_slot9, tag=bingo_got_slot14, tag=bingo_got_slot19, tag=bingo_got_slot24] run tag @s add bingo_new_bingo

# diagonals
execute if entity @s[tag=bingo_got_slot0, tag=bingo_got_slot6, tag=bingo_got_slot12, tag=bingo_got_slot18, tag=bingo_got_slot24] run tag @s add bingo_new_bingo
execute if entity @s[tag=bingo_got_slot4, tag=bingo_got_slot8, tag=bingo_got_slot12, tag=bingo_got_slot16, tag=bingo_got_slot20] run tag @s add bingo_new_bingo

execute if entity @s[tag=bingo_new_bingo] run tag @s add bingo_got_bingo