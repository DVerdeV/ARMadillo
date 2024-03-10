.data
leds: .word 1, 2, 4, 8, 16, 32, 64, 128, 256, 512
numel: .word 10

.text
main:
  push {lr}
  ldr r0, =leds
  ldr r1, =numel
  ldr r1, [r1]

  bl ledseq

  pop {lr}
  bx lr



ledseq:
	push {lr}
	mov r2, r0
loop:
	cmp r2, r1
	beq restart
	ldr r3, [r0], #4
	
	push {r0}
	ldr r0, r3
	bl setLEDsStatus
	pop {r0}

	bl buttons
	cmp r0, #1
	beq loop
	cmp r0, #3
	beq end

	b loop
restart:
	mov r0, r2
	b loop
end:
	pop {lr}
	bx lr



buttons:
	push {r0, lr}
	
	mov r0, #3
	bl isButtonPressed
	cmp r0, #1
	beq endProgram

	mov r0, #0
	bl isButtonPressed
	cmp r0, #1
	beq continueProgram
	b return
endProgram:
	pop {r0, lr}
	mov r0, #3
	bx lr
continueProgram:
	pop {r0, lr}
	mov r0, #1
	bx lr
return:
	pop {r0, lr}
	bx lr
