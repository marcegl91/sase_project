call read_swt
mov swt_val, pow_a
call read_swt
mov swt_val, pow_b
call pow
out 0, pow_res
loop:
cmp x, x
beq loop

pow:
mov @1, pow_res
mov @0, pow_i
mov pow_a, mul_a
pow_loop: cmp pow_i, pow_b
beq pow_end
mov pow_res, mul_b
call mul
mov mul_res, pow_res
add @1, pow_i
cmp x, x
beq pow_loop
pow_end: ret

mul:
mov @0, mul_res
mov @0, mul_i
mul_loop: cmp mul_i, mul_b
beq mul_end
add mul_a, mul_res
add @1, mul_i
cmp x, x
beq mul_loop
mul_end: ret

read_swt: in 8, poll_tmp
cmp poll_tmp, @0
beq read_swt
in 4, swt_val
out 8, @0
ret
