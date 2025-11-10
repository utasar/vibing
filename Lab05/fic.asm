; Lab05.asm - Recursive Fibonacci using Runtime Stack
; Name: Utsav Acharya
; Course: 3310
; Date: 11/09/2025
.ORIG x3000

LD R6, STACK_PTR			;	LOAD the pointer to the bottom of the stack in R6	(R6 = x6000)
LEA R4, GLOBAL_VARS			;	MAKE your global var pointer R4 point to globals	(R4 = ADDRESS(GLOBAL_VARS))

;;;;;; GLOBALS ;;;;;;
LEA R0, PROMPT_STR 
STR R0, R4, #0
ADD R4, R4, #1

LEA R0, FUNC_BEGIN
STR R0, R4, #0
ADD R4, R4, #1

LEA R0, FUNC_END
STR R0, R4, #0
ADD R4, R4, #1

LEA R0, NL
STR R0, R4, #0
ADD R4, R4, #1

LD R0, N_ASCII
STR R0, R4, #0
;;;;;;;;;;;;;;;;;;;;;

MAIN
    ADD R6, R6, #-1		; R6 = x5FFF
    STR R7, R6, #0		; main return address (R7)

    ADD R6, R6, #-1		; R6 = x5FFE
    ADD R5, R6, #0		; R5 = R6 = x5FFE
    STR R5, R6, #0		; previous frame pointer (R5)
    
    ; setting frame pointer (R5)
    ADD R5, R6, #0		; R5 = R6 = x5FFE

    ; Prompt user
    LDR R0, R4, #-4
    PUTS

    ; Get user input
    ; int n = scanf - 48
    ADD R6, R6, #-1     ; R6 = x5FFD

    GETC
    OUT
    LDR R1, R4, #0      ; -48
    ADD R0, R0, R1

    STR R0, R6, #0

    ; int result;
    ADD R6, R6, #-1     ; R6 = x5FFC

    ;;;;;; FIBONACCI SETUP ;;;;;;
        ADD R6, R6, #-1     ; R6 = x5FFB
        LDR R0, R6, #2      ; R0 = n
        STR R0, R6, #0      ; param int n

        JSR FIBONACCI       ; R6 = x5FFA    ; return address

    ADD R6, R6, #2          ; R6 = x5FFC
    LDR R0, R6, #-2         ; result = FIBONACCI(n);
    STR R0, R6, #0

    ;;;;;; PRINT CHARS ;;;;;;
        LDR R0, R4, #-1      ; \n
        PUTS

        LDR R0, R4, #-3
        PUTS                ; F(

        LDR R0, R6, #1      ; int n
        LDR R1, R4, #0      ; -48
        NOT R1, R1
        ADD R1, R1, #1
        ADD R0, R0, R1
        OUT                 ; n
        
        LDR R0, R4, #-2    ; ) = 
        PUTS

    ;;;;;; PRINT SETUP ;;;;;;
        ADD R6, R6, #-1     ; R6 = x5FFB
        LDR R0, R6, #1      ; R6 = x5FFC
        STR R0, R6, #0      ; param int input = result
        JSR PRINT

    LDR R0, R4, #-1
    PUTS

ADD R6, R6, #2  ; x5FFC -> x5FFE
LDR R0, R6, #-2 ; x5FFE -> x5FFC
STR R0, R6, #2  ; x5FFE -> x6000

LDR R5, R6, #0
ADD R6, R6, #1  ; x5FFF
LDR R7, R6, #0
ADD R6, R6, #1  ; x6000
HALT

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; params int input
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; May the one reading this forgive me for my pasta code :D
PRINT
    ;;;;;; INIT ;;;;;;
        ADD R6, R6, #-1
        STR R7, R6, #0  ; return address

        ADD R6, R6, #-1
        STR R5, R6, #0	; previous frame pointer (R5)

    ADD R6, R6, #-1
    AND R0, R0, #0
    STR R0, R6, #0  ; int i

    LD R1, N_ASCII
    NOT R1, R1
    ADD R1, R1, #1  ; -48

    LDR R0, R6, #3  ; int input
    ADD R0, R0, #-10
    BRn SKIP_10
    BRnzp FOR_I

    FOR_I   ; for (int i = 0; i < 10; i++)
        LDR R0, R6, #0
        ADD R0, R0, #1
        STR R0, R6, #0

        LDR R0, R6, #3  ; int input
        ADD R0, R0, #-10
        STR R0, R6, #3

        ADD R0, R0, #-10
        BRp FOR_I

    LDR R0, R6, #0 ; 10s place
    ADD R0, R0, R1
    OUT

    SKIP_10
        ADD R6, R6, #1  ; pop i
        LDR R0, R6, #2  ; 1s place
        ADD R0, R0, R1
        OUT

    BRnzp PRINT_CLEANUP

    ;;;;;; CLEANUP ;;;;;;
    PRINT_CLEANUP
        LDR R5, R6, #0
        ADD R6, R6, #1
        LDR R7, R6, #0
        ADD R6, R6, #2  ; pop param
RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; params int n
; returns fib(n - 1) + fib(n - 2)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
FIBONACCI
    ;;;;;; INIT ;;;;;;
        ADD R6, R6, #-1 ; return value

        ADD R6, R6, #-1
        STR R7, R6, #0	; sum of squares return address (R7)

        ADD R6, R6, #-1
        STR R5, R6, #0	; previous frame pointer (R5)

    LDR R0, R6, #3  ; int n;
    ADD R0, R0, #-1

    ; if (n <= 1)
        BRn IF_N_LE_1
    ; else
        BRnzp ELSE

    IF_N_LE_1
        LDR R0, R6, #3
        STR R0, R6, #2
        BRnzp FIBONACCI_CLEANUP
    ELSE
        ;;;;;; FIBONACCI SETUP ;;;;;;
            ADD R6, R6, #-1 ; param int n
            LDR R0, R6, #4
            ADD R0, R0, #-1 ; n - 1
            STR R0, R6, #0  ; param int n;

            JSR FIBONACCI   ; return address param int n - 1

        ADD R6, R6, #2
        LDR R0, R6, #-2 ; (n - 1) result
        STR R0, R6, #2  ; result

        LDR R0, R6, #3  ; int n
        ADD R0, R0, #-2
        BRn IF_N_LE_1

        ;;;;;; FIBONACCI SETUP ;;;;;;
            ADD R6, R6, #-1
            LDR R0, R6, #4
            ADD R0, R0, #-2 ; n - 2
            STR R0, R6, #0  ; param int n;

            JSR FIBONACCI   ; return address param int n - 1
        ADD R6, R6, #2
        LDR R0, R6, #-2 ; (n - 2) result
        LDR R1, R6, #2  ; result

        ADD R1, R1, R0
        STR R1, R6, #2  ; result += F(n - 2)

        BRnzp FIBONACCI_CLEANUP

    ;;;;;; CLEANUP ;;;;;;
    FIBONACCI_CLEANUP
        LDR R5, R6, #0
        ADD R6, R6, #1
        LDR R7, R6, #0
        ADD R6, R6, #1  ; result
RET

GLOBAL_VARS		.BLKW #5	;	Global variables start here
STACK_PTR		.FILL x6000	;	STACK_PTR is a pointer to the bottom of the stack (x6000)
PROMPT_STR .STRINGZ "Enter a number n: "
FUNC_BEGIN .STRINGZ "F("
FUNC_END .STRINGZ  ") = "
NL .STRINGZ "\n"
N_ASCII .FILL #-48

.END
