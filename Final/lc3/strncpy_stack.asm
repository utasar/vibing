        .ORIG x30A9

        LD   R6, STACK_TOP

        LEA  R0, STR2
        ADD  R6, R6, #-1
        STR  R0, R6, #0

        LEA  R0, STR1
        ADD  R6, R6, #-1
        STR  R0, R6, #0

        JSR  STRNCPY

        AND  R0, R0, #0
        STR  R0, R6, #0
        HALT

STRNCPY
        LDR  R1, R6, #0
        LDR  R2, R6, #1
        AND  R3, R3, #0

COPY
        ADD  R5, R1, R3
        LDR  R4, R5, #0
        BRz  DONE

        ADD  R5, R2, R3
        STR  R4, R5, #0

        ADD  R3, R3, #1
        BR   COPY

DONE
        ADD  R5, R2, R3
        AND  R4, R4, #0
        STR  R4, R5, #0

        ADD  R0, R2, #0
        RET

STR1       .STRINGZ "Hello World"
STR2       .BLKW #13
STACK_TOP .FILL x6000

        .END
