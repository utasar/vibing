.ORIG x3000

; #~#~#~#~#~#~#~#~#
; =-=-=-=-=-=-=-=-=
; INITIALIZER CODE
; # DO NOT TOUCH #
; - - - - - - - - -
LD R6, STACK_PTR ; load stack pointer
LEA R4, STATIC_STORAGE ; load global vars pointer
ADD R5, R6, #0 ; set frame pointer
; current stack pointer is sitting on main's return slot
; there are no arguments to our main function
JSR MAIN
HALT
; SETUP VARS
STACK_PTR .FILL x6000
STATIC_STORAGE
; - - - - - - - - -
; PUT .FILL GLOBALS HERE
; - - - - - - - - -
; INITIALIZER OVER
; =-=-=-=-=-=-=-=-=
; #~#~#~#~#~#~#~#~#



; #~#~#~#~#~#~#~#~#
; =-=-=-=-=-=-=-=-=
MAIN;(void)

; push return address
ADD R6, R6, #-1
STR R7, R6, #0

; push previous frame pointer
ADD R6, R6, #-1
STR R5, R6, #0

; set current frame pointer
ADD R5, R6, #0

; allocate local variables
; - - - - - - - - -
; local variables here
; - - - - - - - - -
ADD R6, R6, #0 ; create 0 spaces on the stack (uninitialized)
; =-=-=-=-=-=-=-=-=

; CODE GOES HERE

; =-=-=-=-=-=-=-=-=
; deallocate local variables
ADD R6, R6, #0

; restore and pop previous frame pointer
LDR R5, R6, #0
ADD R6, R6, #1

; restore and pop return address
LDR R7, R6, #0
ADD R6, R6, #1

; return to caller
RET
; =-=-=-=-=-=-=-=-=
; #~#~#~#~#~#~#~#~#



; #~#~#~#~#~#~#~#~#
; =-=-=-=-=-=-=-=-=
; T(n) = 3*T(n-1) - 3*T(n-2) + T(n-3)
TRINGLE;(int n: #2) -> int

; push return address
ADD R6, R6, #-1
STR R7, R6, #0

; push previous frame pointer
ADD R6, R6, #-1
STR R5, R6, #0

; set current frame pointer
ADD R5, R6, #0

; allocate local variables
; - - - - - - - - -
; #-1: result
; - - - - - - - - -
ADD R6, R6, #-1 ; create 0 spaces on the stack (uninitialized)
; =-=-=-=-=-=-=-=-=

; if (n == 0)
LDR R0, R5, #2 ; load n
BRnp SKIP_BASE_CASE_0
LD R0, ONE
BRnzp RETURN_FROM_TRINGLE
SKIP_BASE_CASE_0

; if (n == 1)
LDR R0, R5, #2 ; load n
ADD R0, R0, #-1 ; subtract 1
BRnp SKIP_BASE_CASE_1
LD R0, THREE
BRnzp RETURN_FROM_TRINGLE
SKIP_BASE_CASE_1

; if (n == 2)
LDR R0, R5, #2 ; load n
ADD R0, R0, #-2 ; subtract 2
BRnp SKIP_BASE_CASE_2
LD R0, SIX
BRnzp RETURN_FROM_TRINGLE
SKIP_BASE_CASE_2

; T(n-1)
LDR R0, R5, #2; load n
ADD R0, R0, #-1; n-1
ADD R6, R6, #-1
STR R0, R6, #0 ; push argument n-1
JSR TRINGLE
ADD R6, R6, #1 ; pop argument

; multiply return value by 3
ADD R6, R6, #-1
STR R0, R6, #0 ; push return value
ADD R6, R6, #-1
LD R1, THREE ; get a 3
STR R1, R6, #0 ; push 3
JSR MULT
ADD R6, R6, #2 ; pop arguments

STR R0, R5, #-1 ; result = 3*T(n-1)

; T(n-2)
LDR R0, R5, #2; load n
ADD R0, R0, #-2; n-2
ADD R6, R6, #-1
STR R0, R6, #0 ; push argument n-2
JSR TRINGLE
ADD R6, R6, #1 ; pop argument

; multiply return value by 3
ADD R6, R6, #-1
STR R0, R6, #0 ; push return value
ADD R6, R6, #-1
LD R1, THREE ; get a 3
STR R1, R6, #0 ; push 3
JSR MULT
ADD R6, R6, #2 ; pop arguments

NOT R0, R0
ADD R0, R0, #1 ; -3*T(n-2)
LDR R1, R5, #-1 ; load result
ADD R0, R0, R1 ; 3*T(n-1) - 3*T(n-2)
STR R0, R5, #-1 ; store into result

; T(n-3)
LDR R0, R5, #2; load n
ADD R0, R0, #-3; n-3
ADD R6, R6, #-1
STR R0, R6, #0 ; push argument n-3
JSR TRINGLE
ADD R6, R6, #1 ; pop argument

LDR R1, R5, #-1 ; load result
ADD R0, R0, R1 ; add T(n-3) to it
STR R0, R5, #-1 ; store back into result

; =-=-=-=-=-=-=-=-=
RETURN_FROM_TRINGLE
; deallocate local variables
ADD R6, R6, #1

; restore and pop previous frame pointer
LDR R5, R6, #0
ADD R6, R6, #1

; restore and pop return address
LDR R7, R6, #0
ADD R6, R6, #1

; return to caller
RET

ONE .FILL #1
THREE .FILL #3
SIX .FILL #6
; =-=-=-=-=-=-=-=-=
; #~#~#~#~#~#~#~#~#



; #~#~#~#~#~#~#~#~#
; =-=-=-=-=-=-=-=-=
MULT;(int a: #3, int b: #2) -> int

; push return address
ADD R6, R6, #-1
STR R7, R6, #0

; push previous frame pointer
ADD R6, R6, #-1
STR R5, R6, #0

; set current frame pointer
ADD R5, R6, #0

; allocate local variables
; - - - - - - - - -
; local variables here
; - - - - - - - - -
ADD R6, R6, #0 ; create 0 spaces on the stack (uninitialized)
; =-=-=-=-=-=-=-=-=

; CODE GOES HERE

; =-=-=-=-=-=-=-=-=
; deallocate local variables
ADD R6, R6, #0

; restore and pop previous frame pointer
LDR R5, R6, #0
ADD R6, R6, #1

; restore and pop return address
LDR R7, R6, #0
ADD R6, R6, #1

; return to caller
RET
; =-=-=-=-=-=-=-=-=
; #~#~#~#~#~#~#~#~#

.END
