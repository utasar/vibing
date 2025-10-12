; ====================================================
; CEG 3310/5310 – Lab 3: Simple Calculator
; Name: Utsav Acharya
; Description: A simple LC-3 calculator that adds,
; subtracts, and multiplies two positive numbers.
; ====================================================
.ORIG x3000
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
START
    LEA R0, PROMPT1		; Load the first number prompt and display to the user
    PUTS
    JSR GETNUM
    ST R0, NUM1

    LEA R0, PROMPT2		; Load the operation prompt and display to the user
    PUTS
    JSR GETOP
    ST R0, OP

    LD R0, NEWLINE
    OUT

    LEA R0, PROMPT3		; Load the second number prompt and display to the user
    PUTS
    JSR GETNUM
    ST R0, NUM2

    JSR CALC

    LEA R0, PROMPT4		; Load the results prompt and display to the user
    PUTS

    JSR DISPLAY

    LD R0, NEWLINE
    OUT

    BRnzp START

EQ .STRINGZ "="
PROMPT1 .STRINGZ "Enter first number (0 - 99): "
PROMPT2 .STRINGZ "Enter an operation (+, -, *): "
PROMPT3 .STRINGZ "Enter second number (0 - 99): "
PROMPT4 .STRINGZ "Result: "
NEWLINE .FILL x000A
NUM1 .BLKW #1
NUM2 .BLKW #1
OP .BLKW #1
RESULT .BLKW #1

ASCII_OFFSET .FILL #-48


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: none
; Output: R0 = number (with ascii [48] subtracted)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
GETNUM
    ; Save callee state
    ST R1, GETNUM_R1
    ST R2, GETNUM_R2
    ST R3, GETNUM_R3
    ST R7, GETNUM_R7

    ; R1 = Current number

    AND R1, R1, #0
    AND R2, R2, #0

    LD R2, ASCII_OFFSET

    GET_INPUT_UNTIL_NL
        ; Gets input
        GETC
        OUT

        ADD R0, R0, R2              ; R0 -= 48
        ADD R1, R1, #0
        BRz IS_FIRST_CHAR
        BRnzp ELSE

        IS_FIRST_CHAR
            ADD R0, R0, #0
            BRn GET_INPUT_UNTIL_NL
            BRz IS_ZERO

            ADD R1, R1, R0              ; R1 += R0

            BRnzp GET_INPUT_UNTIL_NL

            IS_ZERO
                ; When 0 is inputed, wont print newline so manually need to
                LD R0, NEWLINE
                OUT
                AND R0, R0, #0
                BRnzp FI

        ELSE        
            ADD R0, R0, #0
            BRn FI
        

        ; Multiply by 10 if not first char
        AND R3, R3, #0
        ADD R3, R1, #0
        AND R1, R1, #0
        MULTI_BASE_10
            ADD R1, R1, #10

            ADD R3, R3, #-1      ; i--
            BRp MULTI_BASE_10

        ADD R1, R1, R0

        BRnzp GET_INPUT_UNTIL_NL

    
    FI
        AND R0, R0, #0
        ADD R0, R1, #0

        ; Load callee
        LD R1, GETNUM_R1
        LD R2, GETNUM_R2
        LD R3, GETNUM_R3
        LD R7, GETNUM_R7
RET
; GETNUM variables
GETNUM_R1 .FILL #0
GETNUM_R2 .FILL #0
GETNUM_R3 .FILL #0
GETNUM_R7 .BLKW #1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: none
; Output: R0 = operator (+/-/*)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
GETOP
    ; callee saves
    ST R7, GETOP_R7

    GETC
    OUT
    
    ; callee loads
    LD R7, GETOP_R7
RET
GETOP_R7 .BLKW #1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CALC
    ST R1, CALC_R1
    ST R2, CALC_R2
    ST R3, CALC_R3
    ST R4, CALC_R4
    ST R7, CALC_R7

    LD R1, NUM1
    LD R2, NUM2
    LD R3, OP    
    LD R4, ADD_SYM  ; * = -42, + = -43, - = -45
    
    AND R0, R0, #0
    ADD R4, R4, R3

    BRn MULTIPLY_NUMS
    BRz ADD_NUMS
    BRp SUBTRACT_NUMS

    MULTIPLY_NUMS
        LD R3, NUM2             ; i = num2
        BRz CALC_FI             ; case where num1 * 0 = 0

        INNER_LOOP_MULTIPLY
            ADD R0, R0, R1          ; R0 += R1
            
            ADD R3, R3, #-1         ; i--

            BRp INNER_LOOP_MULTIPLY ; Loops until R3 == 0
        BRnzp CALC_FI

    SUBTRACT_NUMS
        NOT R2, R2
        ADD R2, R2, #1
        BRnzp ADD_NUMS

    ADD_NUMS
        ADD R0, R1, R2
        BRnzp CALC_FI
    
    CALC_FI
        ST R0, RESULT
        LD R1, CALC_R1
        LD R2, CALC_R2
        LD R3, CALC_R3
        LD R4, CALC_R4
        LD R7, CALC_R7
RET
ADD_SYM .FILL #-43
CALC_R1 .FILL #0
CALC_R2 .FILL #0
CALC_R3 .FILL #0
CALC_R4 .FILL #0
CALC_R7 .BLKW #1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: none
; Output: none
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DISPLAY
    ST R7, DISPLAY_R7
    
    LD R0, NUM1
    JSR PRINT_DIGITS    ; num

    LD R0, OP
    OUT                 ; num op

    LD R0, NUM2         
    JSR PRINT_DIGITS    ; num op num

    LD R0, EQ
    OUT

    LD R0, RESULT
    JSR PRINT_DIGITS    ; num op num = result

    LD R7, DISPLAY_R7
RET
DISPLAY_R7 .BLKW #1
NEGATIVE_SIGN .STRINGZ "-"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: R0 = number to display
; Output: none
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PRINT_DIGITS    ; Make work for 4 digits
    ST R1, PRINT_DIGITS_R1
    ST R2, PRINT_DIGITS_R2
    ST R3, PRINT_DIGITS_R3
    ST R4, PRINT_DIGITS_R4
    ST R5, PRINT_DIGITS_R5
    ST R7, PRINT_DIGITS_R7

    ; R1 = result
    ; R2 = ASCII_OFFSET
    LD R2, ASCII_OFFSET
    NOT R2, R2
    ADD R2, R2, #1  ; R1 = 48

    ; Stores param R0 in R1 to print later
    AND R1, R1, #0
    ADD R1, R0, #0
    ; Checks to see if the number is negative or not
    BRzp DIVIDE_BASE_10
    
    ; Makes negative number positive
    NOT R1, R1
    ADD R1, R1, #1

    ; Prints '-' before number if negative
    LD R0, NEGATIVE_SIGN
    OUT

    BRnzp DIVIDE_BASE_10

    DIVIDE_BASE_10
        ; R0 = char to be printed
        ; R1 = result
        ; R2 = ASCII -> 48
        AND R3, R3, #0          ; i
        LD R4, NEG_1000         ; -10^n
        AND R5, R5, #0          ; is first 0

        INNER_DIVIDE_BASE_10
            ADD R3, R3, #1      ; i++
            ADD R1, R1, R4      ; R0 = result - 10^n
            BRzp INNER_DIVIDE_BASE_10

            NOT R0, R4
            ADD R0, R0, #1
            ADD R1, R1, R0      ; R1 += 10^n
            
            AND R0, R0, #0
            ADD R0, R3, #-1
            BRz IS_LEADING_ZERO
            BRnzp PRINT

            PRINT
                ADD R5, R5, #1
                ADD R0, R0, R2      ; char += 48
                OUT                 ; Prints char
                BRnzp IF_R4_EQ_100

            IS_LEADING_ZERO
                ADD R5, R5, #0
                BRnp PRINT

                BRnzp IF_R4_EQ_100

            IF_R4_EQ_100
                AND R3, R3, #0
                ; R4 = -100
                LD R0, NEG_100
                NOT R0, R0
                ADD R0, R0, #1
                ADD R0, R0, R4
                BRzp IF_R4_EQ_10
                LD R4, NEG_100
                BRnzp INNER_DIVIDE_BASE_10
            IF_R4_EQ_10
                ; R4 = -10
                AND R0, R0, #0
                ADD R0, R0, #10
                ADD R0, R0, R4
                BRzp IF_R4_EQ_1
                AND R4, R4, #0
                ADD R4, R4, #-10
                BRnzp INNER_DIVIDE_BASE_10
            IF_R4_EQ_1
                ; R4 = -1
                AND R0, R0, #0
                ADD R0, R0, #1
                ADD R0, R0, R4

                BRzp DIV_FI
                ADD R5, R5, #1
                AND R4, R4, #0
                ADD R4, R4, #-1
                BRnzp INNER_DIVIDE_BASE_10

    DIV_FI
        LD R1, PRINT_DIGITS_R1
        LD R2, PRINT_DIGITS_R2
        LD R3, PRINT_DIGITS_R3
        LD R4, PRINT_DIGITS_R4
        LD R5, PRINT_DIGITS_R5
        LD R7, PRINT_DIGITS_R7
RET
NEG_1000 .FILL #-1000
NEG_100 .FILL #-100

PRINT_DIGITS_R1 .FILL #0
PRINT_DIGITS_R2 .FILL #0
PRINT_DIGITS_R3 .FILL #0
PRINT_DIGITS_R4 .FILL #0
PRINT_DIGITS_R5 .FILL #0
PRINT_DIGITS_R7 .BLKW  #1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.END
