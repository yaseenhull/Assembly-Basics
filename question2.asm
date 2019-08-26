# yaseen hull
# hllyas001
# question2.asm - reads a line of text, converts it to an integer and prints the integer
# Registers used:
#			$t0		-S
#			$t1		-the chracter pointed to by S
#			$t2		-the current sum

			.text
main:
			
			la $a0, input		#load the addr of input_msg into #a0
			li $v0, 4			#4 is the print_string syscall
			syscall
			
			la $a0, string_space	## read the string S
			li $a1, 1024			
			li $v0, 8				# load "read string" code into $v0
			syscall

			la $t0, string_space 	# initialize S
			li $t2, 0		# initialize sum = 0
			
			
			addu $t0, $t0, 1

sum_loop:
			lb $t1, ($t0)			# load the byte at addr S into $t1 and 
			addu $t0, $t0, 1		# increment S

			## use 10 instead of '\n' due to SPIM bug!
			beq $t1, 10, end_sum_loop

			mul $t2, $t2, 10		# t2 = t2 x 10

			sub $t1, $t1, '0'		# t1 = t1 - '0'
			add $t2, $t2, $t1		# t2 = t1 + t2

			b 	sum_loop

end_sum_loop:
			la $a0, output		#load the addr of out into #a0
			li $v0, 4		#4 is the print_string syscall
			syscall
			
			addu $t2, $t2, 5
			move $a0, $t2		# print out the answer $t2
			li $v0, 1
			syscall
			

exit:
			li $v0, 10
			syscall

			.data
newline:			.asciiz "\n"
string_space:			.space 1024
input:				.asciiz "Enter a string:\n"
output:				.asciiz "The value +5 is:\n"

#end
