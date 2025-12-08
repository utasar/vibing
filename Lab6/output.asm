
        .ORIG x5000
; TRAP x41 — print decimal number in R0 (0..99)

TRAP41
    ST R1, S1
    ST R7, S7

    AND R1, R1, #0     ; R1 = tens count

DIV10_LOOP
    ADD R0, R0, #-10
    BRn DIV10_DONE
    ADD R1, R1, #1
    BRnzp DIV10_LOOP

DIV10_DONE
    ADD R0, R0, #10    ; restore remainder (ones)

    LD R2, ASCII_0
    ADD R1, R1, R2     ; tens ASCII
    ADD R0, R0, R2     ; ones ASCII
    TRAP x21           ; OUT (tens)
    TRAP x21           ; OUT (ones)

    LD R1, S1
    LD R7, S7
    RET

ASCII_0 .FILL x0030
S1      .FILL x0000
S7      .FILL x0000
        .END
