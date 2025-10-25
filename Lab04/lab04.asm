; Name: Utsav Acharya
; Course: CEG 3310 – Computer Organization
; Lab 4 – C Programs in Assembly and the Runtime Stack
; Date: 26 October 2025
; Description:
;   This program replicates lab4.c in LC-3 assembly.
;   It computes the sum of squares of an array using subroutines,
;   a proper runtime stack, and nested function calls (main → SUMOFSQUARES → SQUARE).
; Expected result for array {2, 3, 5, 0, 1} = 39.


.ORIG x3000

LD R6, STACK_PTR			;	LOAD the pointer to the bottom of the stack in R6	(R6 = x6000)
LEA R4, GLOBAL_VARS			;	MAKE your global var pointer R4 point to globals	(R4 = ADDRESS(GLOBAL_VARS))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; GLOBAL VARS
LEA R0, MAX_ARRAY_SIZE
LDR R1, R4, #0
ADD R4, R4, #-1
STR R1, R4, #0
STR R0, R4, #0

LEA R0, ARRAY_POINTER
LDR R1, R4, #0
ADD R4, R4, #-1
STR R1, R4, #0
STR R0, R4, #0

; END GLOBAL VARS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MAIN START
ADD R6, R6, #-1		; R6 = x5FFF
STR R7, R6, #0		; main return address (R7)

ADD R6, R6, #-1		; R6 = x5FFE
ADD R5, R6, #0		; R5 = R6 = x5FFE
STR R5, R6, #0		; previous frame pointer (R5)
; setting frame pointer (R5)
ADD R5, R6, #0			; R5 = R6 = x5FFE

; Load global array ptr
LDR R0, R4, #0
ADD R6, R6, #-1		; R6 = x5FFD
STR R0, R6, #0		; int *array = ar;

; int total;
ADD R6, R6, #-1		; R6 = x5FFC

; Adds function parameters to stack
	LDR R0, R6, #1		; int a[] = array;
	ADD R6, R6, #-1		; R6 = x5FFB
	STR R0, R6, #0

	LDR R0, R4, #1		; int arraySize = MAX_ARRAY_SIZE
	ADD R6, R6, #-1		; R6 = x5FFA
	STR R0, R6, #0

	ADD R6, R6, #-1		; R6 = x5FF9

JSR SUMOFSQUARES	; return - R6 = x5FF9

; pop return value
LDR R0, R6, #0		; result = sumOfSquares(array, MAX_ARRAY_SIZE);
ADD R6, R6, #3		; R6 = x5FFC
STR R0, R6, #0		; store result in total

LDR R0, R6, #0
STR R0, R6, #4

ADD R6, R6, #2		; pop local variables; R6 = x5FFE

LDR R5, R6, #0
ADD R6, R6, #1		; R6 = x5FFF

LDR R7, R6, #0
ADD R6, R6, #1		; R6 = x6000
HALT
; MAIN END
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

GLOBAL_VARS		.BLKW #0	;	Global variables start here
MAX_ARRAY_SIZE	.FILL x0005	;	MAX_ARRAY_SIZE is a global variable and predefined
ARRAY_POINTER	.FILL x0002	;	ARRAY_POINTER points to the top of your array (5 elements)
				.FILL x0003
				.FILL x0005
				.FILL x0000
				.FILL x0001
STACK_PTR		.FILL x6000	;	STACK_PTR is a pointer to the bottom of the stack (x6000)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; params int a[], int arraySize
; returns int
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SUMOFSQUARES
	; int *a[]; R6 = x5FFB
	; int arraySize; R6 = x5FFA	
	; return value, R6 = x5FF9

	ADD R6, R6, #-1	; R6 = x5FF8
	STR R7, R6, #0	; sum of squares return address (R7)

	ADD R6, R6, #-1	; R6 = x5FF7
	STR R5, R6, #0	; previous frame pointer (R5)

	; int counter = 0;
	ADD R6, R6, #-1	; R6 = x5FF6
	AND R0, R0, #0
	STR R0, R6, #0

	; int sum = 0;
	ADD R6, R6, #-1	; R6 = x5FF5
	AND R0, R0, #0
	STR R0, R6, #0

	; while(counter < arraySize)
	WHILE_TRUE
		LDR R0, R6, #1	; counter
		LDR R1, R6, #5	; arraySize
		LDR R1, R1, #0	; loads reference to data

		; counter < arraySize
		NOT R0, R0
		ADD R0, R0, #1
		ADD R0, R0, R1
		BRz RETURN_SUMOFSQUARES

		; SQUARE prep
		; square(a[counter]) + sum;
			LDR R0, R6, #6	; array
			LDR R1, R6, #1	; counter
			ADD R0, R0, R1	; array[counter] = int

			ADD R6, R6, #-1	; x5FF4
			LDR R0, R0, #0	; load reference to data
			STR R0, R6, #0	; int at current index of array

			ADD R6, R6, #-1	; x5FF3
		JSR SQUARE		; return address - R6 = x5FF3

		LDR R0, R6, #0
		ADD R6, R6, #1	; R6 = x5FF4
		ADD R6, R6, #1	; R6 = x5FF5

		LDR R1, R6, #0
		ADD R0, R0, R1	; sum += square
		STR R0, R6, #0	; sum = square(a[counter]) + sum;

		; counter++;
		LDR R0, R6, #1	; counter, R6 = x5FF6
		ADD R0, R0, #1
		STR R0, R6, #1
		BRnzp WHILE_TRUE

	END_WHILE_TRUE

	RETURN_SUMOFSQUARES
		LDR R0, R6, #0	; R6 = x5FF5
		STR R0, R6, #4	; Store sum in x5FF9
		
		ADD R6, R6, #2	; R6 = x5FF7	; pop local variables

		LDR R5, R6, #0
		ADD R6, R6, #1	; R6 = x5FF8

		LDR R7, R6, #0
		ADD R6, R6, #1	; return address, R6 = x5FF9
RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; params int x
; returns int
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SQUARE
	; int x; R6 = x5FF4
	; return value, R6 = x5FF3
	ADD R6, R6, #-1
	STR R7, R6, #0	; sum of squares return address (R7), R6 = x5FF2

	ADD R6, R6, #-1
	STR R5, R6, #0	; previous frame pointer (R5), R6 = x5FF1

	; int product = 0
	LDR R0, R6, #2
	AND R0, R0, #0
	ADD R6, R6, #-1
	STR R0, R6, #0	; R6 = x5FF0

	; for (int i = 0; i < num; i++) <- x*x
		LDR R0, R6, #4
		ADD R0, R0, #-1
		BRz CASE_ONE

		AND R0, R0, #0	; int i = 0;
		ADD R6, R6, #-1
		STR R0, R6, #0	; R6 = x5FEF

		SQUARE_LOOP
			LDR R0, R6, #0
			ADD R0, R0, #1	; i++

			LDR R1, R6, #5	; x
			NOT R1, R1
			ADD R1, R1, #1

			ADD R1, R0, R1	; i - x
			BRp END_SQUARE_LOOP	; i < num? 
			STR R0, R6, #0

			LDR R0, R6, #1	; product
			LDR R1, R6, #5	; x

			ADD R0, R0, R1
			STR R0, R6, #1	; product += x
			BRnzp SQUARE_LOOP
		CASE_ONE
			AND R0, R0, #0
			ADD R0, R0, #1
			STR R0, R6, #0	; product
			BRnzp FI_SQUARE
		END_SQUARE_LOOP
			ADD R6, R6, #1	; pop int i, R6 = x5FF0
			BRnzp FI_SQUARE

	FI_SQUARE
		; pop values
		LDR R0, R6, #0	; product
		STR R0, R6, #3	; return product
		ADD R6, R6, #1	; R6 = x5FF1

		LDR R5, R6, #0
		ADD R6, R6, #1	; R6 = x5FF2

		LDR R7, R6, #0
		ADD R6, R6, #1	; return address, R6 = x5FF3
RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.END
     
