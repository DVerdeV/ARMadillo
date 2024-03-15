.data
	res: .word 0
	nump: .word 4
	a: .word 0
	b: .word 1
	D: .word 8
	vecX: .word 2,7,5,4
	vecY: .word 3,2,5,3
.text
main: 
	push {lr}
	ldr r0, =nump
	ldr r1, [r0]
	ldr r4, =a
	ldr r5, =b
	ldr r4, [r4]
	ldr r5, [r5]
	ldr r6, =vecX
	ldr r7, =vecY
	ldr r8, =res
loop:
	push {r0-r1}
	mov r0, r4
	mov r1, r5
	ldr r2, [r6], #4
	ldr r3, [r7], #4
	bl Cheby
	mov r3, r0
	pop {r0-r1}
	ldr r2, [r8]
	cmp r2, r3
	blt update
iterate:
	sub r1, r1, #1
	cmp r1, #0
	bne loop
	pop {lr}
	bx lr
update:
	str r3, [r8]
	b iterate

abs: 
	mov r1, #0
	mov r2, r0
	cmp r2, r1
	mov r3, #0
	sublt r0, r1, r0
	mov pc, lr

Cheby:
    push {r4-r5, lr}
    @ Subtract xi from xj
    sub r0, r0, r2
    @ Subtract yi from yj
    sub r1, r1, r3
    push {r1-r3, lr}
    bl abs 
    pop {r1-r3, lr}
    mov r4, r0
    mov r0, r1
    bl abs
    mov r5, r0
    cmp r4, r5
    blt less
    mov r0, r4
    b end
less:
    mov r0, r5
    b end
end:
    pop {r4-r5, lr}
    bx lr

