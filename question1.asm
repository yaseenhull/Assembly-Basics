# yaseen hull
# hllyas001
# question1.asm - store and print input values

		.text
main:
		la $a0, in_msg		#load the addr of in_msg into #a0
		li $v0, 4		#4 is the print_string syscall
		syscall
		
		la $a0, space
		li $a1, 4
		li $v0, 8
		syscall
		la $s0, space
		
		la $a0, space1
		li $a1, 4
		li $v0, 8
		syscall
		la $s1, space1
		
		la $a0, space2
		li $a1, 4
		li $v0, 8
		syscall
		la $s2, space2
		
		la $a0, space3
		li $a1, 4
		li $v0, 8
		syscall
		la $s3, space3
		
		la $a0, space4
		li $a1, 4
		li $v0, 8
		syscall
		la $s4, space4
		
		addi $t0, $zero, 0
		sw $s0, array($t0)
		addi $t0, $t0, 4
		sw $s1, array($t0)
		addi $t0, $t0, 4
		sw $s2, array($t0)
		addi $t0, $t0, 4
		sw $s3, array($t0)
		addi $t0, $t0, 4
		sw $s4, array($t0)
		
		addi $t0, $zero, 0
		li $t3, 0
		
		la $a0, out_msg		#load the addr of out_msg into #a0
		li $v0, 4		#4 is the print_string syscall
		syscall
		
loop:
		
		beq $t3, 5, end
		lw $t1, array($t0)
			
		addi $t3, $t3, 1
		add $t0, $t0, 4
		
		li $v0, 4
		move $a0, $t1
		syscall
		
		#addi $t2, $t2, 1
		
		b loop
		


	
	
end:

		
		li $v0, 10
		syscall
	
	

				
		.data
space:			.space 4
space1:			.space 4
space2:			.space 4
space3:			.space 4
space4:			.space 4
array:			.space 24
in_msg:			.asciiz "Enter a series of 5 formulae:\n"
out_msg:		.asciiz "The values are:\n"