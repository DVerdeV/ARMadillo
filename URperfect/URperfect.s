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
	bx lr


URperfect:
loop:	
	bx lr
