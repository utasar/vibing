; Recursive Fibonacci (LC-3)
; main pushes a parameter (n=4) and calls FIBONACCI
; FIBONACCI is fully recursive; result returned in R0
; Stack pointer defined in STACK_PTR (.FILL x6000)

        .ORIG x3000

        ; initialize stack pointer
        LD   R6, STACK_PTR

; -------------------------
; main: push parameter and call fibonacci
; -------------------------
MAIN
        ; push parameter n = 4
        ADD  R6, R6, #-1
        AND  R0, R0, #0
        ADD  R0, R0, #4
        STR  R0, R6, #0

        JSR  FIBONACCI      ; call fib(4) -> result in R0

        HALT

; -------------------------
; fibonacci(n)
; Stack frame after prologue:
;   (FP)+0 = saved old R5
;   (FP)+1 = saved R7
;   (FP)+2 = parameter n
; Local pushes (below FP) used for saving intermediate results / pushing params
; -------------------------
FIBONACCI
        ; prologue: save R7 and R5, set new frame pointer
        ADD  R6, R6, #-1
        STR  R7, R6, #0        ; save return address

        ADD  R6, R6, #-1
        STR  R5, R6, #0        ; save old FP

        ADD  R5, R6, #0        ; set FP = R6

        ; load parameter n into R0
        LDR  R0, R5, #2        ; R0 = n

        ; if n < 2 -> base case, return n
        ADD  R1, R0, #-2
        BRn  FIB_BASE

        ; -------- recursive case ----------
        ; compute fib(n-1)
        ADD  R2, R0, #-1       ; R2 = n-1
        ADD  R6, R6, #-1
        STR  R2, R6, #0        ; push param (n-1)
        JSR  FIBONACCI
        ADD  R6, R6, #1        ; pop param
        ; push fib(n-1) result to preserve across next call
        ADD  R6, R6, #-1
        STR  R0, R6, #0

        ; compute fib(n-2)
        LDR  R3, R5, #2        ; R3 = n
        ADD  R3, R3, #-2       ; R3 = n-2
        ADD  R6, R6, #-1
        STR  R3, R6, #0        ; push param (n-2)
        JSR  FIBONACCI
        ADD  R6, R6, #1        ; pop param

        ; now R0 = fib(n-2), top of stack holds fib(n-1)
        LDR  R1, R6, #0        ; load fib(n-1)
        ADD  R0, R0, R1        ; R0 = fib(n-1) + fib(n-2)
        ADD  R6, R6, #1        ; pop saved fib(n-1)

        BRnzp FIB_EPILOG

FIB_BASE
        ; base case: R0 already contains n (0 or 1)
        BRnzp FIB_EPILOG

FIB_EPILOG
        ; epilogue: restore R5 and R7, return (R0 has result)
        LDR  R5, R6, #0
        ADD  R6, R6, #1
        LDR  R7, R6, #0
        ADD  R6, R6, #1
        RET

; -------------------------
; data
; -------------------------
STACK_PTR .FILL x6000

        .END
