lw $s0, 8($zero)
lw $s1, 4($zero)
lw $s2, 0xC($zero)
loop:
add $s0, $s1, $s0
sw $s0, 0($zero)
jr $s2
