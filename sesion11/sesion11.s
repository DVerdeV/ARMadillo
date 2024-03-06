.data
leds1: .word 0x201
leds2: .word 0x030

.text
main:
  push {lr}
  ldr r1, =leds1
  ldr r0, [r1]
  bl setLEDsStatus

loop:
  mov r0, #0
  bl isButtonPressed
  cmp r0, #1
  bne loop

  ldr r1, =leds2
  ldr r0, [r1]
  bl setLEDsStatus

  pop {lr}
  bx lr