lw $s0, 8($zero)
lw $s1, 4($zero)
or $s2, $zero, $zero
loop:
addi $s0, $s0, 3
sw $s0, 0($zero)
beq $s2, $zero, loop
