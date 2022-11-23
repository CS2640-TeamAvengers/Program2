.macro printString(%str)
	li $v0, 4
	la $a0, %str
	syscall
		
.end_macro

.macro printInt(%x)
	li $v0, 1
	add $a0, $zero %x
	syscall
.end_macro

.macro exit
	li $v0, 10
	syscall
.end_macro



.data
	intro1: .asciiz "This program asks the user to unput a value for 'x' and 'y'.\n"
	intro2: .asciiz "Then, it finds the value of x to the power of y.\n"
	intro3: .asciiz "For example, 2 to the power of 3 is 8.\n\n"
	Xinput: .asciiz "Enter a number for 'x': "
	Yinput: .asciiz "Enter a number for 'y': "
	output: .asciiz "\n\n'x' to the power of 'y' is: "
	
.text
main:

	printString(intro1)
	printString(intro2)
	printString(intro3)
	
	printString(Xinput)
	#get x input 
	li $v0, 5
	syscall
	
	#store x in $s0
	move $s0, $v0
	
	printString(Yinput)
	#get y input 
	li $v0, 5
	syscall
	
	#store y in $s1
	move $s1, $v0

	li $t0, 1 #$t0 is for counter
	la $t1, ($s0)
	
	printString(output)
	
	
	beq $s1, $zero, printResult0
	beq $s1, 1, printAnswer
	bgt $s1, $zero, loop
	
	exit
	

loop:
	mul $s0, $s0, $t1 
	addi $t0, $t0, 1
	
	beq $t0, $s1, printAnswer #if counter equal 'y' then print the answer
	blt $t0, $s1, loop	#if counter is less that 'y' loop again 
	

	
printAnswer:
	printInt($s0)
	exit
	
printResult0:
	printInt(1)
	exit
	
exit:
	exit
	
