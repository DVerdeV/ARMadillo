.data
res: .word 0
numel: .word 4
vec: .word 9,7,0,4
.text
main: ldr r5, =numel
	ldr r5, [r5]
	ldr r4, =vec
	....
	bl URperfect
	....
	ldr r2, =res
	str r8,[r2]
	bx lr

	@ variable to store the result
	@ number of elements in vector
	@ call URperfect

URperfect:
loop:
	
	bx lr
@ declares function URperfect
@
@ the while probably
@
@ jump to address in link register lr (r14)