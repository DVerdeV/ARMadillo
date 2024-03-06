.data
res: .word 0
numel: .word 4
vec: .word 9,7,0,4
.text
main: ldr r5, =numel
	ldr r5, [r5]
	ldr r4, =vec
	
	@ ....
	bl URperfect
	@ ....
	
	ldr r2, =res
	str r8,[r2]
	bx lr

	@ variable to store the result
	@ number of elements in vector
	@ call URperfect

URperfect:

	cmp r0, #0
	blt notPerfect

	mov r1, #0

findSqrt:

	add r1, r1, #1
	mul r2, r1, r1
	cmp r2, r0
	blt findSqrt
	beq isPerfect
	mov r0, #0
	mov pc, lr

notPerfect:

	mov r0, #0
	mov pc, lr

isPerfect:

	mov r0, #1
	mov pc, lr

loop:
	
	bx lr
@ declares function URperfect
@
@ the while probably
@
@ jump to address in link register lr (r14)