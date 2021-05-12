#> bingo:lobby/set_signs
#
# Places all the signs in the lobby.
#
# This is needed, since players in the lobby will be in survival mode in order
# to support trophy collection like in older Minecraft: Bingo.
#
# Hence, signs could potentially be broken by a player and we just place them
# every tick to make sure everything keeps working.
#
# @within function bingo:lobby/tick
# @context dimension bingo:lobby

#>
# @within
# 	function bingo:lobby/set_signs
# 	function bingo:init/setup_lobby
#declare tag bingo.lobby_sign
#>
# @private
#declare tag bingo.sign_machinery

#>
# @private
#declare tag bingo.sign_credits_neun_einser
#>
# @private
#declare tag bingo.sign_credits_amber_wat
#>
# @private
#declare tag bingo.sign_credits_nope_name
#>
# @private
#declare tag bingo.sign_credits_dr_brian_lorgon111
#>
# @private
#declare tag bingo.sign_credits_playtesters
#>
# @private
#declare tag bingo.sign_credits_silentrob
#>
# @private
#declare tag bingo.sign_credits_muffinshire
#>
# @private
#declare tag bingo.sign_credits_gothfaerie
#>
# @private
#declare tag bingo.sign_credits_zampone
#>
# @private
#declare tag bingo.sign_credits_thomas_to_space
#>
# @private
#declare tag bingo.sign_credits_craca_croes_gazyy
#>
# @private
#declare tag bingo.sign_credits_lifeofchrome
#>
# @private
#declare tag bingo.sign_credits_tod_nl
#>
# @private
#declare tag bingo.sign_credits_no_leaf_clover

#>
# @private
#declare tag bingo.sign_credits_tools
#>
# @private
#declare tag bingo.sign_credits_tools_vscode
#>
# @private
#declare tag bingo.sign_credits_tools_datapackhelperplus
#>
# @private
#declare tag bingo.sign_credits_tools_multinoise
#>
# @private
#declare tag bingo.sign_credits_tools_nbtexplorer
#>
# @private
#declare tag bingo.sign_credits_tools_nbtstudio
#>
# @private
#declare tag bingo.sign_credits_tools_nbtviewer

#>
# @private
#declare tag bingo.sign_team_selection
#>
# @private
#declare tag bingo.sign_card_generation_crafting_table
#>
# @private
#declare tag bingo.sign_card_generation_random_card
#>
# @private
#declare tag bingo.sign_card_generation_from_seed
#>
# @private
#declare tag bingo.sign_card_generation_start_game

execute at @e[type=minecraft:area_effect_cloud, tag=bingo.lobby_sign] run setblock ~ ~ ~ minecraft:air

# Machinery
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_machinery, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=west]{Text1: '{"translate":"bingo.lobby.machinery.sign.line1", "bold":true, "color":"#8eedeb"}', Text2: '{"translate": "bingo.lobby.machinery.sign.line2", "color":"#8eedeb"}', Text3: '{"translate": "bingo.lobby.machinery.sign.line3", "color":"#8eedeb"}', Text4: '{"translate": "bingo.lobby.machinery.sign.line4", "color":"#8eedeb"}'}

# Credits
## Main
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_neun_einser, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=south]{Text1: '[{"text":"Neun", "bold":true, "color":"red"}, {"text":"Einser", "bold":true, "color":"blue"}]', Text2: '{"translate": "bingo.lobby.credits.neun_einser.sign.line2", "color":"#8eedeb"}', Text3: '{"translate": "bingo.lobby.credits.neun_einser.sign.line3", "color":"#8eedeb"}', Text4: '{"translate": "bingo.lobby.credits.neun_einser.sign.line4", "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_amber_wat, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=south]{Text1: '{"text":"AmberW", "bold":true, "color":"#8eedeb"}', Text2: '{"translate": "bingo.lobby.credits.amber_wat.sign.line2", "color":"#8eedeb"}', Text3: '{"translate": "bingo.lobby.credits.amber_wat.sign.line3", "color":"#8eedeb"}', Text4: '{"translate": "bingo.lobby.credits.amber_wat.sign.line4", "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_nope_name, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=south]{Text1: '{"text":"NOPEName", "bold":true, "color":"#8eedeb"}', Text2: '{"translate": "bingo.lobby.credits.nope_name.sign.line2", "color":"#8eedeb"}', Text3: '{"translate": "bingo.lobby.credits.nope_name.sign.line3", "color":"#8eedeb"}', Text4: '{"translate": "bingo.lobby.credits.nope_name.sign.line4", "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_dr_brian_lorgon111, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=south]{Text1: '{"text":"Lorgon111", "bold":true, "color":"#8eedeb"}', Text2: '{"translate": "bingo.lobby.credits.dr_brian_lorgon111.sign.line2", "color":"#8eedeb"}', Text3: '{"translate": "bingo.lobby.credits.dr_brian_lorgon111.sign.line3", "color":"#8eedeb"}', Text4: '{"translate": "bingo.lobby.credits.dr_brian_lorgon111.sign.line4", "color":"#8eedeb"}'}

## Playtesters
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_playtesters, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=north]{Text1: '{"translate": "bingo.lobby.credits.playtesters.sign.line1", "bold":true, "color":"#8eedeb"}', Text2: '{"translate": "bingo.lobby.credits.playtesters.sign.line2", "bold":true, "color":"#8eedeb"}', Text3: '{"translate": "bingo.lobby.credits.playtesters.sign.line3", "bold":true, "color":"#8eedeb"}', Text4: '{"translate": "bingo.lobby.credits.playtesters.sign.line4", "bold":true, "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_no_leaf_clover, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=north]{Text2: '{"text":"no_leaf_", "bold":true, "color":"#8eedeb"}', Text3: '{"text":"clover", "bold":true, "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_tod_nl, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=north]{Text2: '{"text":"Tod_NL", "bold":true, "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_lifeofchrome, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=north]{Text2: '{"text":"lifeofchrome", "bold":true, "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_craca_croes_gazyy, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=north]{Text2: '{"text":"CracaCroes", "bold":true, "color":"#8eedeb"}', Text3: '{"text":"Gazyy", "bold":true, "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_thomas_to_space, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=north]{Text2: '{"text":"ThomasTo", "bold":true, "color":"#8eedeb"}', Text3: '{"text":"Space", "bold":true, "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_zampone, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=north]{Text2: '{"text":"Zampone /", "bold":true, "color":"#8eedeb"}', Text3: '{"text":"ThatManZam", "bold":true, "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_gothfaerie, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=north]{Text2: '{"text":"gothfaerie", "bold":true, "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_muffinshire, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=north]{Text2: '{"text":"Muffinshire", "bold":true, "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_silentrob, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=north]{Text2: '{"text":"silentrob", "bold":true, "color":"#8eedeb"}'}

## Tools
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_tools, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=east]{Text1: '{"translate": "bingo.lobby.credits.tools.sign.line1", "bold":true, "color":"#8eedeb"}', Text2: '{"translate": "bingo.lobby.credits.tools.sign.line2", "bold":true, "color":"#8eedeb"}', Text3: '{"translate": "bingo.lobby.credits.tools.sign.line3", "bold":true, "color":"#8eedeb"}', Text4: '{"translate": "bingo.lobby.credits.tools.sign.line4", "bold":true, "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_tools_vscode, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=east]{Text1: '{"text": "Visual Studio", "bold":true, "color":"#8eedeb"}', Text2: '{"text": "Code", "bold":true, "color":"#8eedeb"}', Text3: '{"translate": "bingo.lobby.credits.tools.vscode.sign.line3", "color":"#8eedeb"}', Text4: '{"translate": "bingo.lobby.credits.tools.vscode.sign.line4", "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_tools_datapackhelperplus, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=east]{Text1: '{"text": "Data Pack", "bold":true, "color":"#8eedeb"}', Text2: '{"text": "Helper Plus", "bold":true, "color":"#8eedeb"}', Text3: '{"translate": "bingo.lobby.credits.tools.datapack_helper_plus.sign.line3", "color":"#8eedeb"}', Text4: '{"translate": "bingo.lobby.credits.tools.datapack_helper_plus.sign.line4", "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_tools_multinoise, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=east]{Text1: '{"text": "Multi Noise", "bold":true, "color":"#8eedeb"}', Text2: '{"text": "Visualizer", "bold":true, "color":"#8eedeb"}', Text3: '{"translate": "bingo.lobby.credits.tools.minecraft_multi_noise_visualizer.sign.line3", "color":"#8eedeb"}', Text4: '{"translate": "bingo.lobby.credits.tools.minecraft_multi_noise_visualizer.sign.line4", "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_tools_nbtexplorer, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=east]{Text2: '{"text": "NBTExplorer", "bold":true, "color":"#8eedeb"}', Text3: '{"translate": "bingo.lobby.credits.tools.nbt_explorer.sign.line3", "color":"#8eedeb"}', Text4: '{"translate": "bingo.lobby.credits.tools.nbt_explorer.sign.line4", "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_tools_nbtstudio, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=east]{Text2: '{"text": "NBT Studio", "bold":true, "color":"#8eedeb"}', Text3: '{"translate": "bingo.lobby.credits.tools.nbt_studio.sign.line3", "color":"#8eedeb"}', Text4: '{"translate": "bingo.lobby.credits.tools.nbt_studio.sign.line4", "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_tools_nbtviewer, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=east]{Text2: '{"text": "NBT Viewer", "bold":true, "color":"#8eedeb"}', Text3: '{"translate": "bingo.lobby.credits.tools.nbt_viewer.sign.line3", "color":"#8eedeb"}', Text4: '{"translate": "bingo.lobby.credits.tools.nbt_viewer.sign.line4", "color":"#8eedeb"}'}

# Card Generation
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_card_generation_crafting_table, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=south]{Text1: '{"translate":"bingo.lobby.card_generation.crafting_table.sign.line1", "bold":true, "color":"#8eedeb"}', Text2:'{"translate":"bingo.lobby.card_generation.crafting_table.sign.line2", "bold":true, "color":"#8eedeb"}', Text3:'{"translate":"bingo.lobby.card_generation.crafting_table.sign.line3", "bold":true, "color":"#8eedeb"}', Text4:'{"translate":"bingo.lobby.card_generation.crafting_table.sign.line4", "bold":true, "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_team_selection, limit=2] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=north]{Text1: '{"translate":"bingo.lobby.team_selection.sign.line1", "bold":true, "color":"#8eedeb"}', Text2:'{"translate":"bingo.lobby.team_selection.sign.line2", "bold":true, "color":"#8eedeb"}', Text3:'{"translate":"bingo.lobby.team_selection.sign.line3", "bold":true, "color":"#8eedeb"}', Text4:'{"translate":"bingo.lobby.team_selection.sign.line4", "bold":true, "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_card_generation_random_card, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=south]{Text1: '{"translate":"bingo.lobby.card_generation.random_card.sign.line1", "bold":true, "color":"#8eedeb", "clickEvent":{"action":"run_command","value":"/function bingo:card_generation/random_card"}}', Text2:'{"translate":"bingo.lobby.card_generation.random_card.sign.line2", "bold":true, "color":"#8eedeb"}', Text3:'{"translate":"bingo.lobby.card_generation.random_card.sign.line3", "bold":true, "color":"#8eedeb"}', Text4:'{"translate":"bingo.lobby.card_generation.random_card.sign.line4", "bold":true, "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_card_generation_from_seed, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=south]{Text1: '{"translate":"bingo.lobby.card_generation.from_seed.sign.line1", "bold":true, "color":"#8eedeb", "clickEvent":{"action":"run_command","value":"/tellraw @s [{\\"translate\\": \\"bingo.lobby.card_generation.from_seed.instructions\\", \\"with\\": [{\\"translate\\": \\"bingo.lobby.card_generation.from_seed.instructions.link\\", \\"color\\":\\"#00c3ff\\", \\"clickEvent\\": {\\"action\\": \\"suggest_command\\", \\"value\\": \\"/trigger bingo.seed set \\"}}]}, \\"\\\\n\\", {\\"translate\\": \\"bingo.lobby.card_generation.from_seed.explanation\\", \\"italic\\": true, \\"color\\": \\"gray\\"}]"}}', Text2:'{"translate":"bingo.lobby.card_generation.from_seed.sign.line2", "bold":true, "color":"#8eedeb"}', Text3:'{"translate":"bingo.lobby.card_generation.from_seed.sign.line3", "bold":true, "color":"#8eedeb"}', Text4:'{"translate":"bingo.lobby.card_generation.from_seed.sign.line4", "bold":true, "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_card_generation_start_game, limit=3] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=south]{Text1: '{"translate":"bingo.lobby.card_generation.start_game.sign.line1", "bold":true, "color":"#8eedeb", "clickEvent":{"action":"run_command","value":"/function bingo:game/start/check_and_start"}}', Text2:'{"translate":"bingo.lobby.card_generation.start_game.sign.line2", "bold":true, "color":"#8eedeb"}', Text3:'{"translate":"bingo.lobby.card_generation.start_game.sign.line3", "bold":true, "color":"#8eedeb"}', Text4:'{"translate":"bingo.lobby.card_generation.start_game.sign.line4", "bold":true, "color":"#8eedeb"}'}


setblock 8 65 -6 minecraft:air
setblock 8 65 -6 minecraft:warped_wall_sign[facing=west]{Text1: '{"translate":"bingo.lobby.settings.preferences.sign.line1", "bold":true, "color":"#8eedeb", "clickEvent":{"action":"run_command","value":"/trigger bingo.pref set 1"}}', Text2:'{"translate":"bingo.lobby.settings.preferences.sign.line2", "bold":true, "color":"#8eedeb"}', Text3:'{"translate":"bingo.lobby.settings.preferences.sign.line3", "bold":true, "color":"#8eedeb"}', Text4:'{"translate":"bingo.lobby.settings.preferences.sign.line4", "bold":true, "color":"#8eedeb"}'}

setblock 8 65 -2 minecraft:air
setblock 8 65 -2 minecraft:warped_wall_sign[facing=west]{Text2: '{"text":"More Settings", "bold":true, "color":"#8eedeb", "clickEvent":{"action":"run_command", "value": "/tellraw @s [{\\"text\\": \\"Do you want to change future settings? \\"}, {\\"text\\": \\"[Yes]\\", \\"color\\": \\"green\\", \\"clickEvent\\": {\\"action\\": \\"run_command\\", \\"value\\": \\"/tellraw @s {\\\\\\"text\\\\\\":\\\\\\"Error accessing the future. Please talk to your local time machine operator.\\\\\\", \\\\\\"obfuscated\\\\\\": true}\\"}}, {\\"text\\": \\" [No]\\", \\"color\\": \\"red\\", \\"clickEvent\\": {\\"action\\": \\"run_command\\", \\"value\\": \\"/tellraw @s {\\\\\\"text\\\\\\":\\\\\\"Good decision. Who knows, maybe these settings are awful.\\\\\\"}\\"}}]"}}', Text3:'{"text":"Coming Soon", "bold":true, "color":"#8eedeb"}'}