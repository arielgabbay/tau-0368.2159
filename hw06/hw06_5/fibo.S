#################################################
#         DO NOT MODIFY ABOVE THIS LINE         #
#################################################	
	
.global fib
fib: # variables modified: $a0, $t0, $v0
	addi $sp, $sp, -12

	or $v0, $a0, $a0
	beq $a0, $zero, just_ret
	ori $t0, $zero, 1
	beq $a0, $t0, just_ret
	
	sw $a0, 0($sp)
	sw $ra, 8($sp)

	addi $a0, $a0, -1
	jal fib
	sw $v0, 4($sp)

	lw $a0, 0($sp)
	addi $a0, $a0, -2
	jal fib
	lw $t0, 4($sp)
	add $v0, $v0, $t0

	lw $ra, 8($sp)
just_ret:
	addi $sp, $sp, 12
	jr $ra
