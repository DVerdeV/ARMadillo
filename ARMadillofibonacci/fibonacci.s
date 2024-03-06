.data
 mynumr:     .word 8
 res:        .word 0

 .text
 .global main
 main:       
 	ldr r1, =mynumr                      
	ldr r0, [r1]          
	ldr r4, =res

	push {lr}          
	bl fib
	pop {lr}
	str r0, [r4]          
	bx lr                  
            
 fib:     
	push {r7, r8, r9}
	mov r8, #0
	mov r9, #1
loop:
	cmp r0, #0
	beq return
	mov r7, r9
	add r9, r8, r9
	mov r8, r7
	sub r0, r0, #1
	b loop
return:
	mov r0, r8
	pop {r7, r8, r9}
	bx lr
