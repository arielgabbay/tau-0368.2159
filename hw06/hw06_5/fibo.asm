.data

inputMsg: .asciiz "Enter a number: "
msg: .asciiz "Calculating F(n) for n = "
fibNum: .asciiz "\nF(n) is: "
.text

main:

	li $v0, 4
	la $a0, inputMsg
	syscall

	# take input from user
	li $v0, 5
	syscall
	addi $a0, $v0, 0
	
	jal print_and_run
	
	# exit
	li $v0, 10
	syscall

print_and_run:
	addi $sp, $sp, -4
	sw $ra, ($sp)
	
	add $t0, $a0, $0 

	# print message
	li $v0, 4
	la $a0, msg
	syscall

	# take input and print to screen
	add $a0, $t0, $0
	li $v0, 1
	syscall

	jal fib

	addi $a1, $v0, 0
	li $v0, 4
	la $a0, fibNum
	syscall

	li $v0, 1
	addi $a0, $a1, 0
	syscall
	
	lw $ra, ($sp)
	addi $sp, $sp, 4
	jr $ra

#################################################
#         DO NOT MODIFY ABOVE THIS LINE         #
#################################################	
	
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
