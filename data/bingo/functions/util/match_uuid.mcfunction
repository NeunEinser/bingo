#Tags @s with bingo_uuid, if @s has the same UUID as bingo:tmp 
data modify storage bingo:tmp uuidCopy set from storage bingo:tmp uuid
execute store success score $success bingo.tmp run data modify storage bingo:tmp uuidCopy set from entity @s UUID

execute if score $success bingo.tmp matches 0 run tag @s add bingo_uuid