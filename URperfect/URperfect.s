.data
res: .word 0
numel: .word 4
vec: .word 9,7,0,4

@ sumPerfect : sum of the elements that are PS
@ nrPerfect: number of elements that are PS
@ maxperfect: element with maximum value which is PS, etc.

.text
main: 
	ldr r5, =numel
	ldr r5, [r5]
	ldr r4, =vec
	mov r8, #0 @ sumPerfect
	mov r9, #0 @ nrPerfect
	mov r7, #0 @ maxperfect
while:
	cmp r5, #0
	beq endwhile
	ldr r0, [r4]
	push {lr}
	bl URperfect
	pop {lr}
	sub r5, r5, #1
	cmp r0, #0
	beq currentNotPerfect
currentPerfect:
	ldr r0, [r4], #4
	add r8, r8, r0
	add r9, r9, #1
	cmp r7, r0
	blt max
	b while
max:
	mov r7, r0
	b while
currentNotPerfect:
	add r4, r4, #4
	b while
endwhile:
	ldr r2, =res
	str r8, [r2]
	str r9, [r2, #4]
	str r7, [r2, #8]
	bx lr

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