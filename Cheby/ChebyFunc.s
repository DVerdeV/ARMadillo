@ CHEBY FUNCTION



.data
res: .word 0

.text
main: mov r0, #0
    mov r1, #1
    mov r2, #2
    mov r3, #3
    push {lr}
    bl Cheby
    pop {lr}
    ldr r2, =res
    str r0,[r2]
    bx lr
abs: 
    mov r1, #0
    mov r2, r0
    cmp r2, r1
    mov r3, #0
    sublt r0, r1, r0
    mov pc, lr

    @ 4 args: xi (r0), yi (r1), xj (r2), yj (r3)
    @ 1 return: distance (r0)
Cheby:
    
    
    push {lr}
    @ Subtract xi from xj
    sub r0, r0, r2
    @ Subtract yi from yj
    sub r1, r1, r3

    push {r1, r2, r3}

    bl abs 
    
    pop {r1, r2, r3}

    mov r4, r0

    mov r0, r1

    bl abs

    mov r5, r0

    @ r4 abs x
    @ r5 abs y

    cmp r4, r5

    blt less

    mov r0, r4

    b end

less:

    mov r0, r5

    b end

end:
    pop {lr}
    
    bx lr

