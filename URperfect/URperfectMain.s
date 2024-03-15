.data
res: .word 0
numel: .word 5
vec: .word 9,16,7,8,4

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
	push {r1-r3, lr}
	cmp r0, #0
	beq is
	blt isnt
	mov r1, #1
	loop:
		subs r0, r1
		beq is
		blt isnt
		add r1, #2
		b loop
	is:
		mov r0, #1
		b out
	isnt:
		mov r0, #0
		b out
	out:
		pop {r1-r3, lr}
		bx lr