.global InitList
InitList:
	sw	$zero, 0($a0)
	jr	$ra

.global ClearList
ClearList:
	lw	$t0, 0($a0)
	sw	$zero, 0($a0)
loop:
	beq	$t0, $zero, endloop
	sw	$zero, 0($t0)
	lw	$t1, 4($t0)
	sw	$zero, 4($t0)
	or	$t0, $t1, $t1
	j loop
endloop:
	jr	$ra

.global AddItem
AddItem:
	lw	$t0, 0($a0)
	or	$t1, $a0, $a0
	sw	$zero, 4($a1)
nloop:
	beq	$t0, $zero, nendloop
	or	$t1, $t0, $t0
	addi	$t1, $t1, 4
	lw	$t0, 4($t0)
	j nloop
nendloop:
	sw	$a1, 0($t1)
	jr	$ra

.global RemoveItem
RemoveItem:
	lw	$t0, 0($a0)
	or	$t1, $a0, $a0
mloop:
	beq	$t0, $a1, mendloop
	or	$t1, $t0, $t0
	addi	$t1, $t1, 4
	lw	$t0, 4($t0)
	j	mloop
mendloop:
	lw	$t0, 4($a1)
	sw	$t0, 0($t1)
	lw	$v0, 0($a1)
	jr	$ra
