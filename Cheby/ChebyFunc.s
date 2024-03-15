Cheby:
    push {r4-r5, lr}
    @ Subtract xi from xj
    sub r0, r0, r2
    @ Subtract yi from yj
    sub r1, r1, r3
    push {r1-r3, lr}
    bl abs 
    pop {r1-r3, lr}
    mov r4, r0
    mov r0, r1
    bl abs
    mov r5, r0
    cmp r4, r5
    blt less
    mov r0, r4
    b end
less:
    mov r0, r5
    b end
end:
    pop {r4-r5, lr}
    bx lr