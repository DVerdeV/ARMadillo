.data
tam: .word 8
pos: .word 0
vector: .word 2, -3, 6, 5, -4, 8, 1, 0
val: .word 9

.text
.global main
main: 
    ldr r1, =tam
    ldr r2, =vector
    ldr r3, =val
    ldr r4, =pos
    ldr r1, [r1]
    ldr r3, [r3]
    mov r6, #0
loop:
    cmp r6, r1
    beq not_found
    @ load the value to another register another register and compare
    ldr r5, [r2]
    cmp r3, r5
    beq exit
    add r2, r2, #4
    add r6, r6, #1
    b loop
not_found:
    mov r6, #-1
exit:
    str r6, [r4]
    bx lr