.data
fib: .word 0
n: .word 5

.text
start:
	ldr r0, =n
	ldr r0, [r0]
	ldr r4, =fib
	mov r1, #0
	mov r2, #1
loop:
	cmp r0, #0
	beq exit
	mov r3, r2
	add r2, r1, r2
	mov r1, r3
	sub r0, r0, #1
	b loop
exit: 
	str r1, [r4]
	bx lr