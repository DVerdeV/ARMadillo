.data
res: .word 0
.text
main:
	mov r1, #2 		@ first number to be compared to r1
	mov r2, #3 		@ second number to be compared to r2
	bl maximum 		@ call function maximum
	mov r1, r0 		@ move result from r0 to r1
	mov r2, #4 		@ third number to be compared in r2
	bl maximum 		@ call function maximum
	ldr r1, =res 	@ load result address into r1
	str r0, [r1] 	@ store result into res
	mov lr, #0 		@ let the main program stop in lr=0
	bx lr 			@ finish the main program

maximum:
	cmp r1, r2 		@ compares registers r1 and r2
	movgt r0, r1 	@ if r1>r2, copy in r0 the number in r1
	movle r0, r2 	@ if r1<=r2, copy in r0 the number in r2
	bx lr 			@ jump to address in link register lr (r14)
