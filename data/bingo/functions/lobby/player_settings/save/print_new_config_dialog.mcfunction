tellraw @s {"translate": "bingo.lobby.settings.player.save.new.explanation"}

setblock 8 64 4 minecraft:anvil[facing=south]
clear @s minecraft:name_tag{bingo: {newConfig: true}}
give @s minecraft:name_tag{bingo: {newConfig: true}}
experience set @s 1 levels