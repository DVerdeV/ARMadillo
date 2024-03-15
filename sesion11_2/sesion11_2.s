; .data
;  leds: .word 1, 2, 4, 8, 16, 32, 64, 128, 256, 512
;  numel: .word 10
;  .text
;  main:
;    push {lr}
;    ldr r0, =leds
;    ldr r1, =numel
;    ldr r1, [r1]

;    bl ledseq

;    pop {lr}
;    bx lr



ledseq:
	push {r4-r6, lr}
	mov r6, #1
	mov r2, r0 //start pos
	mov r4, #0 //index
loop:
	cmp r4, r1
	beq restart
	ldr r3, [r0], #4
	
	push {r0}
	mov r0, r3
	bl setLEDsStatus
	pop {r0}
buttonLoop:
	push {r0}
	bl buttons
	mov r5, r0
	pop {r0}
	cmp r5, #1
	beq push
	cmp r5, r6
	beq release
	cmp r5, #3
	beq end
	b buttonLoop
push:
	mov r6, #0
	b buttonLoop
release:
	mov r6, #1
	add r4, r4, #1
	b loop
restart:
	mov r4, #0
	mov r0, r2
	b loop
next:
	add r4, #1
	b loop
end:
	pop {r4-r6, lr}
	bx lr



buttons:
	push {lr}
	
	mov r0, #3
	bl isButtonPressed
	cmp r0, #1
	beq endProgram

	mov r0, #0
	bl isButtonPressed
	cmp r0, #1
	beq continueProgram
	mov r0, #0
	b return
endProgram:
	mov r0, #3
	b return
continueProgram:
	mov r0, #1
return:
	pop {lr}
	bx lr
