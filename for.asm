; Program 2: For loop adds 5 to R3 every iteration
; Stores result into x8001

.ORIG x3000

AND R3, R3, #0       ; R3 = 0
AND R2, R2, #0       ; counter = 0
LD R1, MAX_ITER      ; R1 = max iterations

LOOP
    ADD R3, R3, #5   ; add 5 to R3
    ADD R2, R2, #1   ; counter++
    NOT R4, R1
    ADD R4, R4, #1
    ADD R4, R4, R2   ; check counter - max
    BRn LOOP         ; keep looping until equal

LD R5, RESULT_ADDR
STR R3, R5, #0       ; store result into x8001
HALT

; Data
MAX_ITER .FILL #4
RESULT_ADDR .FILL x8001

.END
