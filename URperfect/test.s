.global _start

_start:
    // Test 1: Check if 16 is a perfect square
    mov r0, #16
    bl URperfect
    // Now r0 contains the result (1 for perfect square, 0 for not perfect square)
    // You can check the result here, for example by branching to a label or stopping the execution

    // Test 2: Check if 20 is a perfect square
    mov r0, #20
    bl URperfect
    // Check the result as needed

    // Test 3: Check if 25 is a perfect square
    mov r0, #25
    bl URperfect
    // Check the result as needed

    // End of tests - stop execution (infinite loop)
    b .

URperfect:
    cmp r0, #0
    blt notPerfect

    mov r1, #0

findSqrt:
    add r1, r1, #1
    mul r2, r1, r1
    cmp r2, r0
    blt findSqrt
    beq isPerfect

notPerfect:
    mov r0, #0
    mov pc, lr

isPerfect:
    mov r0, #1
    mov pc, lr
