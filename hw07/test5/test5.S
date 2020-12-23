lw $s0, 4($zero)
lw $s1, 8($zero)
loop:
sll $s0, 2
sw $s0, 0($zero)
beq $s1, $s0, done
beq $zero, $zero, loop
done:
beq $s1, $s0, done
