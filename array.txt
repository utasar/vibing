.ORIG x3000
; Program 4: Array input (0–9)
; Stores n user-entered numbers in an array

    LD R1, SIZE          ; R1 = array size (n)
    LEA R2, ARRAY        ; R2 = base address of array
    AND R3, R3, #0       ; R3 = loop counter
    LD R4, NEG_ASCII     ; R4 = -48 (for ASCII to int conversion)

ARRAY_LOOP
    ; Display prompt
    LEA R0, PROMPT
    PUTS

    ; Get character input
    GETC
    OUT                  ; echo character
    ADD R0, R0, R4       ; convert ASCII → integer (subtract 48)

    STR R0, R2, #0       ; store input in array
    ADD R2, R2, #1       ; move to next array index
    ADD R3, R3, #1       ; loop counter++

    NOT R5, R1
    ADD R5, R5, #1       ; R5 = -R1
    ADD R5, R3, R5       ; R5 = R3 - R1
    BRn ARRAY_LOOP       ; loop while R3 < R1

    HALT

; -------------------------
; Memory
; -------------------------
SIZE     .FILL #5                 ; array size (5 <= n <= 20)
ARRAY    .BLKW #20                ; reserve 20 words for array
NEG_ASCII .FILL #-48              ; used to subtract ASCII '0'
PROMPT   .STRINGZ "Enter a number (0-9): "
.END
