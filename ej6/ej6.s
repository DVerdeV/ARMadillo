 .data
 numel:      .word 8
 vect:       .word 64,25,9,23,56,77,87,100
 res:        .word 0

 .text
 .global main
 main:       push {lr}
             ldr r0, =vect          @ load addres in r0
             ldr r1, =numel          
             ldr r1, [r1]           @ load number of elements into r1
             ldr r4, =res           @ load address result into r4
             bl evencount           @ call function
             str r0, [r4] 
             pop {lr}
             bx lr                  @ Finish program
            
 iseven:     @ Code to check if the number is even or not.
             @ evencount should call this code. You do not have to modify
             mov r1, r0
             mov r2, #1
             and r3, r2, r1
             eor r0, r3, #1
             bx lr
  
 evencount:
            @ r0 address of the vector
            @ r1 number of elements
            @ r0 return the number of even elements

            push {r5}
            mov r5, #0
 loop:
            ldr r2, [r0], #4
            push {r0}
            mov r0, r2
            push {r1, lr}
            bl iseven
            pop {r1, lr}
            cmp r0, #1
            pop {r0}
            beq even
            b restartloop
 even:
            add r5, r5, #1
 restartloop:
            cmp r1, #1
            beq return
            subs r1, r1, #1
            b loop
return:
            mov r0, r5
            pop {r5}
            bx lr
