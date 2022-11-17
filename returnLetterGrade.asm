#a way for the user to continue getting letter grades or exit
#invalid input handling (re prompt the user is invalid until a correct input is entered)

#Benen Kim
#Date: 11/09/22
#Objective: return a letter grade based on the int from the user

.data 
	userMenu: .asciiz "\n~~~~~~~~~~~~~~~ MAIN MENU ~~~~~~~~~~~~~~~\n(1)Get Letter Grade\n(2)Exit Program\n\nEnter '1' or '2' for your selection:"
	enterScore: .asciiz "\n-----------------------------------------\n\nPlease enter a score as an integer value: "
	gradeResult: .asciiz "\nThe grade is: "
	newScorePrompt: .asciiz "\n-----------------------------------------\n\nWould you like to enter a new score?\n(Y)Yes   (N)No\n\nEnter 'Y' or 'N' for your selection: "
	invalidInputMsg: .asciiz "\nGiven number is not in the range 0 - 100, please try again."
	exitPrompt: .asciiz "\nThe program will now exit."
	
.text 
	main:
		#print main menu
		li $v0, 4
		la $a0, userMenu
		syscall
		
		#getting user input
		li $v0, 5
		syscall
		move $s0, $v0
		beq $s0, 2, exit
		
		#print score prompt
		li $v0, 4
		la $a0, enterScore
		syscall
		
		#get user input
		li $v0, 5
		syscall
		move $s1, $v0
		
		#check if input is in valid range
		blt $s1, 0, invalidInput
		bgt $s1, 100, invalidInput
		#print grade
		j letterA
		
	invalidInput:
		li $v0, 4
		la $a0, invalidInputMsg
		syscall
		j main
		
	letterA:
		blt $s1, 90, letterB
		li $v0, 11
		li $a0, 'A'
		syscall
		j loop
		
	letterB:
		blt $s1, 80, letterC
		li $v0, 11
		li $a0, 'B'
		syscall
		j loop
		
	letterC: 
		blt $s1, 70, letterD
		li $v0, 11
		li $a0, 'C'
		syscall
		j loop
		
	letterD: 
		blt $s1, 60, letterF
		li $v0, 11
		li $a0, 'D'
		syscall
		j loop
		
	letterF:
		li $v0, 11
		li $a0, 'F'
		syscall
		j loop
		
		#for the main present main menu and enter the score
	loop:
		#ask user to try again
		li $v0, 4
		la $a0, newScorePrompt
		syscall
		
		#get user input
		li $v0, 12
		syscall
		move $s0, $v0
		
		beq $s0, 'Y', main
		beq $s0, 'y', main
		beq $s0, 'N', exit
		beq $s0, 'n', exit
		
		#once newScorePrompt is answered, jump to main:
		#keep looping until proper input is given.
	exit:
		li $v0, 4
		la $a0, exitPrompt
		syscall
		li $v0, 10
		syscall