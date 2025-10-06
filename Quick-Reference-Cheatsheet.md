# LC3 Quick Reference

## TRAP Routines
- GETC (x20)    - Read char → R0, no echo
- OUT (x21)     - Output R0[7:0] to display  
- PUTS (x22)    - Output string (R0=address, null-terminated)
- IN (x23)      - Prompt + read + echo → R0
- HALT (x25)    - Stop execution

## Common Instructions
ADD  R1, R2, #5     ; Immediate
ADD  R1, R2, R3     ; Register
LD   R1, LABEL      ; PC-relative load
LDR  R1, R2, #3     ; Base+offset load
LEA  R1, LABEL      ; Load address
BR   LABEL          ; Branch
JSR  SUBROUTINE     ; Jump to subroutine
RET                 ; Return (JMP R7)

## Stack Frame (Callee-Saves)
; Prologue
ADD R6, R6, #-1    ; Push RA
STR R7, R6, #0
ADD R6, R6, #-1    ; Push FP  
STR R5, R6, #0
ADD R5, R6, #-1    ; Set new FP
ADD R6, R6, #-n    ; Allocate locals

; Epilogue
ADD R6, R5, #1     ; Deallocate
LDR R5, R6, #0     ; Restore FP
ADD R6, R6, #1
LDR R7, R6, #0     ; Restore RA
ADD R6, R6, #1
RET
