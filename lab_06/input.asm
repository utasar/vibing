.ORIG X4000

; Output = R0

;;;;;; Setup ;;;;;;
    ADD R6, R6, #-1
    STR R7, R6, #0

    ADD R6, R6, #-1
    STR R5, R6, #0

    ; Set frame ptr
    ADD R5, R6, #0
    
    ST R1, SAVE_R1
;;;;;;;;;;;;;;;;;;;

; int result;
ADD R6, R6, #-1
AND R0, R0, #0
STR R0, R6, #0

; for (int i = 0; i < 2; i++)
; if (char == '\n')
;   break;
ADD R6, R6, #-1
AND R0, R0, #0
ADD R0, R0, #2
STR R0, R6, #0  ; int i


GET_INPUT
    LDR R0, R6, #0  ; i
    ADD R0, R0, #-1
    STR R0, R6, #0
    BRn RETURN
    BRz TENS
    BRp ONES

    TENS
        GETC
        LD R1, ASCII
        ADD R0, R0, R1  ; input - 48
        BRn RETURN      ; '\n'

        ADD R6, R6, #-1
        STR R0, R6, #0  ; temp store

        ADD R6, R6, #-1
        AND R0, R0, #0
        STR R0, R6, #0  ; int product

        ADD R6, R6, #-1 ; int j
        AND R0, R0, #0
        ADD R0, R0, #10
        STR R0, R6, #1

        FOR_10
            LDR R0, R6, #1
            ADD R0, R0, #-1
            BRn BREAK
            STR R0, R6, #1

            LDR R0, R6, #2  ; product
            LDR R1, R6, #4  ; result

            ADD R0, R0, R1
            STR R0, R6, #2
            BRnzp FOR_10
        BREAK
            LDR R0, R6, #2
            STR R0, R6, #4  ; Store in result
            ADD R6, R6, #3  ; Pop local vars
            BRnzp RETURN
    ONES
        GETC
        LD R1, ASCII
        ADD R0, R0, R1  ; input - 48
        
        STR R0, R6, #1

        BRnzp GET_INPUT

;;;;;; RETURN ;;;;;;
RETURN
    ADD R6, R6, #2  ; Pop local vars

    LDR R0, R6, #-1 ; Sets R0 for return

    LDR R5, R6, #0
    ADD R6, R6, #1  ; Pop frame ptr

    LDR R7, R6, #0
    ADD R6, R6, #1  ; Pop return address

    LD R1, SAVE_R1

    RET
;;;;;;;;;;;;;;;;;;;;

ASCII .FILL #-48
SAVE_R1 .BLKW #1

.END
