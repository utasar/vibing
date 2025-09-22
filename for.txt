.ORIG x3000
; Program 2: For loop
; Adds 5 to R3 every iteration
; Loop counter starts at 0 and stops at max iterations
; Result stored in x8001

    AND R3, R3, #0        ; R3 = 0 (accumulator)
    AND R2, R2, #0        ; R2 = loop counter = 0
    LD R1, MAX_ITER       ; R1 = maximum iterations

LOOP
    ADD R3, R3, #5        ; R3 = R3 + 5
    ADD R2, R2, #1        ; increment loop counter

    NOT R4, R1            ; R4 = -R1
    ADD R4, R4, #1
    ADD R4, R2, R4        ; R4 = R2 - R1
    BRn LOOP              ; if counter < max → keep looping

    ST R3, RESULT         ; store final result at x8001
    HALT

; -------------------------
; Memory
; -------------------------
MAX_ITER .FILL #6         ; maximum iterations (changeable)
RESULT   .FILL x8001      ; result stored here

.END
