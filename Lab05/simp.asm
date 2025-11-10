;====================================================
; Lab 5 – Recursive Fibonacci
; Name: Utsav Acharya
;====================================================

        .ORIG x3000

; System setup
LD   R6, STACK_PTR
ADD  R5, R6, #0
JSR  MAIN
HALT

STACK_PTR .FILL x6000

PROMPT    .STRINGZ "Enter n (0-9): "
OUT1      .STRINGZ "F("
OUT2      .STRINGZ ") = "
ASCII0    .FILL #48
NEWLINE   .STRINGZ "\n"

;====================================================
; MAIN()
;====================================================
MAIN
    ; Prologue
    ADD R6, R6, #-1
    STR R7, R6, #0
    ADD R6, R6, #-1
    STR R5, R6, #0
    ADD R5, R6, #0

    ; Print prompt
    LEA R0, PROMPT
    PUTS

    ; Get input digit (0–9 assumed)
    GETC
    OUT
    LD R1, ASCII0
    NOT R1, R1
    ADD R1, R1, #1
    ADD R0, R0, R1    ; convert ASCII → int
    STR R0, R5, #-1   ; store n

    ; Push argument & call FIB
    ADD R6, R6, #-1
    STR R0, R6, #0
    JSR FIB
    ADD R6, R6, #1
    STR R0, R5, #-2   ; store result

    ; Print result formatted
    LEA R0, OUT1
    PUTS
    LDR R0, R5, #-1
    LD  R1, ASCII0
    ADD R0, R0, R1
    OUT
    LEA R0, OUT2
    PUTS
    LDR R0, R5, #-2
    ADD R0, R0, R1
    OUT

    LEA R0, NEWLINE   ; newline
    PUTS

    ; Epilogue
    LDR R5, R6, #0
    ADD R6, R6, #1
    LDR R7, R6, #0
    ADD R6, R6, #1
    RET


;====================================================
; FIB(n) — Recursive Fibonacci
; Arg at FP+2
; Return in R0
;====================================================
FIB
    ; Prologue
    ADD R6, R6, #-1
    STR R7, R6, #0
    ADD R6, R6, #-1
    STR R5, R6, #0
    ADD R5, R6, #0

    LDR R0, R5, #2    ; load n

    ; Base case: n == 0 → return 0
    BRp CHECK1
    AND R0, R0, #0
    BR DONE

CHECK1
    ADD R1, R0, #-1
    BRp RECURSE       ; if n > 1 → recursive
    AND R0, R0, #0
    ADD R0, R0, #1    ; return 1
    BR DONE

RECURSE
    ; F(n-1)
    ADD R1, R0, #-1
    ADD R6, R6, #-1
    STR R1, R6, #0
    JSR FIB
    ADD R6, R6, #1
    ADD R2, R0, #0

    ; F(n-2)
    ADD R1, R1, #-1
    ADD R6, R6, #-1
    STR R1, R6, #0
    JSR FIB
    ADD R6, R6, #1

    ADD R0, R0, R2    ; sum

DONE
    ; Epilogue
    LDR R5, R6, #0
    ADD R6, R6, #1
    LDR R7, R6, #0
    ADD R6, R6, #1
    RET

        .END
