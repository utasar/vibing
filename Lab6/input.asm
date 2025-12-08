        .ORIG x4000
; TRAP x40 — read two ASCII digits, return value in R0 (0..99)

TRAP40
    ST R1, S1
    ST R2, S2
    ST R3, S3
    ST R7, S7

    LD R3, ASCII_0

    ; read tens char, convert to numeric (char - '0')
    TRAP x23        ; GETC (char in R0)
    NOT R3, R3
    ADD R3, R3, #1  ; R3 = -'0'
    ADD R1, R0, R3  ; R1 = tens

    ; read ones char, convert to numeric
    LD R3, ASCII_0
    TRAP x23
    NOT R3, R3
    ADD R3, R3, #1
    ADD R2, R0, R3  ; R2 = ones

    ; compute R0 = tens*10 + ones using shifts/adds (no large immediates)
    AND R0, R0, #0      ; clear R0
    ADD R0, R1, R1      ; *2
    ADD R0, R0, R0      ; *4
    ADD R0, R0, R0      ; *8
    ADD R0, R0, R1      ; *9
    ADD R0, R0, R1      ; *10
    ADD R0, R0, R2      ; + ones

    LD R1, S1
    LD R2, S2
    LD R3, S3
    LD R7, S7
    RET

ASCII_0 .FILL x0030
S1      .FILL x0000
S2      .FILL x0000
S3      .FILL x0000
S7      .FILL x0000
        .END
