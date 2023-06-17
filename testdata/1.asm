.text
.globl _start

min = 0                          /* starting value for the loop index; note that this is a symbol (constant), not a variable */
max = 31                         /* loop exits when the index hits this number (loop condition is i<max) */

_start:

    mov     x19, min
    mov     x17, 10

loop:
    mov     x0, 1           /* file descriptor: 1 is stdout */
    adr     x1, msg         /* message location (memory address) */
    mov     x2, len         /* message length (bytes) */

    mov     x18, x19        /*mov x19 into x18 */
    udiv    x9, x18, x17
    add     x13, x9, 0x30
    msub    x10, x9, x17, x18 /*get remainder*/
    add     x14, x10, 0x30
    adr     x15, msg
    strb    w13, [x15, 13]

    strb    w14, [x15, 14]
    mov     x8, 64          /* write is syscall #64 */
    svc     0               /* invoke syscall */

    add     x19, x19, 1
    cmp     x19, max
    b.ne    loop

.data

msg:    .ascii      "Hello, World  #\n"
len=    . - msg
