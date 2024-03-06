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
	mov r10, #0 @ maxperfect
while:
	cmp r5, #0
	beq endwhile
	bl URperfect
	subs r5, r5, #1
	cmp r0, #0
	beq notperfect
perfect:
	add r8, r8, r0
	add r9, r9, #1
	cmp r10, r0
	blt max
	b endcycle
max:
	mov r10, r0
endcycle:
	b endwhile
endwhile:
	ldr r2, =res
	str r8,[r2]
	str r9,[r2, #4]
	str r10,[r2, #8]
	bx lr
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