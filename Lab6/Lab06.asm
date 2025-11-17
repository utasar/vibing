; local variables
; #-1: a
; #-2: b
; #-3: c
; =-=-=-=-=-=-=-=

; - - - - - - - - -

; b = a would be:
LDR R0, R5, #-1
STR R0, R5, #-2

; b = &a is:
ADD R0, R5, #-1
STR R0, R5, #-2

; - - - - - - - - -

; b = 6 would be:
AND R0, R0, #0
ADD R0, R0, #6
STR R0, R5, #-2

; *b = 6 is:
AND R0, R0, #0
ADD R0, R0, #6
LDR R1, R5, #-2
STR R0, R1, #0

; - - - - - - - - -

; c = b would be:
LDR R0, R5, #-2
STR R0, R5, #-3

; c = *b is:
LDR R0, R5, #-2
LDR R0, R0, #0
STR R0, R5, #-3
