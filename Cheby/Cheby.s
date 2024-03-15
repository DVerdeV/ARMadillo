.data
res: .word 0

.text
main: mov r0, #0
	mov r1, #1
	mov r2, #2
	mov r3, #3
	push {lr}
	bl Cheby
	pop {lr}
	ldr r2, =res
	str r0,[r2]
	bx lr
abs: 
	mov r1, #0
	mov r2, r0
	cmp r2, r1
	mov r3, #0
	sublt r0, r1, r0
	mov pc, lr
Cheby:
	bl abs 