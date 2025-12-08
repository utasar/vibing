.ORIG x3000

LD R6, STACK_BASE
ADD R6, R6, #-1
STR R7, R6, #0
ADD R6, R6, #-1
STR R5, R6, #0
ADD R5, R6, #0

; node_t *head = 0
ADD R6, R6, #-1
AND R0, R0, #0
STR R0, R6, #0

; char selection
ADD R6, R6, #-1

LOOP
    LDR R0, R5, #-2
    LD R1, Q
    NOT R1, R1
    ADD R1, R1, #1
    ADD R1, R0, R1
    BRz DONE

    LEA R0, MENU
    PUTS

    GETC
    STR R0, R5, #-2

    LD R1, P
    NOT R1, R1
    ADD R1, R1, #1
    ADD R1, R0, R1
    BRnp CHECK_A

    LEA R0, PRINT_MSG
    PUTS
    BR LOOP

CHECK_A
    LD R1, A
    NOT R1, R1
    ADD R1, R1, #1
    ADD R1, R0, R1
    BRnp CHECK_R

    LEA R0, ADD_MSG
    PUTS
    TRAP x40
    BR LOOP

CHECK_R
    LD R1, R
    NOT R1, R1
    ADD R1, R1, #1
    ADD R1, R0, R1
    BRnp LOOP

    LEA R0, REMOVE_MSG
    PUTS
    TRAP x40
    BR LOOP

DONE
    ADD R6, R6, #2
    LDR R5, R6, #0
    ADD R6, R6, #1
    LDR R7, R6, #0
    ADD R6, R6, #1
    HALT

STACK_BASE .FILL x6000
P .FILL x0070
A .FILL x0061
R .FILL x0072
Q .FILL x0071

MENU .STRINGZ "p-print a-add r-remove q-quit: "
PRINT_MSG .STRINGZ "\nPrint\n"
ADD_MSG .STRINGZ "\nAdd value: "
REMOVE_MSG .STRINGZ "\nRemove value: "
.END
