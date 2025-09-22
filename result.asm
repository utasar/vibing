; Program 1: z = x^y
; x and y are stored in memory
; result goes to address x8000

.ORIG x3000

        LD R0, BASE      ; load x into R0
        LD R1, POWER     ; load y into R1
        AND R2, R2, #0   ; clear R2
        ADD R2, R2, #1   ; R2 = 1, starting result

CHECK   BRz DONE         ; if y = 0, go to DONE
        ADD R1, R1, #-1  ; y = y - 1
        JSR TIMES        ; multiply result * x
        BRnzp CHECK      ; loop until y = 0

DONE    STI R2, RESULT   ; store result at x8000
        HALT

; Subroutine: TIMES
; multiplies R2 = R2 * R0
; uses R3 and R4 as temp registers
TIMES   AND R3, R3, #0   ; product = 0
        ADD R4, R0, #0   ; copy x into R4

LOOPM   BRz FINISH       ; if x = 0, end multiply
        ADD R4, R4, #-1  ; decrease counter
        ADD R3, R3, R2   ; product += result
        BRnzp LOOPM

FINISH  ADD R2, R3, #0   ; update result
        RET

; Data section
BASE    .FILL #2         ; x = 2 (example)
POWER   .FILL #3         ; y = 3 (example)
RESULT  .FILL x8000      ; memory location to store result

.END
