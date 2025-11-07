.ORIG x3000

; n! = n * (n-1)!
FACTORIAL;(#2: n int) -> int

ADD R6, R6, #-1
STR R7, R6, #0

ADD R6, R6, #-1
STR R5, R6, #0

ADD R5, R6, #0
; ================

LDR R0, R5, #2
BRnp SKIP_BASE_CASE
ADD R0, R0, #1
BRnzp RETURN_FROM_FACTORIAL
SKIP_BASE_CASE

LDR R0, R5, #2
ADD R0, R0, #-1
ADD R6, R6, #-1
STR R0, R6, #0
JSR FACTORIAL
ADD R6, R6, #1
; R0 = (n-1)!

LDR R1, R5, #2
ADD R6, R6, #-1
STR R0, R6, #0
ADD R6, R6, #-1
STR R1, R6, #0
JSR MULT
ADD R6, R6, #2
; R0 = n * (n-1)!

; ================
RETURN_FROM_FACTORIAL

LDR R5, R6, #0
ADD R6, R6, #1

LDR R7, R6, #0
ADD R6, R6, #1

RET

.END
