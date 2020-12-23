lw $s0, 8($zero)
lw $s1, 4($zero)
or $s2, $zero, $zero
loop:
add $s0, $s1, $s0
sw $s0, 0($zero)
j loop
