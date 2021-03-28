##by NOPEname

#>
# @internal
#declare score_holder $tmp_lcg
#lcg
scoreboard players operation $tmp_lcg nn.math.rand *= $lcg nn.math.rand
scoreboard players add $tmp_lcg nn.math.rand 12345
function nope_name.math:zz_private/rand/sin
scoreboard players operation $out nn.math.rand = $tmp_lcg nn.math.rand

#$range
execute if score $range nn.math.rand matches -2147483648.. run scoreboard players operation $out nn.math.rand %= $range nn.math.rand
