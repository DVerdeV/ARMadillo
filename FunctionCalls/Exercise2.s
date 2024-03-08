.data
res: .word 0 @ variable to store result
.text
main:
	mov r0, #-1 	@ first number
	mov r1, #3 		@ second number
	mov r2, #5 		@ third number
	mov r3, #-9 	@ fourth number
	bl maximum2 	@ call function maximum2
	ldr r1, =res 	@ load address variable res
	str r0, [r1] 	@ store return value
	mov lr, #0 
	bx lr 			@ finish main program
 

maximum2: 			@ function maximum2 starts here
	cmp r0, r1 		@ compare r0 and r1
	movgt r0, r1 	@ if r0 > r1, r0 = r1
	cmp r0, r2 		@ compare r0 and r2
	movgt r0, r2 	@ if r0 > r2, r0 = r2
	cmp r0, r3 		@ compare r0 and r3
	movgt r0, r3 	@ if r0 > r3, r0 = r3
	bx lr 			@ return to main program