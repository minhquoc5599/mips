.data
	DayOfWeek: .word cn, t2, t3, t4, t5, t6, t7
	CN: .asciiz " Chủ nhật"
	T2: .asciiz " Thứ hai"
	T3: .asciiz " Thứ ba"
	T4: .asciiz " Thứ tư"
	T5: .asciiz " Thứ năm"
	T6: .asciiz " Thứ sáu"
	T7: .asciiz " Thứ bảy"
	
	sub_output1_third_choice:	.asciiz 	"Ngay vua nhap la ngay thu "
	sub_output2_third_choice:	.asciiz		" trong tuan.\n"
	
	output_leap_yr:	.asciiz		"Nam nhap vao la nam nhuan.\n"
	output_n_lp_yr:	.asciiz		"Nam nhap vao khong phai la nam nhuan.\n"
.text
LeapYear: 
	addi $sp,$sp,-8
	sw $t1, 0($sp)
	sw $t0, 4($sp)
	
	
	li $t1, 400        # t1=400
	div $a0, $t1       #nam/400
	mfhi $t1           # so du
	beq $t1, $0, True  #neu so du = 0 -> true
	
	li $t1, 4
	div $a0, $t1       #nam/4
	mfhi $t1           # so du
	bne $t1, $0, False #neu so du != 0 -> false
	
	li $t1, 100
	div $a0, $t1  #nam/100
	mfhi $t1 # so du
	beq $t1, $0, False #du !=0, khong chia het cho 100, chia het cho 4 ->true 
	
	
	True:
	li $v1, 1 #true -> 1
	lw $t1, 0($sp)
	lw $t0, 4($sp)
	addi $sp,$sp,8
	jr $ra
	
	
	False:
	li $v1, 0 #false ->0
	lw $t1, 0($sp)
	lw $t0, 4($sp)
	addi $sp,$sp,8
	jr $ra
	
	
	
CheckLeapYear:

	jal year
	move $a0,$v1
	
	jal LeapYear
	li $t0,1
	beq $t0,$v1, Leap
	
	#Xuat 
	li $v0,4
	la $a0, output_n_lp_yr
	syscall
	j exit
Leap:
	li, $v0,4
	la,$a0, output_leap_yr
	syscall
	j exit

	
	
	
	
	

    	


