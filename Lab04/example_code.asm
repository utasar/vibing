.ORIG x3000

LD R6, STACK_PTR
ADD R5, R6, #0
LEA R4, STATIC_STORAGE

JSR MAIN

HALT
STACK_PTR .FILL x6000
STATIC_STORAGE
.FILL #5 ; size of 

MAIN

; push return address
ADD R6, R6, #-1
STR R7, R6, #0
; push frame pointer
ADD R6, R6, #-1
STR R5, R6, #0
; set frame pointer
ADD R5, R6, #0
; allocate local variables (2; uninitialized)
; #-1: total
; #-2: i
ADD R6, R6, #-2
; - - - - - - - - - -

; total = 1
LD R0, ONE
STR R0, R5, #-1

; i = 0
AND R0, R0, #0
STR R0, R5, #-2

LOOP_START
LDR R0, R5, #-2; i
LD R1, NEG_TEN ; -10
ADD R0, R0, R1 ; i - 10
BRzp LOOP_END ; exit if i >= 10

; total += 4
LDR R0, R5, #-1
LD R1, FOUR
ADD R0, R0, R1
STR R0, R5, #-1

; push parameter
LDR R0, R5, #-1 ; grab total
ADD R6, R6, #-1 ; make space
STR R0, R6, #0 ; put it there

JSR FOO ; call the function

; pop parameter
ADD R6, R6, #1

; i++
LDR R0, R5, #-2
ADD R0, R0, #1
STR R0, R5, #-2

BRnzp LOOP_START
LOOP_END

; - - - - - - - - - -
; pop local variables
ADD R6, R6, #2
; restore previous frame pointer
LDR R5, R6, #0
ADD R6, R6, #1
; restore return address
LDR R7, R6, #0
ADD R6, R6, #1

RET
ONE .FILL #1
NEG_TEN .FILL #-10
FOUR .FILL #4


FOO

; push return address
ADD R6, R6, #-1
STR R7, R6, #0
; push frame pointer
ADD R6, R6, #-1
STR R5, R6, #0
; set frame pointer
ADD R5, R6, #0
; - - - - - - - - - -

; n += 1
LDR R0, R5, #2
ADD R0, R0, #1
STR R0, R5, #2

; - - - - - - - - - -
; restore previous frame pointer
LDR R5, R6, #0
ADD R6, R6, #1
; restore return address
LDR R7, R6, #0
ADD R6, R6, #1

RET



.END
