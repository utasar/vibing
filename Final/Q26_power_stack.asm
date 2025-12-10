; Q26: pass two integers on the runtime stack, call power(x,y), return x^y,
; then store return value at the base of the stack (STACK_BASE).
; This program computes power(5,3) and places result at memory STACK_BASE.

        .ORIG x3000

        LD   R6, STACK_BASE    ; initialize stack pointer to STACK_BASE

        ; push return address (simulate call from main)
        ADD  R6, R6, #-1
        STR  R7, R6, #0

        ; push x = 5
        ADD  R6, R6, #-1
        AND  R0, R0, #0
        ADD  R0, R0, #5
        STR  R0, R6, #0

        ; push y = 3
        ADD  R6, R6, #-1
        AND  R0, R0, #0
        ADD  R0, R0, #3
        STR  R0, R6, #0

        JSR  POWER             ; call POWER
        ; on return: R0 contains result

        ; store return value at STACK_BASE (base address)
        LD   R1, STACK_BASE
        STR  R0, R1, #0

        HALT

; ----------------------
; POWER subroutine
; Stack layout at call:
;   [R6]     = y
;   [R6+1]   = x
;   [R6+2]   = return addr (from caller)
; POWER must read parameters without popping them (caller cleaned)
; returns result in R0
; ----------------------
POWER
        ; initialize result = 1
        AND  R4, R4, #0
        ADD  R4, R4, #1        ; R4 = result

        LDR  R5, R6, #0        ; R5 = y
        LDR  R3, R6, #1        ; R3 = x

        BRz  POWER_DONE        ; if y==0 -> result = 1

POWER_LOOP
        ; compute new_result = result * x
        ; implement multiply by repeated addition
        AND  R2, R2, #0        ; R2 = temp = 0
        ADD  R1, R3, #0        ; R1 = counter = x
MULT_LOOP
        BRz  MULT_DONE
        ADD  R2, R2, R4        ; temp += result
        ADD  R1, R1, #-1
        BRnzp MULT_LOOP
MULT_DONE
        ADD  R4, R2, #0        ; result = temp

        ADD  R5, R5, #-1       ; y--
        BRnzp POWER_LOOP

POWER_DONE
        AND  R0, R0, #0
        ADD  R0, R0, R4        ; R0 = result
        RET

STACK_BASE .FILL x6000
        .END
