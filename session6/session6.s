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
sum:
    add r0, r1, r2
    add r0, r0, r3
    add r0, r0, r4
division:
	lsr r0, r0, #2
exit:
	bx lr