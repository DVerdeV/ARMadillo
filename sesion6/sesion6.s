@ Calculate average mark
@ In -> 4 variables (int): nota1, nota2, nota3, nota4
@ Out -> 1 variable (int): media

.data
nota1: .word 7
nota2: .word 8
nota3: .word 6
nota4: .word 5
media: .word 0

.text
start:
	ldr r1, =nota1
	ldr r2, =nota2
	ldr r3, =nota3
	ldr r4, =nota4
	ldr r1, [r1]
	ldr r2, [r2]
	ldr r3, [r3]
	ldr r4, [r4]
	ldr r0, =media
	mov r5, #0
sum:
    add r5, r1, r2
    add r5, r5, r3
    add r5, r5, r4
division:
	lsr r5, r5, #2
	str r5, [r0]
exit:
	bx lr