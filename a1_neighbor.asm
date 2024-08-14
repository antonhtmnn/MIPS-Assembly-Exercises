	#+ BITTE NICHT MODIFIZIEREN: Vorgabeabschnitt
	#+ ------------------------------------------

.data

test_neighbor_header: .asciiz "\nPos\toben\tlinks\tunten\trechts\n---\t----\t-----\t-----\t------\n"

.text

.eqv SYS_PUTSTR 4
.eqv SYS_PUTCHAR 11
.eqv SYS_PUTINT 1
.eqv SYS_EXIT 10

main:   
	li $v0, SYS_PUTSTR
	la $a0, test_neighbor_header
	syscall
	
	move $s0, $zero

test_neighbor_loop_position:

	li $v0, SYS_PUTINT
	move $a0, $s0
	syscall
	
	li $v0, SYS_PUTCHAR
	li $a0, '\t'
	syscall
	
	move $s1, $zero

test_neighbor_loop_direction:
	move $v0, $zero
	move $a0, $s0
	move $a1, $s1
	jal neighbor
	
	move $a0, $v0   
	li $v0, SYS_PUTINT
	syscall
	
	li $v0, SYS_PUTCHAR
	li $a0, '\t'
	syscall
	
	addi $s1, $s1, 1
	blt $s1, 4, test_neighbor_loop_direction

	li $v0, SYS_PUTCHAR
	li $a0, '\n'
	syscall

	addi $s0, $s0, 1
	blt $s0, 64, test_neighbor_loop_position

	li $v0, SYS_EXIT
	syscall

	#+ BITTE VERVOLLSTAENDIGEN: Persoenliche Angaben zur Hausaufgabe 
	#+ -------------------------------------------------------------

	# Vorname: Anton Qian Kun
	# Nachname: Hartmann
	# Matrikelnummer: 454346
	
	#+ Loesungsabschnitt
	#+ -----------------

# $a0 = pos
# $a1 = direction
neighbor:
	andi	$t0, $a0, 7							# $t0 = x_coordinate (bit 2 to 0 of pos)
	andi	$t1, $a0, 56						# $t1 = y_coordinate (bit 5 to 3 of pos)
	srl		$t1, $t1, 3							# normalize y_coordinate
	
	bne		$a1, $0, neighbor_if_left			# if (direction != above) goto label
	beq		$t1, $0, neighbor_if_no_neighbor	# if (y_coordinate == 0) goto label
	addi	$t1, $t1, -1						# calculate new y_coordinate for upper neighbor
	j		neighbor_calc_index

neighbor_if_left:
	bne		$a1, 1, neighbor_if_below			# if (direction != left) goto label
	beq		$t0, $0, neighbor_if_no_neighbor	# if (x_coordinate == 0) goto label
	addi	$t0, $t0, -1						# calculate new x_coordinate for left neighbor
	j		neighbor_calc_index

neighbor_if_below:
	bne		$a1, 2, neighbor_if_right			# if (direction != bellow) goto label
	beq		$t1, 7, neighbor_if_no_neighbor		# if (y_coordinate == 7) goto label
	addi	$t1, $t1, 1							# calculate new y_coordinate for lower neighbor
	j		neighbor_calc_index

neighbor_if_right:
	beq		$t0, 7, neighbor_if_no_neighbor		# if (x_coordinate == 7) goto label
	addi	$t0, $t0, 1							# calculate new x_coordinate for right neighbor
	j		neighbor_calc_index

neighbor_if_no_neighbor:
	li		$v0, -1
	jr		$ra

neighbor_calc_index:
	sll		$t1, $t1, 3							# y_coordinate *= 8
	add		$v0, $t1, $t0						# calculate index for neighbor
	jr		$ra
