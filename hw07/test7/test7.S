lw $s1, 4($zero)
lw $s2, 8($zero)
lw $s3, 0xc($zero)
loop:
sw $s1, 0($zero)
add $s1, $s1, $s2
bne $s3, $s1, 0
sw $s3, 0($zero)
loop2:
beq $zero, $zero, loop2
