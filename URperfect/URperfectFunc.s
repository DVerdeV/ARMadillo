URperfect:
	push {r4-r6}
	cmp r0, #0
	blt notPerfect
	mov r1, #0
findSqrt:
	add r1, r1, #1
	push {r2, lr}
	bl Multiply
	mov r4, r2
	pop {r2, lr}
	cmp r4, r0
	blt findSqrt
	beq isPerfect
	mov r0, #0
notPerfect:
	mov r0, #0
	b return
isPerfect:
	mov r0, #1
return:
	pop {r4-r6}
	bx lr

;
Multiply:
	push {r6, r7}
	mov r6, r1
	mov r7, #0
whilemultiplication:
	cmp r6, #0
	beq endwhilemultiplication
	add r7, r7, r1
	sub r6, r6, #1
	b whilemultiplication
endwhilemultiplication:
	mov r2, r7
	pop {r6, r7}
	bx lr