.global f
f:
nop
	or 	$s3, $a2, $a2
	or	$t0,	$zero,	1
	or	$s0,	$zero,	$zero
	add	$s2,	$a0,	$a1
	slt	$s1, $a0,	$a1
	bne	$s1,	$zero,	loop
	add	$a0,	$a0,	$a1
	sub	$s2,	$a1,	$a0
loop:
	slti	$s1, $t0,	11
	beq	$s1, $zero, endloop
	add	$s0,	$s0,	$a0
	add $a0, $a0, $a0
	addi	$t0,	$t0,	1
	j loop
endloop:
	sw	$s0,	16($s3)
	or	$v0,	$a0,	$a0
	jr $ra
