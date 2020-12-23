lw $s1, 4($zero)
lw $s2, 8($zero)
loop:
lw $t1, 0($s2)
add $s2, $s2, $s1
ori $s0, $t1, 2
sw $s0, 0($zero)
beq $zero, $zero, loop
