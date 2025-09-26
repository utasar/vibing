; Program 1: z = x ^ y
; Stores result into x8000

.ORIG x3000

LD R0, VAR_X      ; R0 = x
LD R1, VAR_Y      ; R1 = y
AND R3, R3, #0    ; clear R3 (z result)
ADD R3, R3, #1    ; z = 1

EXP_LOOP
    BRz DONE      ; if y == 0, stop

    ; multiply z * x
    AND R4, R4, #0    ; product = 0
    ADD R2, R0, #0    ; temp = x

MULT_LOOP
    BRz END_MULT
    ADD R4, R4, R3    ; product += z
    ADD R2, R2, #-1   ; decrement x counter
    BRp MULT_LOOP

END_MULT
    ADD R3, R4, #0    ; z = product
    ADD R1, R1, #-1   ; y = y - 1
    BRp EXP_LOOP

DONE
LD R5, RESULT_ADDR
STR R3, R5, #0   ; store result at x8000
HALT

; Data
VAR_X .FILL #2
VAR_Y .FILL #3
RESULT_ADDR .FILL x8000

.END
