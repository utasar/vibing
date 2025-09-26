; Program 3: If-Else check (R0 = R1 ? R3=5 : R3=-5)
; Stores result into x8002

.ORIG x3000

LD R0, VAL0
LD R1, VAL1

NOT R2, R1
ADD R2, R2, #1
ADD R2, R2, R0    ; R2 = R0 - R1

BRz EQUAL         ; if R0 = R1
BRnp NOTEQUAL

EQUAL
    AND R3, R3, #0
    ADD R3, R3, #5
    BRnzp STORE

NOTEQUAL
    AND R3, R3, #0
    ADD R3, R3, #-5

STORE
LD R4, RESULT_ADDR
STR R3, R4, #0    ; store result at x8002
HALT

; Data
VAL0 .FILL #7
VAL1 .FILL #7
RESULT_ADDR .FILL x8002

.END
