.data
tam: .word 10
vector: .word -35, 2, 3, 45, -3, -90, -4, -67, 32, 44
pos: .word 0
val: .word -3

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
    cmp r6, r1
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
    bx lr