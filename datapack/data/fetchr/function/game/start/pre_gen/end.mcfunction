#> fetchr:game/start/pre_gen/end
#
# Called at the end of pre-gen.
#
# @within function fetchr:game/start/pre_gen/generate_and_process

bossbar set fetchr:start/pre_gen/progress visible false
scoreboard players set $pregen_status fetchr.state 2