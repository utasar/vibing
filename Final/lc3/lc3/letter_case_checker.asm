        .ORIG x25AF

LOOP
        LEA  R0, PROMPT
        PUTS

        AND  R1, R1, #0
        AND  R2, R2, #0

READ
        GETC
        LD   R5, NEWLINE
        NOT  R5, R5
        ADD  R5, R5, #1
        ADD  R5, R0, R5
        BRz  CHECK
        OUT

        LD   R3, A_CHAR
        NOT  R3, R3
        ADD  R3, R3, #1
        ADD  R3, R0, R3
        BRn  MARK_UPPER

        LD   R3, Z_CHAR
        NOT  R3, R3
        ADD  R3, R3, #1
        ADD  R3, R0, R3
        BRp  MARK_UPPER

        ADD  R1, R1, #1
        BR   READ

MARK_UPPER
        ADD  R2, R2, #1
        BR   READ

CHECK
        ADD  R3, R1, #0
        BRz  ONLY_UPPER
        ADD  R3, R2, #0
        BRz  ONLY_LOWER

        LEA  R0, BOTH
        PUTS
        BR   LOOP

ONLY_UPPER
        LEA  R0, UPPERMSG
        PUTS
        BR   LOOP

ONLY_LOWER
        LEA  R0, LOWERMSG
        PUTS
        BR   LOOP

PROMPT    .STRINGZ "Please type something: "
LOWERMSG  .STRINGZ "You typed only lowercase letters\n"
UPPERMSG  .STRINGZ "You typed only uppercase letters\n"
BOTH      .STRINGZ "You typed uppercase and lowercase letters\n"

A_CHAR    .FILL x0061
Z_CHAR    .FILL x007A
NEWLINE   .FILL x000A

        .END
