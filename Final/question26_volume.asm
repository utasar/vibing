; =========================================
; Question 26
; Pass 3 integers using runtime stack
; volume(x, y, z) = x * y * z
; return -1 if result < 1
; =========================================

.ORIG x3000

        LD R6, STACK_TOP

        ; push z = 7
        ADD R6, R6, #-1
        AND R0, R0, #0
        ADD R0, R0, #7
        STR R0, R6, #0

        ; push y = 4
        ADD R6, R6, #-1
        AND R0, R0, #0
        ADD R0, R0, #4
        STR R0, R6, #0

        ; push x = 2
        ADD R6, R6, #-1
        AND R0, R0, #0
        ADD R0, R0, #2
        STR R0, R6, #0

        ; call function
        JSR VOLUME

        HALT

; -----------------------------------------

VOLUME
        ; load x, y, z
        LDR R0, R6, #0    ; x
        LDR R1, R6, #1    ; y
        LDR R2, R6, #2    ; z

        ; v = x
        ADD R3, R0, #0

        ; v = x * y
        ADD R4, R1, #0
MULT_Y
        BRz CONT_Z
        ADD R3, R3, R0
        ADD R4, R4, #-1
        BR MULT_Y

CONT_Z
        ADD R4, R2, #0
        ADD R5, R3, #0

MULT_Z
        BRz CHECK
        ADD R3, R3, R5
        ADD R4, R4, #-1
        BR MULT_Z

CHECK
        ADD R3, R3, #0
        BRp DONE
        AND R3, R3, #0
        ADD R3, R3, #-1   ; return -1

DONE
        STR R3, R6, #0
        RET

STACK_TOP .FILL x6000
.END
