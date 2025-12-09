========================================
QUESTION 27 - Input Comparison Loop
========================================
Goal:
Prompt user for digit 0–9.
Compare to 5.
Print message.
Loop forever.

----------------------------------------
LC-3 ASSEMBLY SOLUTION
----------------------------------------

.ORIG x3000

START
        LEA R0, PROMPT
        PUTS

        GETC
        OUT

        LD R1, ASCII_0
        NOT R1, R1
        ADD R1, R1, #1
        ADD R0, R0, R1     ; convert ASCII to number

        ADD R1, R0, #-5
        BRn LESS
        BRz EQUAL

GREATER
        LEA R0, MSG_GREATER
        PUTS
        BR START

LESS
        LEA R0, MSG_LESS
        PUTS
        BR START

EQUAL
        LEA R0, MSG_EQUAL
        PUTS
        BR START

ASCII_0     .FILL x0030

PROMPT      .STRINGZ "\nPlease enter a number: "
MSG_LESS    .STRINGZ "The number you entered was less than 5!\n"
MSG_EQUAL   .STRINGZ "The number you entered was equal to 5!\n"
MSG_GREATER .STRINGZ "The number you entered was greater than 5!\n"

.END
