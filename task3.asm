#Assignment: exponenets

#Nam: Alexander Eckert
#Date: 11/22/22

.data

	msg: .asciiz "This programs computes 'x' to the power of 'y'.\n\n\nEnter a value for 'x': "
	msgCont: .asciiz "Enter a value for 'y': "
	msg2: .asciiz "'x' to the power of 'y' is: "
	
.text

	main:
		li $v0, 4
		la $a0, msg
		syscall
		
		li $v0, 5
		syscall
		move $s0, $v0
		
		li $v0, 4
		la $a0, msgCont
		syscall
		
		li $v0, 5
		syscall
		move $s1, $v0
	
		#loop counter
		li $t0, 2
		
		la $t1, ($s0)
		
		bge $s1, 1, loop
		
		li $s0, 1
		
		j exit
		
	loop:
		
		
		addi $t0, $t0, 1
		
		mul $s0, $s0, $t1
		
		ble $t0, $s1, loop
	
	exit:
		li $v0, 4
		la $a0, msg2
		syscall
		
		li $v0, 1
		move $a0, $s0
		syscall
		
		li $v0, 10
		syscall
