##by NOPEname

scoreboard players operation $in nn.math.trig = $tmp_lcg nn.math.rand
function nope_name.math:trig/sin_lt/exe
scoreboard players operation $out nn.math.trig %= 100000000 nn.math.rand
scoreboard players operation $tmp_lcg nn.math.rand += $out nn.math.trig
