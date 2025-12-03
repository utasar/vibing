.ORIG X5000

;;;;;; Setup ;;;;;;
    ADD R6, R6, #-1
    STR R7, R6, #0

    ADD R6, R6, #-1
    STR R5, R6, #0

    ; Set frame ptr
    ADD R5, R6, #0
    
    ST R0, SAVE_R0
    ST R1, SAVE_R1
;;;;;;;;;;;;;;;;;;;

; R0 = input number

ADD R6, R6, #-1
STR R0, R6, #0  ; input num

ADD R6, R6, #-1
AND R1, R1, #0
STR R1, R6, #0  ; x0

TENS
    LDR R0, R6, #0
    ADD R0, R0, #1
    STR R0, R6, #0

    LDR R0, R6, #1
    ADD R0, R0, #-10
    STR R0, R6, #1
    BRzp TENS

    ; Tens digit
    LDR R0, R6, #0
    ADD R0, R0, #-1
    BRz ONES        ; Skips over 0 in tens place

    LD R1, ASCII
    ADD R0, R0, R1
    STR R0, R6, #0
    OUT

    BRnzp ONES
ONES
    ; Ones digit
    LDR R0, R6, #1
    ADD R0, R0, #10
    LD R1, ASCII
    ADD R0, R0, R1
    STR R0, R6, #1

    OUT
    BRnzp RETURN

RETURN
    ADD R6, R6, #2

    LDR R5, R6, #0
    ADD R6, R6, #1  ; Pop frame ptr

    LDR R7, R6, #0
    ADD R6, R6, #1  ; Pop return address

    LD R0, SAVE_R0
    LD R1, SAVE_R1

    RET

SAVE_R0 .BLKW  #1
SAVE_R1 .BLKW #1
ASCII .FIlL #48

.END
