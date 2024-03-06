.data
@tam: number of elements in the vector
tam: .word 8
@pos: position of an element in the vector
pos: .word 0
@vector: vector of integers
vector: .word 2, -3, 6, 5, -4, 8, 1, 0
@val: value to be found in the vector
val: .word -4

.text
start:
    ldr r1, =tam
    ldr r2, =vector
    ldr r3, =val
    ldr r4, =pos
    ldr r1, [r1]
    ldr r3, [r3]
    ldr r4, [r4]
    mov r6, #0
loop:
    cmp r5, r1
    beq not_found
    @ load the value to another register another register and compare
    ldr r5, [r2]
    cmp r3, r5
    beq found
    add r2, r2, #4
    add r6, r6, #1
    b loop
not_found:
    mov r4, #-1
	bx lr
found:
    mov r4, r6
    add r4, r4, #1
    bx lr