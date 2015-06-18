# Jose Herrera Medina
# CSE 230: M-F 10:10 am - 11:10 am

.data 
input1: .word 1
input2: .word 2
name: .asciiz "Jose Herrera M"
prompt: .asciiz "Please enter a number "
nl: .asciiz "\n"
space: .asciiz " "
endMessage: .asciiz "Program complete"
.globl main 
.text 
main:
#Step 1 (print name)
addi $v0, $zero, 4			#put command to print string into $vo
lui $s0, 0x1001				#initializes $a0 to start of .data
addi $a0, $s0, 8			#puts the name pointer into $a0 to be printed
syscall					#prints name 

#Step 2 (prompt and read two integers)

#new line
addi $v0, $zero, 4			#put command to print string into $vo
addi $a0, $s0, 46			#add new line prompt to value $s0
syscall					#prints new line

#new line
addi $v0, $zero, 4			#put command to print string into $vo
addi $a0, $s0, 46			#add new line prompt to value $s0
syscall					#prints new line

#prompt for 1st number
addi $v0, $zero, 4			#put command to print string into $vo
addi $a0, $s0, 23			#puts the prompt pointer into $a0 to be printed
syscall					#prints the prompt

#put 1st number in $s1
addi $v0, $zero, 5			#puts the command to read an integer into $v0
syscall					#executes command to read a number
addi $s1, $v0, 0			#puts the read value into register $s1

#prompt for 2nd number		
addi $v0, $zero, 4			#put command to print string into $vo
addi $a0, $s0, 23			#puts the prompt pointer into $a0 to be printed
syscall					#prints the prompt

#put 2nd number in $s2
addi $v0, $zero, 5			#puts the command to read an integer into $v0
syscall					#executes command to read a number
addi $s2, $v0, 0			#puts the read value into register $s2

#Step 3
addi $t1, $s1, 0			#adds value of $s1 to $t1
addi $t2, $s2, 0			#adds value of $s1 to $t1
slt $t3, $t1, $t2			#sets $t2 less than $t1
addi $t1, $t1, -1			#decreases $t1 by 1
bne $t3, $zero, goUp			#check if $t3 is not equal to 0
addi $t1, $t1, 2			#increase $t1 by 2

#prints if first number is bigger
#prints from larger number down
goDown: addi $t1, $t1, -1		#decreases $t1 by 1
	beq $t1, $t2, end		#check if $t1 and $t2 are equal if so goes to end
	
	addi $v0, $zero, 1		#set command to print
	addi $a0, $t1, 0		#sets $a0 equal to what is in $t1
	syscall				#print command
	
	#space
	addi $v0, $zero, 4		#put command to print string into $vo
	addi $a0, $s0, 48		#puts the space pointer into $a0 to be printed
	syscall				#prints space

	j goDown			#loop

#prints if second number is bigger
#prints from small to larger number 
goUp:   addi $t1, $t1, 1		#increases $t1 by 1
	beq $t1, $t2, end		#check if $t1 and $t2 are equal if so goes to end
	
	addi $v0, $zero, 1		#set command to print
	addi $a0, $t1, 0		#sets $a0 equal to what is in $t1
	syscall				#print command
	
	#space
	addi $v0, $zero, 4		#put command to print string into $vo
	addi $a0, $s0, 48		#puts the space pointer into $a0 to be printed
	syscall				#prints space

	j goUp

end: 	addi $v0, $zero, 1		
	addi $a0, $t1, 0
	syscall
#Step 4 (program complete message)

#new line
addi $v0, $zero, 4			#put command to print string into $vo
addi $a0, $s0, 46			#add new line prompt to value $s0
syscall					#prints new line
syscall					#prints new line

#complete message
addi $v0, $zero, 4			#put command to print string into $vo
addi $a0, $s0, 50			#puts the end message pointer into $a0 to be printed
syscall					#prints end message for program



