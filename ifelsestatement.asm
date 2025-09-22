.ORIG x3000
; Program 3: If-Else Statement
; If R0 == R1 → R3 = 5
; Else        → R3 = -5
; Store result in x8002

    LD R0, VAL0       ; Load first value
    LD R1, VAL1       ; Load second value

    ; Compare R0 and R1
    NOT R2, R1        ; R2 = -R1
    ADD R2, R2, #1
    ADD R2, R0, R2    ; R2 = R0 - R1

    BRz EQUAL         ; If zero → R0 == R1
    BRnp NOTEQUAL     ; Otherwise → R0 ≠ R1

EQUAL
    AND R3, R3, #0
    ADD R3, R3, #5    ; R3 = 5
    BRnzp STORE

NOTEQUAL
    AND R3, R3, #0
    ADD R3, R3, #-5   ; R3 = -5

STORE
    ST R3, RESULT     ; Save into memory x8002
    HALT

; -------------------------
; Memory
; -------------------------
VAL0   .FILL #7       ; first value
VAL1   .FILL #7       ; second value
RESULT .FILL x8002    ; memory address to store result

.END
