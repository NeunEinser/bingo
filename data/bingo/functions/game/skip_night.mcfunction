#> bingo:game/skip_night
#
# Skips to the next day.
#
# Workaround for https://bugs.mojang.com/browse/MC-188578
#
# @within function bingo:game/tick

#>
# Current daytime
#
# @private
#declare score_holder $game/skip_night.time
execute store result score $game/skip_night.time bingo.tmp run time query daytime

execute unless score $game/skip_night.time bingo.tmp matches 12000.. run time add 12000t
execute if score $game/skip_night.time bingo.tmp matches 12000.. run scoreboard players remove $game/skip_night.time bingo.tmp 12000

execute unless score $game/skip_night.time bingo.tmp matches 6000.. run time add 6000t
execute if score $game/skip_night.time bingo.tmp matches 6000.. run scoreboard players remove $game/skip_night.time bingo.tmp 6000

execute unless score $game/skip_night.time bingo.tmp matches 3000.. run time add 3000t
execute if score $game/skip_night.time bingo.tmp matches 3000.. run scoreboard players remove $game/skip_night.time bingo.tmp 3000

execute unless score $game/skip_night.time bingo.tmp matches 1500.. run time add 1500t
execute if score $game/skip_night.time bingo.tmp matches 1500.. run scoreboard players remove $game/skip_night.time bingo.tmp 1500

execute unless score $game/skip_night.time bingo.tmp matches 750.. run time add 750t
execute if score $game/skip_night.time bingo.tmp matches 750.. run scoreboard players remove $game/skip_night.time bingo.tmp 750

execute unless score $game/skip_night.time bingo.tmp matches 375.. run time add 375t
execute if score $game/skip_night.time bingo.tmp matches 375.. run scoreboard players remove $game/skip_night.time bingo.tmp 374
execute unless score $game/skip_night.time bingo.tmp matches 375.. run scoreboard players add $game/skip_night.time bingo.tmp 1

execute unless score $game/skip_night.time bingo.tmp matches 188.. run time add 188t
execute if score $game/skip_night.time bingo.tmp matches 188.. run scoreboard players remove $game/skip_night.time bingo.tmp 188

execute unless score $game/skip_night.time bingo.tmp matches 94.. run time add 94t
execute if score $game/skip_night.time bingo.tmp matches 94.. run scoreboard players remove $game/skip_night.time bingo.tmp 94

execute unless score $game/skip_night.time bingo.tmp matches 47.. run time add 47t
execute if score $game/skip_night.time bingo.tmp matches 47.. run scoreboard players remove $game/skip_night.time bingo.tmp 46
execute unless score $game/skip_night.time bingo.tmp matches 47.. run scoreboard players add $game/skip_night.time bingo.tmp 1

execute unless score $game/skip_night.time bingo.tmp matches 24.. run time add 24t
execute if score $game/skip_night.time bingo.tmp matches 24.. run scoreboard players remove $game/skip_night.time bingo.tmp 24

execute unless score $game/skip_night.time bingo.tmp matches 12.. run time add 12t
execute if score $game/skip_night.time bingo.tmp matches 12.. run scoreboard players remove $game/skip_night.time bingo.tmp 12

execute unless score $game/skip_night.time bingo.tmp matches 6.. run time add 6t
execute if score $game/skip_night.time bingo.tmp matches 6.. run scoreboard players remove $game/skip_night.time bingo.tmp 6

execute unless score $game/skip_night.time bingo.tmp matches 3.. run time add 3t
execute if score $game/skip_night.time bingo.tmp matches 3.. run scoreboard players remove $game/skip_night.time bingo.tmp 2
execute unless score $game/skip_night.time bingo.tmp matches 3.. run scoreboard players add $game/skip_night.time bingo.tmp 1

execute unless score $game/skip_night.time bingo.tmp matches 2.. run time add 2t
execute if score $game/skip_night.time bingo.tmp matches 2.. run scoreboard players remove $game/skip_night.time bingo.tmp 2

execute unless score $game/skip_night.time bingo.tmp matches 1 run time add 1t

time add 1t