.ORIG x3000

LD R0, VAR_X
LD R1, VAR_Y

; check if y is at least 3 greater than x

; -x
NOT R0, R0
ADD R0, R0, #1

; y - x
ADD R0, R0, R1

; subtract 3
ADD R0, R0, #-3

; >= 0
BRzp IT_IS
BRnzp IT_IS_NOT

IT_IS
LEA R0, TRUE_MSG
PUTS
BRnzp END_IF

IT_IS_NOT
LEA R0, FALSE_MSG
PUTS
BRnzp END_IF

END_IF

HALT

VAR_X .FILL #10
VAR_Y .FILL #7

TRUE_MSG .STRINGz "TRUE!"
FALSE_MSG .STRINGz "FALSE!"

.END