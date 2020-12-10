.global f
f:
or $t0, $a0, $a0
or $t1, $a1, $a1
or $t2, $a2, $a2
add $t4, $zero, $zero
loop:
add $t5, $t4, $t1
lw $t6, 0($t5)
add $t5, $t4, $t2
lw $t7, 0($t5)
or $t6, $t6, $t7
add $t5, $t4, $t0
sw $t6, 0($t5)
addi $t4, $t4, 4
slti $t5, $t4, 20
bne $t5, $zero, loop
jr $ra
