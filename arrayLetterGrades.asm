#Benen Kim
#Date: 11/09/22
#Objective: return a letter grade based on each element in an array
.data
	arr: .word 32, 56, 78, 66, 88, 90, 93, 100, 101, 82
	gradeMsg1: .asciiz "\nThe grade for "
	gradeMsg2: .asciiz " is: "
	extraCreditMsg: .asciiz "A with Extra Credit"
	exitMsg: .asciiz "\nThe program will now exit."
	
.text
	main:
		la $a0, arr
		
	loop:
		#getting the element at position $t0 and storing a copy in $t1
		lw $t1, arr($t0)
		
		#print first part of message
		li $v0, 4
		la $a0, gradeMsg1
		syscall
		
		#move whatever element was in current position $t1 to $a0
		li $v0, 1
		move $a0, $t1
		syscall
		
		#increase $t0 by 4 to go to the next element
		add $t0, $t0, 4
		
		#print part 2 and go to letter system
		li $v0, 4
		la $a0, gradeMsg2
		syscall
		
		j letterA
		
	extraCredit:
		li $v0, 4
		la $a0, extraCreditMsg
		syscall
		blt $t0, 40, loop
		j exit
		
	letterA:
		blt $t1, 90, letterB
		bgt $t1, 100, extraCredit
		li $v0, 11
		li $a0, 'A'
		syscall
		blt $t0, 40, loop
		j exit
		
	letterB:
		blt $t1, 80, letterC
		li $v0, 11
		li $a0, 'B'
		syscall
		blt $t0, 40, loop
		j exit
		
	letterC:
		blt $t1, 70, letterD
		li $v0, 11
		li $a0, 'C'
		syscall
		blt $t0, 40, loop
		j loop
		
	letterD:
		blt $t1, 60, letterF
		li $v0, 11
		li $a0, 'D'
		syscall
		blt $t0, 40, loop
		j exit
		
	letterF:
		li $v0, 11
		li $a0, 'F'
		syscall
		blt $t0, 40, loop
		j exit
	
	exit:
		li $v0, 4
		la $a0, exitMsg
		syscall
		
		li $v0, 10
		syscall
