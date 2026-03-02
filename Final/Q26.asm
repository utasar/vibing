    .ORIG	x3000

LOAD
	LEA	R2, STRNG1      ; Loads the address of STRNG1

LOOP	
    GETC				; Get character using GETC function call
    OUT					; Print the character using the OUT function call

    ; Check for a linefeed using the following steps: 
    AND R1, R1, #0		; Clear R1
    ADD R1, R1, #-10	; Decrement R1 by #-10 (#-13 on the UNIX desktop sim)
    ADD R1, R1, R0		; Compare R1 and R0 and store the result in R1 (If they are equal, R1 will be 0)
    BRz DONE			; Branch to DONE if zero (if not the program will continue down)

    ; If the result is not zero, do the following steps: 
    LD R1, OFFSET
    ADD R0, R0, R1
    STR R0, R2, #0		; Store the character in R0 at the address of R2 + #0
    ADD R2, R2, #1		; Increment R2 by #1
    BR LOOP				; Unconditional branch back to loop

DONE    
    AND R1, R1, #0	; Clear R1
    STR R1, R2, #0	; Store contents of R1 at the address of R2 + #0. (This adds the null character to the end of the string)
    LEA R0, OUT1    ; Loads the address of OUT1
    PUTS
    LEA R0, STRNG1  ; Loads the address of STRNG1
    PUTS
    LD R0, LF
    OUT
    BR LOAD

LF		.FILL		x0A			; A linefeed character
OFFSET  .FILL       #-32
STRNG1	.BLKW		#80			; Room for 79 characters (unpacked) + NULL
OUT1	.STRINGZ	"You entered: "

	.END
