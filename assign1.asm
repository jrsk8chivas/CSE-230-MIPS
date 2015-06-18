# Jose Herrera Medina
# CSE 230: M-F 10:10 am - 11:10 am
.data 
val1: .word 1 
val2: .word 2 
val3: .word 3
#Add name
var1: .asciiz "Jose"
#Prompt for input
var2: .asciiz "Enter a number"
#Create a new line
var3: .asciiz "\n" 
.globl main 
.text 
main:
#Step1
#set $s0 to 30
addi $s0, $0, 30
#Step 2
#prompt for 1st number
addi $v0, $zero, 4
lui $a0, 0x1001
addi $a0, $a0, 17
syscall
#put 1st number in $s1
addi $v0, $zero, 5
syscall
addi $s1, $v0,0
#Step 3
#prompt for 2nd number
addi $v0, $zero, 4
lui $a0, 0x1001
addi $a0, $a0, 17
syscall
#put 2nd number in $s2
addi $v0, $zero, 5
syscall
addi $s2, $v0, 0
#Step 4
#store $s1 in val1
lui $t0, 0x1001
sw $s1, 0($t0)
#Step 5
#store $s2 in val2
sw $s2, 4($t0)
#Step 6
#subtract $s1 from $s0 ---> store in $t1
sub $t1, $s0, $s1
#add $s2 - 4 ---> store in $t2
addi $t2, $s2, -4
#add $t2 + $t1 ---> store in $t3
add $t3, $t2, $t1
sw $t3, 8($t0)
#Step 7
#print name
addi $v0, $zero, 4
lui, $a0, 0x1001
addi $a0, $a0, 12
syscall
#new line
addi $v0, $zero, 4		
lui $a0, 0x1001			
addi $a0, $a0, 32		
syscall	
#print val1
addi $v0, $zero, 1
lui $a0, 0x1001
lw $a0, 0($a0)
syscall
#next line
addi $v0, $zero, 4
lui $a0, 0x1001
addi $a0, $a0, 32
syscall
#print val2
addi $v0, $zero, 1
lui $a0, 0x1001
lw $a0, 4($a0)			
syscall
#next line
addi $v0, $zero, 4
lui $a0, 0x1001
addi $a0, $a0, 32
syscall
#print val3
addi $v0, $zero, 1
lui $a0, 0x1001
lw $a0, 8($a0)
syscall
#Step 8
#add 1 to val2
lui $t0, 0x1001
lw $t1, 4($t0)
addi $t1, $t1, 1
sw $t1, 4($t0)
#Step 9
#Exchange or swap the values in val1 and val2
lw $t2, 0($t0)
sw $t1, 0($t0)
sw $t2, 4($t0)
#Step 10
#Set the value in $s0 to –$s0 
sub $s0, $zero, $s0
#Step 11
#next line
addi $v0, $zero, 4
lui $a0, 0x1001
addi $a0, $a0, 32
syscall
#print $s0
addi $v0, $zero, 1
addi $a0, $s0, 0
syscall
#next line
addi $v0, $zero, 4
lui $a0, 0x1001
addi $a0, $a0, 32
syscall
#print $s1
addi $v0, $zero, 1
addi $a0, $s1, 0
syscall
#next line
addi $v0, $zero, 4
lui $a0, 0x1001
addi $a0, $a0, 32
syscall
#print $s2
addi $v0, $zero, 1
addi $a0, $s2, 0
syscall
#end program
addi $v0, $zero, 10
syscall