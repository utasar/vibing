# Ready-to-Use Code Snippets

## Loop Template
AND R1, R1, #0      ; counter = 0
LD  R2, MAX         ; load limit
LOOP
    ; Loop body here
    ADD R1, R1, #1  ; increment
    NOT R3, R2
    ADD R3, R3, #1  ; R3 = -MAX
    ADD R3, R1, R3  ; counter - MAX
    BRn LOOP        ; continue if < MAX

## If-Else Template
LD R0, VALUE
BRp POSITIVE
BRz ZERO
; Negative case
BRnzp DONE
POSITIVE
    ; Positive case
    BRnzp DONE
ZERO
    ; Zero case
DONE

## String Length Subroutine
; Input: R0 = string address
; Output: R1 = length
STRLEN
    AND R1, R1, #0  ; length = 0
    ADD R2, R0, #0  ; pointer
LOOP LDR R3, R2, #0 ; get char
     BRz DONE       ; null terminator?
     ADD R1, R1, #1 ; increment length
     ADD R2, R2, #1 ; next char
     BRnzp LOOP
DONE RET
