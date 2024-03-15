Cheby:
    push {r4-r5, lr}
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
    sub r1, r1, r3
    pop {r4-r5, pc}
    bx lr

