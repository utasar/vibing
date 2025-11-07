; Lab05.asm - Recursive Fibonacci using Runtime Stack
; Name: Utsav Acharya
; Course: 3310
; Date: 11/10/2025

        .orig x3000

; ===== MAIN =====
MAIN
        LD R6, STACK_START ; Initialize stack pointer at high memory

        LD R0, FIB_INPUT   ; n = 4
        JSR FIB            ; call fibonacci
        HALT               ; result in R5

; ===== FIBONACCI SUBROUTINE =====
; Input:  R0 = n
; Output: R5 = fib(n)

FIB
        ADD R6, R6, #-1
        STR R7, R6, #0     ; Save return address

        ADD R6, R6, #-1
        STR R0, R6, #0     ; Save input n

        ADD R6, R6, #-1
        STR R0, R6, #0     ; Local copy of n

        ; BASE CASE: if n < 2 return n
        ADD R4, R0, #-2
        BRn BASE_CASE

        ; Recursive case
        LDR R1, R6, #0     ; R1 = n

        ; fib(n-1)
        ADD R0, R1, #-1
        JSR FIB
        STR R5, R6, #-3    ; store fib(n-1)

        ; fib(n-2)
        ADD R0, R1, #-2
        JSR FIB
        LDR R2, R6, #-3    ; R2 = fib(n-1)
        ADD R5, R2, R5     ; fib(n-1)+fib(n-2)
        BR END_FIB

BASE_CASE
        ADD R5, R0, #0     ; return n

END_FIB
        LDR R0, R6, #0
        ADD R6, R6, #1

        LDR R0, R6, #0
        ADD R6, R6, #1

        LDR R7, R6, #0
        ADD R6, R6, #1

        RET

; ===== CONSTANTS =====
CONST_TWO    .fill #2
FIB_INPUT    .fill #4
STACK_START  .fill xF000

        .end
