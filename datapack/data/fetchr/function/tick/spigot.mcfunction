#> fetchr:tick/spigot
#
# This function fails to parse in a vanilla environment and detects Spigot by
# attempting to run the plugins command.
#
# @within function fetchr:tick/tick
plugins

effect give @a minecraft:blindness 2 255 true
effect give @a minecraft:slowness 2 255 true
effect give @a minecraft:jump_boost 2 128 true

tellraw @a ["", {"translate": "fetchr.error.spigot_paper", "color": "red"}, "\n\n", {"translate": "fetchr.error.spigot_paper.help", "with": [ [ "[", { "text": "Github", "color": "#00c3ff", "clickEvent": { "action": "open_url", "value": "https://github.com/NeunEinser/bingo" } }, "]"], [ "[", { "text": "Discord", "color": "#00c3ff", "clickEvent": { "action": "open_url", "value": "https://discord.gg/9f6E3AxGA8"} }, "]"]]}]
