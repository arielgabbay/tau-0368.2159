.global f
f:
or $t0, $zero, $zero
loop:
lw $t1, 0($a0)
lw $t2, 0($a1)
addi $a0, $a0, 4
addi $a1, $a1, 4
bne $t1, $t2, nequal
addi $t0, $t0, 1
bne $a2, $t0, loop
nequal: add $v0, $t0, $zero
jr $ra
